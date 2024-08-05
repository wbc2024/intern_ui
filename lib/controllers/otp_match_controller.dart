import 'dart:developer';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/api/api_request.dart';
import 'package:intern5/models/otp_match.dart';
import 'package:intern5/models/user_information.dart';
import 'package:intern5/screen/NidCard/NidCard.dart';

import 'user_local_storage.dart';


class OTPMatchController extends GetxController {

  var OTPData = OtpMatch().obs;
  var isLoading = true.obs;
  var OTPCode = "".obs;
  var accessToken = "".obs;

  Future<void> fetchOTPInformation(context) async {
    try {
      var response = await ApiRequest.fetchOTPInformation(OTPCode: OTPCode.value, accessToken: accessToken.value);
      if(response!=null){
        OTPData.value = response;
        await UserStorage.setValue("auth", (response.accessToken ?? ""));
        isLoading.value = false;
        Get.snackbar("API Data Fetched", "",snackPosition: SnackPosition.BOTTOM,);
        Navigator.pushNamed(context, NidCard.name);
      }else{
        print("Null");
        Get.snackbar("Something Went Wrong", "Response is Null",snackPosition: SnackPosition.BOTTOM,);
      }
    } catch (e){
      Get.snackbar("Unauthorized", e.toString(),snackPosition: SnackPosition.BOTTOM,);
    }
  }
}


