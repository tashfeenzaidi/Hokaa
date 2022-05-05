import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/constants.dart';
import 'firebase_controller.dart';

class FirebaseMessagingController extends GetxController{
  getMessage(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        showSnackBar(message.notification!.title!,message.notification!.body!);
      }
    });
  }

  @override
  void onInit() {
    FireBaseController().fcmSubscribe();
    getMessage();
    super.onInit();
  }
}