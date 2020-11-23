import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getGame() async {
  // Fetches a game based on the host's ID
  String game = '';
  String host = "Aoa8dhXN1vSSLXY35dOs";
  // If we
  QuerySnapshot games = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: false)
      .getDocuments();
  if (games.documents[0] == Null) {
    return "";
  }
  game = games.documents[0].documentID;
  return game;
}

Future<bool> addGame() async {
  // Fetches a game based on the host's ID
  String game = await getGame();
  if (game == "") {
    print("Cannot create another game, there is already a game in progress.");
    return false;
  }
  String host = "Aoa8dhXN1vSSLXY35dOs";
  // If we
  await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .add({
    "isFinished": false,
  });
  // game = games.documents[0].documentID;
  return true;
}

Future<List<DocumentSnapshot>> getCheckpoints() async {
  String host = "Aoa8dhXN1vSSLXY35dOs";
  String game = await getGame();
  QuerySnapshot checkpoints = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .getDocuments();
  return checkpoints.documents;
}

// Future<void>

Future<void> addCheckpoint(itemImagePath, hint, description) async {
  String host = "Aoa8dhXN1vSSLXY35dOs";
  // add getHost
  String game = await getGame();
  DocumentReference checkpoint = await Firestore.instance
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
  return checkpoint;
}

List<DocumentSnapshot> addCheckpoint() async {
  String host = "Aoa8dhXN1vSSLXY35dOs";
  String game = getGame();
  QuerySnapshot checkpoints = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .getDocuments();
  return checkpoints.documents;
}

Future<void> read() async {
  await Firebase.initializeApp();

  FirebaseFirestore.instance
      .collection('Users')
      .where('name', isEqualTo: "test2")
      .get()
      .then((snapshot) {
    if (snapshot != null) {
      snapshot.docs.forEach((element) {
        print(element.id);
        print(element.data().toString());
      });
    } else {
      print("No data found");
    }
  });
  return;
}

Future<void> update() async {
  await Firebase.initializeApp();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  ref
      .doc('1234')
      .update({"name": "test1"})
      .then((value) => print("Success"))
      .catchError((error) => print(error.toString()));
  return;
}

Future<void> delete() async {
  await Firebase.initializeApp();
  CollectionReference ref = FirebaseFirestore.instance.collection('Users');
  ref
      .doc('9123')
      .delete()
      .then((value) => print("Success"))
      .catchError((error) => print(error.toString()));
  return;
}
