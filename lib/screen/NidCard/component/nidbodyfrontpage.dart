// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/media_query.dart';
import 'package:intern5/screen/NidCard/controller/nidController.dart';

//  **variable

Column partone() {
  // ignore: prefer_const_literals_to_create_immutables
  return Column(children: [
    Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 20.0),
      child: Text(
        'Upload your NID front part ',
        style: TextStyle(fontSize: 16, color: Color(0xFFBA9E42)),
      ),
    ),
    InkWell(
      onTap: () {
        nidController.Nid_front_pickImageFromGallery();
      },
      child: Padding(
        padding: EdgeInsets.all(MediaQuerypage.smallSizeWidth! * 2),
        child: Obx(
          () => nidController.nid_front_imageFile.value.isEmpty
              ? Image(
                  image: AssetImage('assets/nidimage1.png'),
                )
              : Image.file(
                  File(nidController.nid_front_imageFile.value.toString()),
                ),
        ),
      ),
    ),
  ]);
}
