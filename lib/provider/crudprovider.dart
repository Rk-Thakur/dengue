import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dengue/model/faq.dart';
import 'package:dengue/model/hospital.dart';
import 'package:dengue/model/location.dart';
import 'package:dengue/model/message.dart';
import 'package:dengue/model/post.dart';
import 'package:dengue/screen/hospital.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final crudProvider = Provider.autoDispose((ref) => CrudProvider());
final hospitalProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getHospital());
final postProvider = StreamProvider((ref) => CrudProvider().getData());
final chatProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getMessage());
final locationProvider =
    StreamProvider.autoDispose((ref) => CrudProvider().getlocation());

class CrudProvider {
  CollectionReference dbpost = FirebaseFirestore.instance.collection('post');
  CollectionReference dbfaq = FirebaseFirestore.instance.collection('faq');
  CollectionReference dbdetection =
      FirebaseFirestore.instance.collection('denguedetection');
  CollectionReference dbhospital =
      FirebaseFirestore.instance.collection('hospital');
  CollectionReference dbAlarm = FirebaseFirestore.instance.collection('Alarm');
  CollectionReference dbchat = FirebaseFirestore.instance.collection('chats');
  //hospital section
  Future<String> addhospitaldetails(
      {required String name, required int number}) async {
    try {
      final hospitaldetailsid = DateTime.now().toString();
      await dbhospital.add({
        'hospitalname': name,
        'hospitalnumber': number,
        'hospitaldetailsid': hospitaldetailsid
      });
      return 'success';
    } on FirebaseException catch (e) {
      print("${e}");
      return 'not success';
    }
  }

  Stream<List<Hospitaldetail>> getHospital() {
    return dbhospital.snapshots().map((event) => getHospitaldata(event));
  }

  List<Hospitaldetail> getHospitaldata(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((doc) {
      final json = doc.data() as Map<String, dynamic>;
      return Hospitaldetail(
          hospital_id: json['hospitaldetailsid'] ?? 'Not Available',
          hospital_name: json['name'] ?? 'Not Available',
          hospital_number: json['number'] ?? 'Not Available');
    }).toList();
  }

  Future<String> hospitaldetailRemove({required String hospital_id}) async {
    try {
      await dbhospital.doc(hospital_id).delete();
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return '${e.message}';
    }
  }

//alarm section
  Future<String> addalarm(
      {required XFile image,
      required int time, 
      required String details}) async {
    try {
      final imageId = DateTime.now().toString();
      final alarmId = DateTime.now().toString();
      final ref = FirebaseStorage.instance.ref().child('postAlarm/ $imageId');
      final imageFile = File(image.path);
      await ref.putFile(imageFile);
      final url = await ref.getDownloadURL();
      await dbAlarm.add({
        'notification_image': url,
        'notification_time': time,
        'notification_id': alarmId,
        'notification_detail': details
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return "${e.message}";
    }
  }

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
        'imageid': imageId,
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

  Future<String> postRemove(
      {required String postId, required String imageid}) async {
    try {
      final ref = FirebaseStorage.instance.ref().child('postImage/$imageid');
      await ref.delete();
      await dbpost.doc(postId).delete();
      return 'Success';
    } on FirebaseException catch (e) {
      return '${e.message}';
    }
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

  Future<String> faqRemove({required String faqId}) async {
    try {
      await dbfaq.doc(faqId).delete();
      return 'success';
    } on FirebaseException catch (e) {
      return "${e.message}";
    }
  }

  //detection section
  Future<String> addDetectionArea(
      {required double lat,
      required double long,
      required XFile image,
      required String description}) async {
    try {
      final imageId = DateTime.now().toString();
      final detectionId = DateTime.now().toString();
      final ref =
          FirebaseStorage.instance.ref().child('detectionImage/$imageId');

      final image1file = File(image.path);

      await ref.putFile(image1file);

      final url = await ref.getDownloadURL();

      await dbdetection.add({
        'lat': lat,
        'long': long,
        'image': url,
        'description': description,
        'detectionId': detectionId
      });
      return 'success';
    } on FirebaseException catch (e) {
      print(e);
      return '${e.message}';
    }
  }

  Future<String> add_message([
    String message = '',
    String userId = '',
    String profilepicture = '',
    String username = '',
    XFile? postimage,
  ]) async {
    // {required String text,
    // required String userId,
    // required String userImage,
    // required String username}) async {
    try {
      String imageId = '';
      String url = '';
      if (postimage != null) {
        imageId = DateTime.now().toString();
        final ref = FirebaseStorage.instance.ref().child('postchat/$imageId');
        final imageFile = File(postimage.path);
        await ref.putFile(imageFile);
        url = await ref.getDownloadURL();
      }

      await dbchat.add({
        'message': message,
        'userId': userId,
        'profilepicture': profilepicture,
        'username': username,
        'createdAt': Timestamp.now(),
        'postimage': url,
      });
      return 'success';
    } on FirebaseException catch (e) {
      return '${e.message}';
    }
  }

  Stream<List<message>> getMessage() {
    return dbchat
        .orderBy('createdAt', descending: false)
        .snapshots()
        .map((event) => getMessageData(event));
  }

  List<message> getMessageData(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return message(
          json['message'] ?? 'not text',
          json['profilepicture'] ?? 'not availabel',
          json['postimage'] ?? 'not available',
          json['userId'] ?? 'not available',
          json['username'] ?? 'not available');
    }).toList();
  }

  Stream<List<location>> getlocation() {
    return dbdetection.snapshots().map((event) => getLocation(event));
  }

  List<location> getLocation(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((e) {
      final json = e.data() as Map<String, dynamic>;
      return location(
          detection_id: json['detection_id'] ?? 'not null',
          description: json['description'] ?? 'not null',
          image: json['image'] ?? 'not null',
          lat: json['lat'] ?? 'not null',
          long: json['long'] ?? 'not null');
    }).toList();
  }
}
