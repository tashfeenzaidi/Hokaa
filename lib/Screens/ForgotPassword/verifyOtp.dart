import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/forgot_password_controller.dart';

class VerifyOtp extends StatelessWidget{
  final ForgotPasswordController _controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpTextField(
              numberOfFields: 5,
              borderColor: primaryColor,
              cursorColor: primaryColor,
              focusedBorderColor: primaryColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: false,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
              }, // end onSubmit
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(()=> Text('If Didn\'t receive the code in 00:${_controller.startTimer}',style: smallStyle,)),
                TextButton(onPressed: (){}, child: Text('Resend code',style: TextStyle(decoration: TextDecoration.underline, color: primaryColor, fontSize: 8, fontWeight: FontWeight.w400, fontFamily: 'Helvetica' ))),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Container(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/newPassword');
                  },
                  child: Text(
                    "Confirm",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}