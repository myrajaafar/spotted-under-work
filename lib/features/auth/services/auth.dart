// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth {
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  late Map<String, dynamic> user;

  User? get curretUser => _firebaseAuth.currentUser;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signin({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> signup({
    required String email,
    required String password,
    required username,
  }) async =>
      await {
        user = {
          "name": username,
          "email": email,
        },
        _db.collection("Users").add(user),
        _firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password),
      };
  Future<void> singout() async {
    await _firebaseAuth.signOut();
  }
}
