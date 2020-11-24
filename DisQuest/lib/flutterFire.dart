import 'package:cloud_firestore/cloud_firestore.dart';

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

/** Does your DB design account for all of these: @Osama Hafez
5) a user can join a game (quest) (This is technically done by them joining the game using the host's ID)
6) a user can complete a checkpoint for the game
7) a user can log in
 */

Future<String> addHost(username, email, password) async {
  // TODO: Add user using firebase auth first
  DocumentReference host = await Firestore.instance
      .collection('Host')
      .add({"username": username, "email": email, "password": password});
  //print(host.documentID);
  //print(username);
  return host.documentID;
}

Future<String> login(host, username) async {
  //TODO: Login using auth first
  QuerySnapshot host = await Firestore.instance
      .collection('Host')
      .where("username", isEqualTo: username).getDocuments();
  return host.documents[0].documentID;
}

Future<String> getCurrentGame(host) async {
  // Fetches a game based on the host's ID
  String game = '';
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

Future<List<DocumentSnapshot>> getHostHistory(host) async {
  // Fetches a game based on the host's ID
  List<DocumentSnapshot> game;
  // If we
  QuerySnapshot games = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .where('isFinished', isEqualTo: true)
      .getDocuments();
  if (games.documents.length != 0) {
    // A list of all of the game documents for a host (each containing the documentId)
    game = games.documents;
  }
  // This is null
  return game;
}

Future<bool> newGame(host) async {
  // Fetches a game based on the host's ID
  String game = await getCurrentGame(host);
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

// Future<void>
Future<void> addCheckpoint(host, game, itemImagePath, hint, description) async {
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

Future<List<DocumentSnapshot>> getCheckpoints(host, game) async {
  QuerySnapshot checkpoints = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .getDocuments();
  return checkpoints.documents;
}

Future<void> joinGame(host, game, username) async {
  DocumentReference player = await Firestore.instance
      .collection('Host')
      .document(host)
      .collection("Game")
      .document(game)
      .collection("checkpoints")
      .add({"username": username, "ranking": 0});
  return player;
}
