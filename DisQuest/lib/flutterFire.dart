import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getGame(host) async {
  // Fetches a game based on the host's ID
  String game = '';
  // If we
  QuerySnapshot games = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: false)
      .getDocuments();
  if (games.documents.length != 0) {
    game = games.documents[0].documentID;
  }
  return game;
}

Future<bool> addGame(host) async {
  // Fetches a game based on the host's ID
  String game = await getGame(host);
  if (game == "") {
    print("Cannot create another game, there is already a game in progress.");
    return false;
  }
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

// Future<String> addPlayer(host, game) async {
//   QuerySnapshot checkpoints = await Firestore.instance
//       .collection('Host')
//       .document(host)
//       .collection("Game")
//       .document(game)
//       .collection("checkpoints")
//       .getDocuments();
//   return checkpoints.documents;
// }