import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gold_crowne/Screens/Widgets/loading_widget.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/forgot_password_controller.dart';

class VerifyOtp extends StatelessWidget{
  final ForgotPasswordController _controller = Get.find();
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    _controller.timerStart();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _controller.obx( (m) => bodyWidget(),
          onEmpty: bodyWidget(),
          onLoading: loadingWidget()),
    );
  }

  Widget loadingWidget(){
    return LoadingWidget(child: bodyWidget());
  }

  Widget bodyWidget(){
    return Container(
      height: height,
      width: width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OtpTextField(
            numberOfFields: 6,
            borderColor: primaryColor,
            cursorColor: primaryColor,
            focusedBorderColor: primaryColor,
            enabledBorderColor: Colors.white60,
            showFieldAsBox: true,
            onCodeChanged: (String code) {
              print('code changed $code');
              if(code == ''){
                _controller.verificationCode = _controller.verificationCode.replaceFirstMapped(_controller.verificationCode, (m)=>'');
              }
            },
            onSubmit: (String verificationCode){
              print('verification code $verificationCode');
              _controller.verificationCode = verificationCode;
            }, // end onSubmit
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(()=> Text('Didn\'t receive a code? 00:${_controller.startTimer}',style: historyTextstyle,)),
              TextButton(onPressed: (){
                if(_controller.startTimer.value < 1){
                  _controller.reset();
                  _controller.timerStart();
                  _controller.sendOtp(_controller.email);
                }
                }, child: Text('Resend code',style: TextStyle(decoration: TextDecoration.underline, color: primaryColor, fontSize: 12, fontWeight: FontWeight.w400, fontFamily: "Helvetica"))),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Container(
              height: 45,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  if(_controller.verificationCode.length == 6){
                    _controller.validateOtp();
                  }
                },
                child: Text(
                  "Confirm",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}