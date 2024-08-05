import 'package:get/get.dart';
import 'package:intern5/controllers/image_add_controller.dart';
import 'package:intern5/controllers/login_controller.dart';
import 'package:intern5/controllers/otp_match_controller.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/screen/NidCard/controller/nidController.dart';
import 'package:intern5/screen/cheakbook/controller/chequeBookController.dart';
import 'package:intern5/screen/license/controller/licenseController.dart';


final newLoginController = Get.put(NewLoginController());
final otpMatchController = Get.put(OTPMatchController());
final userInformationController = Get.put(UserInformationController());
final imageAddController = Get.put(ImageAddController());
final nidController = Get.put(NidController());
final licenseController = Get.put(LicenseController());
final chequeBookController = Get.put(ChequeBookController());