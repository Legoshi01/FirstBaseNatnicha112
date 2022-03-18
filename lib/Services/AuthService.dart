import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseAuth auth = FirebaseAuth.instance; //auth on firebase
FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<UserCredential?> registerUser(name, company, email, password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    users
        .add({
          'name': name,
          'company': company,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    return userCredential;
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future loginUser(email, password) async {
  try {
    return await auth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    print(e.code);
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}
