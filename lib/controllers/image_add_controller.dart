// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:developer';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern5/api/api_request.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/controllers/user_local_storage.dart';

class ImageAddController extends GetxController {
  final userInformationController = Get.find<UserInformationController>();

  Future<void> imageAdd(
      {required XFile uploadedPhoto,
        required String name,
        required String email,
        required String company,
        required String imageFieldName}) async {
    try {
      var response = await ApiRequest.imageAdd(
          uploadedPhoto: uploadedPhoto,
          imageFieldName: imageFieldName,
          name: name,
          email: email,
          company: company);
      userInformationController.fetchUserInformation();
      log(response!.accessToken.toString());
      await UserStorage.setValue("auth", (response.accessToken ?? ""));
    } catch (e) {
      Get.snackbar(
        "Something is wrong",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

}
