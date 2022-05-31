import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider =
    ChangeNotifierProvider.autoDispose((ref) => ImageProvider());

class ImageProvider extends ChangeNotifier {
  List<XFile>? images;
  XFile? image;
  XFile? image1;
  XFile? image2;

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);

    notifyListeners();
  }

  Future<void> getImage1() async {
    final ImagePicker _picker = ImagePicker();
    image1 = await _picker.pickImage(source: ImageSource.gallery);

    notifyListeners();
  }

  Future<void> getImage2() async {
    final ImagePicker _picker = ImagePicker();
    image2 = await _picker.pickImage(source: ImageSource.gallery);

    notifyListeners();
  }

  Future<void> getMultipeImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickMultiImage();
    images = image;
    notifyListeners();
  }
}
