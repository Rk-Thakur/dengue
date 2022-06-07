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
  CollectionReference dbdetection =
      FirebaseFirestore.instance.collection('denguedetection');
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

  //detection section
  Future<String> addDetectionArea(
      {required double lat,
      required double long,
      required XFile image1,
      required XFile image2,
      required XFile image3,
      required String description}) async {
    try {
      final imageId = DateTime.now().toString();
      final detectionId = DateTime.now().toString();
      final ref =
          FirebaseStorage.instance.ref().child('detectionImage/$imageId');
      final ref1 =
          FirebaseStorage.instance.ref().child('detectionImage/$imageId');
      final ref2 =
          FirebaseStorage.instance.ref().child('detectionImage/$imageId');
      final image1file = File(image1.path);
      final image2file = File(image2.path);
      final image3file = File(image3.path);
      await ref.putFile(image1file);
      await ref1.putFile(image2file);
      await ref2.putFile(image3file);

      final url = await ref.getDownloadURL();
      final url1 = await ref1.getDownloadURL();
      final url2 = await ref2.getDownloadURL();
      await dbdetection.add({
        'lat': lat,
        'long': long,
        'image1': url,
        'image2': url1,
        'image3': url2,
        'description': description,
        'detectionId': detectionId
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return '${e.message}';
    }
  }
}