import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';
import 'firebase_user_alone.dart';

class AllFirebaseService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final logger = Logger();
  UserId userFromFirebase(user) {
    try {
      logger.w(user.uid);
      return user != null ? UserId(userId: user.uid) : null;
    } catch (e) {
      logger.e(e);
    }
  }

  Future createUser(email, password) async {
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var firebaseUser = result.user;
      logger.w(firebaseUser);
      return userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  trySignIn(email, password) async {
    try {
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      var firebaseUser = result.user;
      logger.w(firebaseUser);
      return userFromFirebase(firebaseUser);
    } catch (e) {
      print(e.toString());
    }
  }

  Future checkingFirebaseCollection(id) async {
    QuerySnapshot result = await firebaseFirestore
        .collection('users')
        .where('id', isEqualTo: id)
        .get()
        .then((value) {
      return value;
    });
  }
}
