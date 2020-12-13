import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

abstract class BaseAuth {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);

  User currentUser();

  void resetUserPasswordWithEmail(String email);

  void signOut();

  // bool isAdmin();

  Future changeUserPassword(String newPassword);

  Future<String> userType();

  Future<List<String>> userFullName();
}

class Auth implements BaseAuth {
  FirebaseFirestore _firestore;
  FirebaseAuth _firebase;

  Auth() {
    Firebase.initializeApp().then((value) {
      _firebase = FirebaseAuth.instance;
      _firestore = FirebaseFirestore.instance;
    });
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential user = await _firebase
          //used .replaceAll to remove spaces
          .signInWithEmailAndPassword(
              email: email.replaceAll(new RegExp(r"\s+"), ""),
              password: password);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    // Firebase.initializeApp();
    UserCredential user = await _firebase.createUserWithEmailAndPassword(
        email: email.replaceAll(new RegExp(r"\s+"), ""), password: password);
    return user;
  }

  User currentUser() {
    User user = _firebase.currentUser;
  
    return user;
  }

  Future resetUserPasswordWithEmail(String email) async {
    // Firebase.initializeApp();
    await _firebase.sendPasswordResetEmail(
        email: email.replaceAll(new RegExp(r"\s+"), ""));
  }

  Future changeUserPassword(String newPassword) async {
    // Firebase.initializeApp();
    await _firebase.currentUser.updatePassword(newPassword);
  }

  Future<void> signOut() async {
    await _firebase.signOut();
  }

  Future<String> userType() async {
    String type = await _firestore
        .collection("operators")
        .doc(_firebase.currentUser.uid)
        .get()
        .then((value) => value.data()['admin']);
    return type;
  }

  Future<List<String>> userFullName() async {
    String fname = await _firestore
        .collection("operators")
        .doc(_firebase.currentUser.uid)
        .get()
        .then((value) => value.data()['fname']);
    String lname = await _firestore
        .collection("operators")
        .doc(_firebase.currentUser.uid)
        .get()
        .then((value) => value.data()['lname']);

    return [fname, lname];
  }

  // bool isAdmin(){
  //   var user = _firestore.collection('operators').doc(currentUser().uid).

  //   return user.admin;
  // }
}
