import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some errror occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ) {
        //register user
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        User? user = userCredential.user;
        if (user != null) {
          res = "User created";
        }
        print(userCredential.user!.uid);

        String photoUrl =  await StorageMetHods().uploadImageToStorage(
          'profilePics',
          file,
          false,
        );

        //add user to our database
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          
          'username': username,
          'uid':userCredential.user!.uid,
          'email': email,
          'bio': bio,
          'followers':[],
          'following':[],
          'photoUrl':photoUrl,

        });
        res= "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        //login user
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res = "success";
      }
      else{
        res = "Please fill all the fields";
      }
    } 
     
    catch (e) {
      res = e.toString();
    }
    return res;
  }
}
