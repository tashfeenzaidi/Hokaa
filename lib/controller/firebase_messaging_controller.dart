import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_controller.dart';

class FirebaseMessagingController extends GetxController{
  getMessage(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        Get.snackbar('','',titleText:Text(message.notification!.title!,style: TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Helvetica')), messageText:Text(message.notification!.body!,style:  TextStyle(color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w300,
            fontFamily: 'Helvetica')), colorText: Colors.white,backgroundColor: Colors.black87 );
        print('Message also contained a notification: ${message.notification}');
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