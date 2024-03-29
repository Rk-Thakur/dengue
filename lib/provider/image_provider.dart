import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final imageProvider =
    ChangeNotifierProvider.autoDispose((ref) => ImageProvider());

class ImageProvider extends ChangeNotifier {
  XFile? image;
  XFile? video;

  Future<void> getImage() async {
    final ImagePicker _picker = ImagePicker();
    image = await _picker.pickImage(source: ImageSource.gallery);

    notifyListeners();
  }

  Future<void> getmultipleImage() async {
    final ImagePicker _picker = ImagePicker();
  }

  Future<void> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    video = await _picker.pickVideo(source: ImageSource.gallery);

    notifyListeners();
  }
}
