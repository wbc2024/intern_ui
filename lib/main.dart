// ignore_for_file: prefer_const_constructors, equal_keys_in_map

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intern5/Appcolor.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/controllers/user_local_storage.dart';
import 'package:intern5/screen/EnterShipquentity/EnterShipyourQuentity.dart';
import 'package:intern5/screen/Good/Goods.dart';
import 'package:intern5/screen/Inbox/inbox.dart';
import 'package:intern5/screen/NewDashboard/NewDashBoard.dart';
import 'package:intern5/screen/NidCard/NidCard.dart';
import 'package:intern5/screen/Otp/Otpui.dart';
import 'package:intern5/screen/Running%20trip/runningTrip.dart';
import 'package:intern5/screen/ShipInfo/ShipInfromation.dart';
import 'package:intern5/screen/Trip%20History/triphistory.dart';
import 'package:intern5/screen/accept%20and%20bid/acceptbid.dart';
import 'package:intern5/screen/cheakbook/Cheakbook.dart';
import 'package:intern5/screen/congratution/Congratuation.dart';
import 'package:intern5/screen/Apphome/dashboad.dart';
import 'package:intern5/screen/create%20new%20trip/createnewtrip.dart';
import 'package:intern5/screen/home/home.dart';
import 'package:intern5/screen/Inbox/Messageingui.dart';
import 'package:intern5/screen/license/License.dart';
import 'package:intern5/screen/login/login.dart';
import 'package:intern5/screen/new%20Home/NewHome.dart';
import 'package:intern5/screen/notification/notification.dart';
import 'package:intern5/screen/paymant%20method/Paymant_method.dart';
import 'package:intern5/screen/payment%20status/paymentstatus.dart';
import 'package:intern5/screen/setting/settingui.dart';
import 'package:intern5/screen/shipquentity/shipquentity.dart';
import 'package:intern5/screen/tracking/Tracking.dart';
import 'package:intern5/screen/tracking/view.dart';
import 'package:intern5/screen/trackingvoyage/Tracking_voyage.dart';
import 'package:intern5/screen/trip/trip.dart';
import 'package:intern5/screen/userInfromation/UserInformation.dart';
import 'package:intern5/screen/userInfromationedit/UserInformationEdit.dart';
import 'package:intern5/screen/voyage/Voyage.dart';
import 'package:intern5/screen/voyage/voyage_specification.dart';

import 'screen/building succesfull/buildingsuccesful.dart';
import 'screen/registation/registation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Appcolor.lightBlue,
      statusBarIconBrightness: Brightness.dark // status bar color
      ));
  var token = await UserStorage.getValue("auth");
  print(token);
  //runApp(const MyApp());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    locale: Locale('en', 'US'),
    theme: ThemeData(
      primarySwatch: Colors.grey,
    ),
    //home: token =="" ? MyHomePage(title: 'Flutter Demo Home Page'):NidCard(),
    home: MyHomePage(title: 'Flutter Demo Home Page'),
    routes: {
      Login.name: (context) => Login(),
      Ragistation.name: (context) => Ragistation(),
      NidCard.name: (context) => NidCard(),
      License.name: (context) => License(),
      CheakBook.name: (context) => CheakBook(),
      Shipquentiy.name: (context) => Shipquentiy(),
      Congratutation.name: (context) => Congratutation(),
      Otpui.name: (context) => Otpui(),
      YourShipquentity.name: (context) => YourShipquentity(),
      Dashboard.name: (context) => Dashboard(),
      Acceptbid.name: (context) => Acceptbid(),
      //Condition.name: (context) => Condition(),
      BuildinSuccesfull.name: (context) => BuildinSuccesfull(),
      Voyage.name: (context) => Voyage(),
      ShipInfo.name: (context) => ShipInfo(),
      Messageingui.name: (context) => Messageingui(),
      SettingUi.name: (context) => SettingUi(),
      Paymant_method.name: (context) => Paymant_method(),
      Tracking_voyage.name: (context) => Tracking_voyage(),
      NewDashboard.name: (context) => NewDashboard(),
      Trip.name: (context) => Trip(),
      Goods.name: (context) => Goods(),
      CreateNewTrip.name: (context) => CreateNewTrip(),
      NewHome.name: (conetex) => NewHome(),
      Tracking.name: (context) => Tracking(),
      UserInformation.name: (context) => UserInformation(),
      UserInformationEdit.name: (context) => UserInformationEdit(),
      Inbox.name: (context) => Inbox(),
      NotificationUI.name: (context) => NotificationUI(),
      //View.name: (context) => View(),
      RunningTrip.name: (context) => RunningTrip(),
      PaymentStatus.name: (context) => PaymentStatus(),
      TripHistoy.name: (context) => TripHistoy(),
      ShipInfomation.name: (context) => ShipInfomation(),
    },
  ));
}
/*
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: token =="" ? MyHomePage(title: 'Flutter Demo Home Page'):NidCard(),
      //initialRoute: Login.name,
      routes: {
        Login.name: (context) => Login(),
        Ragistation.name: (context) => Ragistation(),
        NidCard.name: (context) => NidCard(),
        License.name: (context) => License(),
        CheakBook.name: (context) => CheakBook(),
        Shipquentiy.name: (context) => Shipquentiy(),
        Congratutation.name: (context) => Congratutation(),
        Otpui.name: (context) => Otpui(),
        YourShipquentity.name: (context) => YourShipquentity(),
        Dashboard.name: (context) => Dashboard(),
        Acceptbid.name: (context) => Acceptbid(),
        //Condition.name: (context) => Condition(),
        BuildinSuccesfull.name: (context) => BuildinSuccesfull(),
        Voyage.name: (context) => Voyage(),
        ShipInfo.name: (context) => ShipInfo(),
        Messageingui.name: (context) => Messageingui(),
        SettingUi.name: (context) => SettingUi(),
        Paymant_method.name: (context) => Paymant_method(),
        Tracking_voyage.name: (context) => Tracking_voyage(),
        NewDashboard.name: (context) => NewDashboard(),
        Trip.name: (context) => Trip(),
        Goods.name: (context) => Goods(),
        CreateNewTrip.name: (context) => CreateNewTrip(),
        NewHome.name: (conetex) => NewHome(),
        Tracking.name: (context) => Tracking(),
        UserInformation.name: (context) => UserInformation(),
        UserInformationEdit.name: (context) => UserInformationEdit(),
        Inbox.name: (context) => Inbox(),
        NotificationUI.name: (context) => NotificationUI(),
        View.name: (context) => View(),
        RunningTrip.name: (context) => RunningTrip(),
        PaymentStatus.name: (context) => PaymentStatus(),
        TripHistoy.name:(context)=>TripHistoy(),
        ShipInfomation.name:(context)=>ShipInfomation(),
      },
    );
  }
}
*/
