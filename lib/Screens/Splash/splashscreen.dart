import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      bool isFirst = GetStorage().read('isFist') ?? true;
      String route = isFirst ? '/onboard' : '/signIn';
      Get.offNamed(route);
      timer.cancel();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primayBackgroundColor,
      body: Center(
        child: Image.asset(
          "assets/logo.png",
        ),
      ),
    );
  }
}
