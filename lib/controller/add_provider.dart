import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProvider extends ChangeNotifier {
  String? selectCategory;
  List<String> category = ['adidas', 'nike', 'puma'];

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  clearControllers() {
    nameController.clear();
    priceController.clear();
    discriptionController.clear();
    brand = null;
  }

  File? brand;
  final ImagePicker imagePicker = ImagePicker();
  Future getImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);

    if (pickedFile != null) {
      brand = File(pickedFile.path);
      log("Image picked");
      notifyListeners();
    }
  }
}
