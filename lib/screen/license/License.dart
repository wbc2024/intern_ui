// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/TextStyle.dart';
import 'package:intern5/appbar.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/media_query.dart';
import 'package:intern5/screen/cheakbook/Cheakbook.dart';
import 'package:intern5/screen/license/controller/licenseController.dart';

class License extends StatelessWidget {
  const License({Key? key}) : super(key: key);
  static const name = 'License';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar_back_button(context, 'License Paper'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/ankornid.png'),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Identification',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  Text(
                    'Capture and upload your License Paper',
                    style: TextStyle(color: Color(0xFFBA9E42), fontSize: 18),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Image(
                      image: AssetImage('assets/nidimage2.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      licenseController.License_pickImageFromGallery();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuerypage.smallSizeWidth! * 2),
                      child: Obx(
                            () => licenseController.license_imageFile.value.isEmpty
                            ? Image(
                          image: AssetImage('assets/nidimage1.png'),
                        )
                            : Image.file(
                          File(licenseController.license_imageFile.value.toString()),
                        ),
                      ),
                    ),
                  ),
                  /*
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image(
                      image: AssetImage('assets/nidimage3.png'),
                    ),
                  ),
                  */
                  /**
                  * buttom add
                  */
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () {
                        // add operation which u want
                        Navigator.pushNamed(context, CheakBook.name);
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
                          'Next',
                          style: Textstyle.botton,
                        )),
                      ),
                    ),
                  ),
                  /*
                // Skif button
                */
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () {
                        // add operation which u want
                        //skif button
                        Navigator.pushNamed(context, CheakBook.name);
                      },
                      child: Container(
                        width: MediaQuerypage.screenWidth,
                        height: MediaQuerypage.screenHeight! / 16,
                        decoration: BoxDecoration(
                          color: Appcolor.lightBlue,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Center(
                            child: Text(
                          'Skip',
                          style: Textstyle.botton,
                        )),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
