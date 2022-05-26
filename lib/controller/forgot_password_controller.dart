import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/models/base_responseModel.dart';
import 'package:gold_crowne/service/auth_service.dart';

class ForgotPasswordController extends GetxController with StateMixin{

  RxInt startTimer = 60.obs;
  late Timer _timer ;
  AuthService _authService = AuthService();
  late int otpId;
  late String email;
  String verificationCode = '';
  RxStatus isValidate = RxStatus.empty();

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
    startTimer.value = 60;
    update();
  }

  void sendOtp(String email){
    this.email = email;
    _authService.sendOtp(email);
  }

  void validateOtp(){
    change(null,status: RxStatus.loading());
    _authService.validateOtp(email,verificationCode).then((value){
      if(value.statusCode! == 200){
        change(null,status: RxStatus.success());
        BaseResponseModel baseResponseModel = BaseResponseModel.fromJson(jsonDecode(value.bodyString!));
        this.otpId = baseResponseModel.data!.id!;
        Get.toNamed('/newPassword');
      }else if(value.statusCode! == 401){
        showSnackBar('', '');
      }else if(value.statusCode! == 402){

      }

    });
  }

  void resetPassword(String newPassword,int otpId){
    print('otp id = $otpId');
    _authService.resetPassword(newPassword,otpId).then((value) {
      if(value.statusCode == 200){
        showSnackBar('password updated', 'New Password');
        Get.offAllNamed('/signIn');
      }
    });
  }

  @override
  void onInit() {
    timerStart();
    change(null, status: RxStatus.empty());
    super.onInit();
  }
}