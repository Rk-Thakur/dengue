import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dengue/model/faq.dart';
import 'package:dengue/model/post.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final crudProvider = Provider.autoDispose((ref) => CrudProvider());

class CrudProvider {
  CollectionReference dbpost = FirebaseFirestore.instance.collection('post');
  CollectionReference dbfaq = FirebaseFirestore.instance.collection('faq');

//post section
  Future<String> addpost({
    required XFile image,
    required String description,
  }) async {
    try {
      final imageId = DateTime.now().toString();
      final postId = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('postImage/$imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();

      await dbpost.add({
        'description': description,
        'image': url,
        'postId': postId,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  Stream<List<Post>> getData() {
    return dbpost.snapshots().map((event) => getPostsData(event));
  }

  List<Post> getPostsData(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      final json = doc.data() as Map<String, dynamic>;
      return Post(
          postId: json['postId'] ?? 'not null',
          description: json['description'] ?? 'not null',
          postImage: json['image'] ?? 'not null');
    }).toList();
  }

  //faq section
  Future<String> addfaq(
      {required String question, required String answer}) async {
    try {
      final faqId = DateTime.now().toString();
      await dbfaq.add({
        'faqId': faqId,
        'question': question,
        'answer': answer,
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return 'not success';
    }
  }

  Stream<List<Faq>> getFaq() {
    return dbfaq.snapshots().map((event) => getFaqdata(event));
  }

  List<Faq> getFaqdata(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      final json = doc.data() as Map<String, dynamic>;
      return Faq(
          faqId: json['faqId'] ?? 'not null',
          question: json['question'] ?? 'not null',
          answer: json['answer'] ?? 'not null');
    }).toList();
  }
}
