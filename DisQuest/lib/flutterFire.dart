import 'package:DisQuest/checkPoints.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as Path;

// TODO:
// Get checkpoints
// Add a Checkpoint
// Fetch game history
// Create a game

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

Future<AuthResult> registration(email, password) async {
  try {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((res) {
      return res;
    });
  } on AuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
    AuthResult ar; //Null
    return ar;
  } catch (e) {
    print(e);
    AuthResult ar; //Null
    return ar;
  }
}

Future<String> addHost(username, email, password) async {
  return await registration(email, password).then((auth) async {
    if (auth == null) {
      // If registration failed then return an empty string.
      print("Could not register");
      return '';
    }
    return await checkIfHostExists(username).then((ret) async {
      if (ret == true) {
        print("Cannot create a Host with that username, it already exists.");
        return '';
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

Future<AuthResult> checkSignIn(email, password) async {
  try {
    return await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  } on AuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
    AuthResult ar;
    return ar;
  }
}

Future<String> login(email, password) async {
  return await checkSignIn(email, password).then((auth) async {
    if (auth == null) {
      // If login failed then return an empty string.
      print("Could not login.");
      return '';
    }
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

// Future<void>
Future<DocumentReference> addCheckpoint(
    host, game, itemImagePath, hint, description) async {
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
    "item_image": itemImagePath,
    "description": description,
  });
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

Future<DocumentReference> joinGame(host, game, username) async {
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection(
          "players") //Note: You don't need to explicitly create the collection, it will be created implicitly.
      .add({"username": username, "ranking": 0}).then((player) {
    return player;
  });
}

// Future<void>
Future<DocumentReference> playerCheckpoint(host, game, checkpoint) async {
  // Checkpoint should be the
  return await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("player")
      .add({"checkpoint": checkpoint.documentID});
}

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
