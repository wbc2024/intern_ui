// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern5/api/api_request.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/controllers/image_add_controller.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/controllers/user_local_storage.dart';

class ChequeBookController extends GetxController {
  var name = "".obs;
  var email = "".obs;
  var company = "".obs;
  RxBool operation = true.obs;
  changeOperation() {
    operation.value = !operation.value;
  }

  var cheque_book_imageFile = ''.obs;
  //Open gallery
  ChequeBook_pickImageFromGallery() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    cheque_book_imageFile.value = image!.path;
    imageAddController.imageAdd(
        uploadedPhoto: image,
        company: company.value,
        email: email.value,
        name: name.value,
        imageFieldName: 'cheque_book');
  }
}
