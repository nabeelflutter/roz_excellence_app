import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../../repository/auth_model.dart';

mixin BuyerProfileBehaviour{
  final imagePicker = ImagePicker();
  String? fileUrl;
  File? image;
  String? dob;
  late String dateTime;
  DateTime selectedDate=DateTime(1960);
  late String setDate;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailOrPhoneNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  AuthModel authModel = AuthModel();
  late Stream<DocumentSnapshot<Map<String, dynamic>>> getUserInFuture;

  void disposeUserInfoScreenTextControllers(){
    nameController.dispose();
    emailOrPhoneNumberController.dispose();
    dobController.dispose();
  }

//image from gallery
  Future<File?> getImageFromGallery() async {
    XFile? pickedFile = (await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50));
    if (pickedFile == null) return null;
    File imageFromGallery = File(pickedFile.path);
    return imageFromGallery;
  }

//image from camera
  Future<File?> getImageFromCamera() async {
    XFile? pickedFile = (await imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50));
    if (pickedFile == null) return null;
    File imageFromCamera = File(pickedFile.path);
    return imageFromCamera;
  }

//date picker
}