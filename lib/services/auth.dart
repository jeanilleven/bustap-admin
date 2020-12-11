import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import '../partials/partials.dart';
abstract class BaseAuth {
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password);

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password);

  User currentUser();

  void resetUserPasswordWithEmail(String email);

  void signOut();

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

  User currentUser(){
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
        .collection("users")
        .doc(_firebase.currentUser.uid)
        .get()
        .then((value) => value.data()['type']);
    return type;
  }

  Future<List<String>> userFullName() async {
    String fname = await _firestore
        .collection("users")
        .doc(_firebase.currentUser.uid)
        .get()
        .then((value) => value.data()['f_name']);
    String lname = await _firestore
        .collection("users")
        .doc(_firebase.currentUser.uid)
        .get()
        .then((value) => value.data()['l_name']);

    return [fname, lname];
  }
}
