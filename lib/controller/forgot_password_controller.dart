import 'dart:async';

import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{

  RxInt startTimer = 60.obs;
  late Timer _timer ;

  void timerStart(){
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(startTimer > 0){
        startTimer.value = startTimer.value -1;
        update();
      }else{
        _timer.cancel();
      }
    });
  }

  void reset(){
    _timer.cancel();
    startTimer.value = 60 ;
    update();
  }

  @override
  void onInit() {
    timerStart();
    super.onInit();
  }
}