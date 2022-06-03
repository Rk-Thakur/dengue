import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dengue/model/user.dart';

final authProvider = StreamProvider.autoDispose(
    (ref) => FirebaseAuth.instance.authStateChanges());

final loginsignProvider = Provider.autoDispose((ref) => LoginSignUpProvider());

class LoginSignUpProvider {
  CollectionReference dbUser = FirebaseFirestore.instance.collection('users');

  //resgistration of new user
  Future<String> signUp({
    required String email,
    required String password,
    required String userName,
    required XFile image,
  }) async {
    try {
      final imageFile = File(image.path);
      final imageId = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('userImage/$imageId');
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      final responseUser = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await dbUser.add({
        'username': userName,
        'email': email,
        'password': password,
        'image': url,
        'userId': responseUser.user!.uid,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  //login of existing user
  Future<String> Login(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return 'success';
    } on FirebaseException catch (e) {
      return '${e.message}';
    }
  }

  //logout of the user
  Future<String> Logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return 'success';
    } on FirebaseException catch (e) {
      return '${e.message}';
    }
  }

  //get Single User
  Stream<Customer> getSingleUser() {
    final uid = auth.FirebaseAuth.instance.currentUser!.uid;
    final users = dbUser.where('userId', isEqualTo: uid).snapshots();
    return users.map((event) => singleUser(event));
  }

  Customer singleUser(QuerySnapshot querySnapshot) {
    return Customer.fromJson(
        querySnapshot.docs[0].data() as Map<String, dynamic>);
  }
}

//user stream
final userStream =
    StreamProvider.autoDispose((ref) => LoginSignUpProvider().getSingleUser());
