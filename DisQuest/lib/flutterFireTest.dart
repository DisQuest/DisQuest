import 'package:cloud_firestore/cloud_firestore.dart';

// parameter "host" should be a string containing the id of the host document
Future<bool> addGame(host) async {
  // Fetches a game based on the host's ID
  String game = await getGame(host);
  if (game == "") {
    print("Cannot create another game, there is already a game in progress.");
    return false;
  }
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

Future<String> getGame(host) async {
  // Fetches a game based on the host's ID
  String game = '';
  // String host = "Aoa8dhXN1vSSLXY35dOs";
  QuerySnapshot games = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: false)
      .getDocuments();
  if (games.documents.length == 0) {
    return "";
  }
  game = games.documents[0].documentID;
  return game;
}

Future<String> addHost(username) async {
  DocumentReference host =
      await Firestore.instance.collection('Host').add({"username": username});
  return host.documentID;
}
