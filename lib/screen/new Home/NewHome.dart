// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern5/controllers/user_information_controller.dart';
import 'package:intern5/screen/new%20Home/body.dart';

class NewHome extends StatelessWidget {
  const NewHome({Key? key}) : super(key: key);
  static const name='newhome';

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(body: HomeView(context)),
    );
  }
}
