// ignore_for_file: prefer_const_constructors, unnecessary_import, file_names, annotate_overrides, overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/controllers/image_add_controller.dart';
import 'package:intern5/controllers/login_controller.dart';
import 'package:intern5/controllers/otp_match_controller.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/screen/NidCard/NidCard.dart';
import 'package:intern5/screen/NidCard/component/NidBody.dart';
import 'package:intern5/screen/NidCard/controller/nidController.dart';
import 'package:intern5/screen/license/controller/licenseController.dart';
import 'package:intern5/screen/registation/registation.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../TextStyle.dart';
import '../../media_query.dart';

class Otpui extends StatefulWidget {
  Otpui({Key? key}) : super(key: key);
  static const name = 'Otpui';

  @override
  State<Otpui> createState() => _OtpuiState();
}

class _OtpuiState extends State<Otpui> with CodeAutoFill {
  /*
  final loginController = Get.find<NewLoginController>();
  final otpMatchController = Get.put(OTPMatchController());
  final imageAddController = Get.put(ImageAddController());
  final userInformationController = Get.put(UserInformationController());
  final nidController = Get.put(NidController());
  final licenseController = Get.put(LicenseController());
  */
  String? otpCode;
  String? appSignature;

  @override
  void codeUpdated() {
    setState(() {
      newLoginController.authData.value.otp != null
          ? otpCode = newLoginController.authData.value.otp.toString()
          : otpCode = "000000";
    });
  }

  @override
  void initState() {
    super.initState();
    listenthecode();
    codeUpdated();
  }

  listenthecode() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black)),
        elevation: 1.0,
        backgroundColor: Appcolor.lightBlue,
        title: Text(
          'OTP verification',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Center(
                child: Text(
              'Enter Your Verification Code',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            )),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 30),
              child: Text(
                'A verification code sent to your phone. Your code will expire within 30 minute',
                style: TextStyle(fontSize: 12, color: Color(0xFFB1B1B1)),
              ),
            ),
            PinFieldAutoFill(
              decoration: BoxLooseDecoration(
                  gapSpace: 20,
                  strokeColorBuilder:
                      PinListenColorBuilder(Colors.grey, Colors.grey),
                  bgColorBuilder: PinListenColorBuilder(
                      Color(0xFFECF2FE), Color(0xFFECF2FE))),
              currentCode: otpCode,
              codeLength: 6,
              onCodeChanged: (code) {
                if (code!.length == 6) {
                  //Navigator.pushNamed(context, Ragistation.name);
                }
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: InkWell(
                onTap: () {
                  // add operation which u want
                  Navigator.pushNamed(context, NidCard.name);
                  /*
                  otpMatchController.OTPCode.value =
                      newLoginController.authData.value.otp!.toString();
                  otpMatchController.accessToken.value =
                      newLoginController.authData.value.accessToken!;
                  otpMatchController.fetchOTPInformation(context);
                  Navigator.pushNamed(context, NidCard.name);

                  userInformationController.user_id.value =
                      newLoginController.authData.value.userId!.toString();
                  userInformationController.fetchUserInformation();

                  nidController.name.value =
                      userInformationController.usersData.value.user?[0].name ??
                          "";
                  nidController.email.value = userInformationController
                          .usersData.value.user?[0].email ??
                      "";
                  nidController.company.value = userInformationController
                          .usersData.value.user?[0].company ??
                      "";

                  licenseController.name.value =
                      userInformationController.usersData.value.user?[0].name ??
                          "";
                  licenseController.email.value = userInformationController
                          .usersData.value.user?[0].email ??
                      "";
                  licenseController.company.value = userInformationController
                          .usersData.value.user?[0].company ??
                      "";
                      */
                },
                child: Container(
                  width: MediaQuerypage.screenWidth,
                  height: MediaQuerypage.screenHeight! / 16,
                  decoration: BoxDecoration(
                    color: Appcolor.lightBlue,
                    //border: Border.all(color: Color(0xFFB1B1B1)),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                      child: Text(
                    'Submit Code',
                    style: Textstyle.botton,
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
