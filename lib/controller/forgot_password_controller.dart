import 'dart:async';

import 'package:get/get.dart';
import 'package:gold_crowne/service/auth_service.dart';

class ForgotPasswordController extends GetxController{

  RxInt startTimer = 60.obs;
  late Timer _timer ;
  AuthService _authService = AuthService();
  late int optId;
  String verificationCode = '';

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

  void sendOtp(String email){
    _authService.sendOtp(email);
  }

  void validateOtp(String email, String otpCode){
    _authService.validateOtp(email,otpCode);
  }

  void resetPassword(String email,String otpId){
    _authService.resetPassword(email,otpId);
  }

  @override
  void onInit() {
    timerStart();
    super.onInit();
  }
}