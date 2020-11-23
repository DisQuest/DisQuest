document.addEventListener("DOMContentLoaded", async function(event) {
    const app = firebase.app();
    console.log(app);
    const firestore = firebase.firestore();
    
    // host's username:
    squid = "Squidward"

    //Create a host
    await firestore.collection('Host').doc().set({
        username: squid
    })

    //Fetch a host's ID
    const fetchHostId = await firestore.collection('Host').where("username", "==", squid).get();
    // const hostId = fetchHostId.data().id
    var allsquids = [] 
    fetchHostId.docs.map(doc => allsquids.push(doc.id))
    console.log(allsquids[0])

    //Create a host's game
    const createGame = await firestore.collection('Host').doc(allsquids[0]).collection("Game").add({
        isFinished: true
    })

    //Fetch a host's game 
    const host = await firestore.collection('Host').doc("Aoa8dhXN1vSSLXY35dOs").collection("Game").get()
    data.docs.map(doc => doc.data())
    console.log(host.data().username);
    
    // //Create a game
    // const inserthost = await firestore.collection('Host').doc().set({
    //     username: "Falafel Man"
    // })

    // fetch all of the host's games (i.e. history)
    const query = await firestore.collection('Host').doc("Aoa8dhXN1vSSLXY35dOs").collection("Game");
    console.log(query);
    const data = await query.get()
    console.log(data.docs.map(doc => doc.data()));
});

// funciton updatePost(e){

// }

function googleLogin() {
    const provider = new firebase.auth.GoogleAuthProvider();
    firebase.auth().signInWithPopup(provider).then(result => {
        const user = result.user;
        document.write(`Hello ${user.displayName}`);
        console.log(user);
    }).catch(console.log);
}