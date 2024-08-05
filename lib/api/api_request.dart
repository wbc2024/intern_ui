import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern5/controllers/user_local_storage.dart';
import 'package:intern5/models/auth.dart';
import 'package:intern5/models/edit_user.dart';
import 'package:intern5/models/otp_match.dart';
import 'package:intern5/models/user_information.dart';

class ApiRequest {
  static var baseUrl = 'https://anchorapp.realtimesolutionbd.com/api';
  static var client = http.Client();

  static Future<Auth?> login(
      {phone}) async {
    var url = "$baseUrl/create-user-otp-api";
    log(url.toString());
    var res = await client.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    },
        body: {
          "phone": phone,
        }
    );
    log(res.body.toString());
    return Auth.fromJson(jsonDecode(res.body));
  }
  static Future<EditUser?> editUser(
      {name,email,company,nid_front,license,password,access_token,cheque_book,profile_photo,nid_back}) async {
    var url = "$baseUrl/ancr-register-api";
    log(url.toString());
    var res = await client.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    },
        body: {
          "name": name,
          "email": email,
          "company": company,
          "nid_front": nid_front,
          "license": license,
          "password": password,
          "access_token": access_token,
          "cheque_book": cheque_book,
          "profile_photo": profile_photo,
          "nid_back": nid_back,
        }
    );
    log(res.body.toString());
    return EditUser.fromJson(jsonDecode(res.body));
  }
  static Future<Auth?> imageAdd(
      {required String name,required String email, required String company, required XFile uploadedPhoto, required String imageFieldName }) async {
    var access_token =
    (await UserStorage.getValue("auth"))!;
    var password = "123456";
    var url = "$baseUrl/ancr-register-api";
    //log(url.toString());
    final request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers["Accept"]="application/json";
    //request.headers[HttpHeaders.authorizationHeader]= Constants.auth;
    request.fields["name"]=name;
    request.fields["email"]=email;
    request.fields["company"]=company;
    request.fields["access_token"]=access_token;
    request.fields["password"]=password;
    final uploadedPhotoAsString = await uploadedPhoto.readAsBytes();
    request.files.add(http.MultipartFile.fromBytes(imageFieldName,uploadedPhotoAsString,
        filename: uploadedPhoto.name,
        contentType: MediaType("image/png","png")
    ));
    final response = await request.send();
    final a = await response.stream.bytesToString();
    log(a+" A");
    //var res = await http.Response.fromStream(response);
    //log(res.body.toString());
    //return Auth.fromJson(jsonDecode(res.body));
    return jsonDecode(a);
  }

  //Get Request
  static Future<UserInformation?> fetchUserInformation({required user_id}) async {

    var url = "$baseUrl/fetch-users/"+user_id.toString();
    log(url.toString());
    //var token = await UserStorage.getValue("auth")??"";
    //log(token.toString());
    var res = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      //HttpHeaders.authorizationHeader: token,
    });
    log(res.body.toString());
    return UserInformation.fromJson(jsonDecode(res.body));
  }
  static Future<OtpMatch?> fetchOTPInformation({required String OTPCode, required String accessToken}) async {

    var url = "$baseUrl/otp-match-api?otp=$OTPCode&access_token=$accessToken";
    log(url.toString());
    //var token = await UserStorage.getValue("auth")??"";
    //log(token.toString());
    var res = await client.get(Uri.parse(url), headers: {
      "Accept": "application/json",
      //HttpHeaders.authorizationHeader: token,
    });
    log(res.body.toString());
    return OtpMatch.fromJson(jsonDecode(res.body));
  }

}