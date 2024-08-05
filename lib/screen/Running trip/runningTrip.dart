// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/TextStyle.dart';
import 'package:intern5/media_query.dart';
import 'package:intern5/screen/ShipInfo/ShipInfromation.dart';
import 'package:intern5/screen/voyage/voyage_specification.dart';

class RunningTrip extends StatelessWidget {
  const RunningTrip({Key? key}) : super(key: key);
  static const name = "RunningTrip";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Running Trip', style: Textstyle.black),
          backgroundColor: Appcolor.lightBlue,
          actions: [],
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuerypage.screenHeight! * 0.01,
            ),
            Expanded(
                child: ListView.separated(
                    itemCount: 20,
                    separatorBuilder: (BuildContext context, int index) =>
                        // ignore: prefer_const_constructors
                        Divider(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: (){
                           Navigator.pushNamed(context, ShipInfomation.name);
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: MediaQuerypage.pixel! * 15,
                          // backgroundImage: AssetImage('assets/ship.png'),
                          child: ClipRRect(
                            child: Image.asset(
                              'assets/ship.png',
                              fit: BoxFit.fill,
                            ),
                            //borderRadius: BorderRadius.circular(MediaQuerypage.pixel! * 15),
                          ),
                        ),
                        title: Text(
                          'Jennifer Smith',
                        ),
                        subtitle: Text(
                          'It is a long established fact that a reader...',
                        ),
                        trailing: Column(children: [
                          Text(
                            'Dk-CH',
                          ),
                          Container(
                              height: MediaQuerypage.screenHeight! * 0.03,
                              width: MediaQuerypage.screenWidth! * 0.05,
                              decoration: BoxDecoration(
                                color: Appcolor.lightBlue,
                                borderRadius: BorderRadius.circular(30.5),
                              ),
                              child: Center(
                                  child: Text(
                                '2',
                              ))),
                        ]),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
