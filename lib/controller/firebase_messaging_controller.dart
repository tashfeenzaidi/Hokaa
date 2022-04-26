import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'firebase_controller.dart';

class FirebaseMessagingController extends GetxController{
  getMessage(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        Get.snackbar(message.notification!.title!, message.notification!.body!);
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