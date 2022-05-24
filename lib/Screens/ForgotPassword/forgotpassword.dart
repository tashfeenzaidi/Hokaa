import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/Widgets/back_button.dart';
import 'package:gold_crowne/constant/constants.dart';

import '../Widgets/page_top_heading.dart';
import '../Widgets/text_form_field_container.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool view = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: primayBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomBackButton(color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: primayBackgroundColor,
                image: DecorationImage(
                    image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.25,
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top * 2),
                          child: Image.asset('assets/forgot.png'))),
                ),
                Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Container(
                    decoration: BoxDecoration(
                        color: primayBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20), topRight: Radius.circular(20))
                    ),
                    child: Column(
                      children: [
                        PageTopHeading('Forget Password'),
                        Center(
                            child: Text(
                          "Enter your email address below, We'll look for your \naccount and send you a password reset email",
                          style: historyTextstyle,
                        )),
                        Spacer(),
                        TextFormFieldContainer(
                          TextFormField(
                            controller: email,
                            decoration: InputDecoration(
                              contentPadding: hintPadding,
                              hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                              label: Text(
                                'Enter Email',
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              isCollapsed: false,
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(fontSize: 11.0, color: Colors.red),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textAlignVertical: TextAlignVertical.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white70, fontSize: 14.0),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isNotEmpty &&
                                  !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(value.trim())) {
                                return 'please enter correct format';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Container(
                            height: 45,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                }
                                Get.toNamed("/verifyOtp");
                              },
                              child: Text(
                                "Send Otp",
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Spacer(),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
