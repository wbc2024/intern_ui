
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/api/api_request.dart';
import 'package:intern5/controllers/user_local_storage.dart';
import 'package:intern5/models/auth.dart';
import 'package:intern5/screen/Otp/Otpui.dart';


class NewLoginController extends GetxController {
  var phone = "user@demo-link.com".obs;
  var authData = Auth().obs;
  TextEditingController phoneController= TextEditingController();
  late GlobalKey<FormState> formKey;

  Future<void> login(context) async {
    try {
      if (formKey.currentState!.validate()) {
        var response = await ApiRequest.login(phone: phone.value);
        if(response != null){
          if (response.accessToken != null) {
            //await UserStorage.setValue("auth", "Bearer " + (response.accessToken ?? ""));
            await UserStorage.setValue("auth", (response.accessToken ?? ""));
            authData.value=response;
            formKey.currentState!.dispose();
            //Get.to(() => const HomePage());
            Navigator.pushNamed(context, Otpui.name);
            Get.snackbar("Otp Gained", response.otp.toString(),snackPosition: SnackPosition.BOTTOM,);
          }
        }else{
          Get.snackbar("Unauthorized", response!.message.toString(),snackPosition: SnackPosition.BOTTOM,);
        }
      }
    } catch (e){
      Get.snackbar("Unauthorized", e.toString(),snackPosition: SnackPosition.BOTTOM,);
    }
  }
}


