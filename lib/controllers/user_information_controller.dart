import 'dart:developer';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern5/api/api_request.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/controllers/image_add_controller.dart';
import 'package:intern5/models/user_information.dart';


class UserInformationController extends GetxController {
  var usersData = UserInformation().obs;
  var progressBar = 0.obs;
  var progressBarPercent = 0.obs;
  var isLoading = true.obs;
  var user_id = "".obs;
  var name = "".obs;
  var email = "".obs;
  var company = "".obs;
  RxBool operation = true.obs;
  changeOperation() {
    operation.value = !operation.value;
  }

  var profile_picture_imageFile = ''.obs;
  //Open gallery
  ProfilePicture_pickImageFromGallery() async {
    final XFile? image =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    profile_picture_imageFile.value = image!.path;
    imageAddController.imageAdd(
        uploadedPhoto: image,
        company: company.value,
        email: email.value,
        name: name.value,
        imageFieldName: 'profile_photo');
  }

  Future<void> fetchUserInformation() async {
    log(user_id.toString());
    try {
      var response = await ApiRequest.fetchUserInformation(user_id: user_id);
      if(response!=null){
        usersData.value = response;
        log(user_id.toString());
        isLoading.value = false;
        Get.snackbar("API Data Fetched", "",snackPosition: SnackPosition.BOTTOM,);
        progressBar = 0.obs;
        progressBarPercent = 0.obs;
        checkProgress();
        //isLoading.value = false;
      }else{
        Get.snackbar("Something Went Wrong", "Response is Null",snackPosition: SnackPosition.BOTTOM,);
      }
    } catch (e){
      Get.snackbar("Unauthorized", e.toString(),snackPosition: SnackPosition.BOTTOM,);
    }
  }
  checkProgress(){
    if(usersData.value.user?[0].name != null || usersData.value.user?[0].name != ""){
      progressBar++;
      progressBarPercent += 10;
    }
    if(usersData.value.user?[0].phone != null || usersData.value.user?[0].phone != ""){
      progressBar++;
      progressBarPercent += 10;
    }
    if(usersData.value.user?[0].email != null || usersData.value.user?[0].email != ""){
      progressBar++;
      progressBarPercent += 10;
    }
    if(usersData.value.user?[0].company != null || usersData.value.user![0].company! != ""){
      progressBar++;
      progressBarPercent += 10;
    }
    if(usersData.value.user?[0].userphotos?.profilePhoto != null){
      progressBar++;
      progressBarPercent += 10;
    }
    if(usersData.value.user?[0].userphotos?.nidFront != null && usersData.value.user?[0].userphotos?.nidBack != null){
      progressBar++;
      progressBarPercent += 20;
    }
    if(usersData.value.user?[0].userphotos?.license != null){
      progressBar++;
      progressBarPercent += 10;
    }
    if(usersData.value.user?[0].userphotos?.chequeBook != null){
      progressBar++;
      progressBarPercent += 10;
    }
  }
}


