// ignore_for_file: override_on_non_overriding_member, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/TextStyle.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/media_query.dart';

class UserInformationEdit extends StatelessWidget {
  const UserInformationEdit({Key? key}) : super(key: key);
  static const name = 'userinfoedit';
  static const baseUrl = "https://anchorapp.realtimesolutionbd.com/";
  @override
  Widget build(BuildContext context) {
    MediaQuerypage.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile'),
        ),
        body: Obx(() => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: userInformationController.progressBar.value.toInt(),
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(
                                  color: Appcolor.lightBlue,
                                  borderRadius: BorderRadiusDirectional.all(
                                      Radius.circular(10.0))),
                            )),
                        Expanded(
                            flex: 9 - userInformationController.progressBar.value.toInt(),
                            child: Container(
                                //padding: EdgeInsets.all(20.0),
                                //child: FittedBox(child: Text(controller.progressBarPercent.value.toString()+"%")),
                                )),
                        Expanded(
                            flex: 3,
                            child: Container(
                              padding: EdgeInsets.all(20.0),
                              child: FittedBox(
                                  child: Text(userInformationController
                                          .progressBarPercent.value
                                          .toString() +
                                      "%")),
                            )),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(
                              onTap: () {
                                // add operation which u want
                                //Skif button
                                //Navigator.pushNamed(context, UserInformationEdit.name);
                              },
                              child: Container(
                                width: MediaQuerypage.screenWidth,
                                height: MediaQuerypage.screenHeight! / 16,
                                decoration: BoxDecoration(
                                  color: Appcolor.lightBlue,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                child: Center(
                                    child: Text(
                                  'Save',
                                  style: Textstyle.botton,
                                )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  userInformationController.isLoading.value == true
                      ? Center(
                          child: FittedBox(
                              child: Text(
                            "Loading",
                            style: Textstyle.userinfromation_imageheader,
                          )),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: ,
                            children: [
                              InkWell(
                                onTap: () {
                                  userInformationController.ProfilePicture_pickImageFromGallery();
                                },
                                child: Padding(
                                  padding: EdgeInsets.all(MediaQuerypage.smallSizeWidth! * 2),
                                  child: Obx(
                                        () => userInformationController.profile_picture_imageFile.value.isEmpty
                                        ? Image(
                                      image: AssetImage('assets/nidimage1.png'),
                                    )
                                        : Image.file(
                                      File(userInformationController.profile_picture_imageFile.value.toString()),
                                    ),
                                  ),
                                ),
                              ),
                              /*
                              controller.usersData.value.user?[0].userphotos
                                          ?.profilePhoto ==
                                      null
                                  ? Center(
                                      child: Image(
                                          image: AssetImage('assets/user.png')))
                                  : Center(
                                      child: Image(
                                          image: NetworkImage(baseUrl +
                                              (controller
                                                      .usersData
                                                      .value
                                                      .user?[0]
                                                      .userphotos
                                                      ?.profilePhoto ??
                                                  "")))),
                              SizedBox(
                                height: MediaQuerypage.screenHeight! * 0.02,
                              ),
                              */
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left:
                                          MediaQuerypage.safeBlockHorizontal! *
                                              2),
                                  alignment: Alignment.centerLeft,
                                  height: MediaQuerypage.screenHeight! * 0.05,
                                  width: MediaQuerypage.screenWidth,
                                  //child: Text(controller.usersData.value.user?[0].name??""),
                                  child: Text("Enter Your Name"),
                                ),
                              ),
                              Card(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left:
                                          MediaQuerypage.safeBlockHorizontal! *
                                              2),
                                  alignment: Alignment.centerLeft,
                                  height: MediaQuerypage.screenHeight! * 0.05,
                                  width: MediaQuerypage.screenWidth,
                                  //child: Text(controller.usersData.value.user?[0].phone??""),
                                  child: Text("Enter Your Phone Number"),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.only(
                                    left: MediaQuerypage.safeBlockHorizontal! *
                                        2),
                                alignment: Alignment.centerLeft,
                                height: MediaQuerypage.screenHeight! * 0.05,
                                width: MediaQuerypage.screenWidth,
                                //child: Text(controller.usersData.value.user?[0].email??""),
                                child: Text("Enter Your Email"),
                              ),
                              SizedBox(
                                height: MediaQuerypage.screenHeight! * 0.01,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.only(
                                    left: MediaQuerypage.safeBlockHorizontal! *
                                        2),
                                alignment: Alignment.centerLeft,
                                height: MediaQuerypage.screenHeight! * 0.05,
                                width: MediaQuerypage.screenWidth,
                                //child: Text(controller.usersData.value.user?[0].company??""),
                                child: Text("Enter Your Company Name"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuerypage.screenHeight! * 0.05),
                                child: Text(
                                  'Nid Front Part',
                                  style: Textstyle.userinfromation_imageheader,
                                ),
                              ),
                              //Image(image: AssetImage('assets/nid.jpg')),
                              userInformationController.usersData.value.user?[0].userphotos
                                  ?.nidFront ==
                                  null
                                  ? Center(
                                child: FittedBox(
                                    child: Text(
                                      "No Photo Available",
                                      style: Textstyle
                                          .userinfromation_imageheader,
                                    )),
                              )
                                  : Center(
                                  child: Image(
                                      image: NetworkImage(baseUrl +
                                          (userInformationController
                                              .usersData
                                              .value
                                              .user?[0]
                                              .userphotos
                                              ?.nidFront ??
                                              "")))),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuerypage.screenHeight! * 0.05),
                                child: Text(
                                  'Nid Back Part',
                                  style: Textstyle.userinfromation_imageheader,
                                ),
                              ),
                              //Image(image: AssetImage('assets/nid.jpg')),
                              userInformationController.usersData.value.user?[0].userphotos
                                  ?.nidBack ==
                                  null
                                  ? Center(
                                child: FittedBox(
                                    child: Text(
                                      "No Photo Available",
                                      style: Textstyle
                                          .userinfromation_imageheader,
                                    )),
                              )
                                  : Center(
                                  child: Image(
                                      image: NetworkImage(baseUrl +
                                          (userInformationController
                                              .usersData
                                              .value
                                              .user?[0]
                                              .userphotos
                                              ?.nidBack ??
                                              "")))),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuerypage.screenHeight! * 0.05),
                                child: Text(
                                  'Licece Part',
                                  style: Textstyle.userinfromation_imageheader,
                                ),
                              ),
                              //Image(image: AssetImage('assets/nid.jpg')),
                              userInformationController.usersData.value.user?[0].userphotos
                                  ?.license ==
                                  null
                                  ? Center(
                                child: FittedBox(
                                    child: Text(
                                      "No Photo Available",
                                      style: Textstyle
                                          .userinfromation_imageheader,
                                    )),
                              )
                                  : Center(
                                  child: Image(
                                      image: NetworkImage(baseUrl +
                                          (userInformationController
                                              .usersData
                                              .value
                                              .user?[0]
                                              .userphotos
                                              ?.license ??
                                              "")))),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: MediaQuerypage.screenHeight! * 0.05),
                                child: Text(
                                  'Cheque Book Part',
                                  style: Textstyle.userinfromation_imageheader,
                                ),
                              ),
                              //Image(image: AssetImage('assets/nid.jpg')),
                              userInformationController.usersData.value.user?[0].userphotos
                                  ?.chequeBook ==
                                  null
                                  ? Center(
                                child: FittedBox(
                                    child: Text(
                                      "No Photo Available",
                                      style: Textstyle
                                          .userinfromation_imageheader,
                                    )),
                              )
                                  : Center(
                                  child: Image(
                                      image: NetworkImage(baseUrl +
                                          (userInformationController
                                              .usersData
                                              .value
                                              .user?[0]
                                              .userphotos
                                              ?.chequeBook ??
                                              "")))),
                            ],
                          ),
                        ),
                ],
              ),
            )),
      ),
    );
  }
}
