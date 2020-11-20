document.addEventListener("DOMContentLoaded", event => {
    const app = firebase.app();
    console.log(app);
    const firestore = firebase.firestore();
    const myPost = firestore.collection('posts').doc('firstpost');
    myPost.onSnapshot(doc => {
        console.log(doc.data());
        var data = doc.data();
        document.write(data.views + `<br>`);
        document.write(data.createdAt + `<br>`);
    })
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