// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/TextStyle.dart';
import 'package:intern5/media_query.dart';

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);
  static const name="view";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text('Tracking',style: Textstyle.black,),
            backgroundColor: Appcolor.lightBlue,
          ),
          body: Column(
            children: [
              Image(
                height: MediaQuerypage.screenHeight! * 0.4,
                width: MediaQuerypage.screenWidth,
                fit: BoxFit.fill,
                image: AssetImage('assets/maps.png'),
              ),
              Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    title: Text('Company Name:'),
                  ),
                  ListTile(
                    title: Text('Ship Category:'),
                  ),
                  ListTile(
                    title: Text('Admin'),
                  ),
                  ListTile(
                    title: Text('Present Location:'),
                  ),
                  ListTile(
                    title: Text('Setting'),
                  ),
                ],
              )),
            ],
          )),
    );
  }
}
