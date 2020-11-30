import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as Path;

// TODO:
// Fetch game history

// Done:
// Sign up (addHost)
// fetch a game by host (getCurrentGame)
// create a new game (newGame)
// Add a checkpoint (addCheckpoint)
// a user can join a game (quest) (This is technically done by them joining the game using the host's ID)
// 6) a user can complete a checkpoint for the game
// 7) a user can log in

// Does your DB design account for all of these: @Osama Hafez? I think so

Future<bool> checkIfHostExists(username) async {
  // Helper for addHost
  return await Firestore.instance
      .collection('Host')
      .where("username", isEqualTo: username)
      .getDocuments()
      .then((host) {
    if (host.documents.length != 0) {
      return true;
    }
    return false;
  });
}

Future<dynamic> registration(email, password) async {
  // Actually create an email/password authentication pair using firebase auth
  try {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      return res;
    });
  } on PlatformException catch (e) {
    return e;
  } on AuthException catch (e) {
    return e;
  } on Exception catch (e) {
    return e;
  }
}

Future<dynamic> addHost(username, email, password) async {
  // Check if the host exists, then try and register them, if all passes then add them to the host collection
  return await checkIfHostExists(username).then((ret) async {
    if (ret == true) {
      print("Cannot create a Host with that username, it already exists.");
      return '';
    }
    return await registration(email, password).then((auth) async {
      if (auth == null) {
        // If registration failed then return an empty string.
        print("Could not register.");
        return '';
      } else if (auth is Exception) {
        return auth;
      }

      print("Adding user");
      return await Firestore.instance
          .collection('Host')
          .add({"username": username, "email": email}).then((host) {
        return host.documentID;
      });
    });
  });
}

Future<dynamic> checkSignIn(email, password) async {
  // Helper for login, it actually checks authentication
  try {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on PlatformException catch (e) {
    return e;
  } on AuthException catch (e) {
    return e;
  } on Exception catch (e) {
    return e;
  }
}

Future<dynamic> login(email, password) async {
  // After authenticating, fetch the user's document ID
  return await checkSignIn(email, password).then((auth) async {
    if (auth == null) {
      // If login failed then return an empty string.
      print("Could not login.");
      return '';
    } else if (auth is Exception) {
      return auth;
    }
    // check type
    return await Firestore.instance
        .collection('Host')
        .where("email", isEqualTo: email)
        .where("password", isEqualTo: password)
        .getDocuments()
        .then((host) {
      print("Host information being fetched:");
      print(host.documents[0]);
      // Now we should have the host's username, and we will use as the "game Id"
      if (host != null && host.documents.isNotEmpty) {
        return host.documents[0].documentID;
      } else {
        //
        return '';
      }
    });
  });
}

Future<String> getCurrentGame(host) async {
  // Fetches a game based on the host's ID
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: false)
      .getDocuments()
      .then((games) {
    String game = '';
    if (games.documents.length != 0) {
      game = games.documents[0].documentID;
    }
    return game;
  });
}

Future<DocumentReference> newGame(host) async {
  // Fetches a game based on the host's ID
  return await getCurrentGame(host).then((game) async {
    if (game == "") {
      print("Cannot create another game, there is already a game in progress.");
      DocumentReference empty;
      return empty;
    }
    return await Firestore.instance
        .collection('Host')
        .document(host)
        .collection("Game")
        .add({
      "isFinished": false,
    });
  });
}

Future<List<DocumentSnapshot>> getHostHistory(host) async {
  // Fetches a game based on the host's ID
  List<DocumentSnapshot> game;
  // If we
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: true)
      .getDocuments()
      .then((games) {
    if (games.documents.length != 0) {
      // A list of all of the game documents for a host (each containing the documentId)
      game = games.documents;
    }
    return game;
  });
}

Future<DocumentReference> addCheckpoint(
    host, game, image, hint, description) async {
  // Add a checkpoint as a host
  // Params: HostId, GameId, image, hint text, description text
  // Returns a document reference to the checkpoint
  return uploadFile(image).then((ret) async {
    return await Firestore.instance
        .collection('Host')
        .document(host)
        .collection("Game")
        .document(game)
        .collection("checkpoints")
        .add({
      "host": host,
      "game_id": game,
      "hint": hint,
      "item_image": 'images/${Path.basename(image.path)}',
      "description": description,
      "players": []
    });
  });
}

Future<void> removeCheckpoint(host, game, checkpoint) async {
  // Allows a host to delete a checkpoint
  // Params: HostId, GameId, CheckpointId
  Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .document(checkpoint)
      .delete();
}

Future<List<DocumentSnapshot>> getCheckpoints(host, game) async {
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .getDocuments()
      .then((checkpoints) {
    return checkpoints.documents;
  });
}


Future<dynamic> getCheckpoint(host, game, checkpoint) async {
  DocumentReference dr = Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .document(checkpoint);
  
  StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('images/${Path.basename(dr.path)}');
      
  return storageReference.getDownloadURL();//.getStorage();

}

Future<DocumentReference> joinGame(host, game, username) async {
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection(
          "players") //Note: You don't need to explicitly create the collection, it will be created implicitly.
      .add({"username": username}).then((player) {
    return player;
  });
}

// Future<void>
Future<void> passCheckpoint(host, game, player, checkpoint) async {
  // Checkpoint and player parameters should be the actual id of the documents
  await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .document(checkpoint)
      .updateData({"players": FieldValue.arrayUnion(checkpoint)});
  // This creates a many to many relationship
}

Future<void> closeGame(host) async {
  // Fetches a game based on the host's ID
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: false)
      .getDocuments()
      .then((games) {
    String game = '';
    if (games.documents.length != 0) {
      Firestore.instance
          .collection('Host')
          .document(host)
          .collection("Game")
          .document(game)
          .updateData({"isFinished": true});
    }
  });
}

// File Manipulation helper functions
// -------------------------------------------------------------------------------

Future<bool> uploadFile(image) async {
  StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('images/${Path.basename(image.path)}');
  StorageUploadTask uploadTask = storageReference.putFile(image);
  await uploadTask.onComplete;
  print('File Uploaded');
  return true;
}

Future<FirebaseStorage> getFile(image) async {
  StorageReference storageReference = FirebaseStorage.instance
      .ref()
      .child('images/${Path.basename(image.path)}');
  return storageReference.getStorage();
}
