// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, duplicate_ignore, file_names

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/TextStyle.dart';
import 'package:intern5/appbar.dart';
import 'package:intern5/controllers/controllers.dart';
import 'package:intern5/media_query.dart';
import 'package:intern5/screen/NewDashboard/NewDashBoard.dart';
import 'package:intern5/screen/cheakbook/controller/chequeBookController.dart';
import 'package:intern5/screen/congratution/Congratuation.dart';

class CheakBook extends StatelessWidget {
  const CheakBook({Key? key}) : super(key: key);
  static const name = 'CheakBook';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar_back_button(context, 'Cheque Book'),
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
                    'Capture and upload your Cheque Book',
                    style: TextStyle(color: Color(0xFFBA9E42), fontSize: 18),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Image(
                      image: AssetImage('assets/nidimage4.png'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      chequeBookController.ChequeBook_pickImageFromGallery();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(MediaQuerypage.smallSizeWidth! * 2),
                      child: Obx(
                            () => chequeBookController.cheque_book_imageFile.value.isEmpty
                            ? Image(
                          image: AssetImage('assets/nidimage1.png'),
                        )
                            : Image.file(
                          File(chequeBookController.cheque_book_imageFile.value.toString()),
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
                        Navigator.pushNamed(context, NewDashboard.name);
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
                  //**
                  //*Skif butto
                  //*//

                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: () {
                        // add operation which u want
                        //Skif button
                        Navigator.pushNamed(context, NewDashboard.name);
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
