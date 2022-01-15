import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool view = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: primaryColor,
          child: Container(
            child: ListView(
              children: [
                Stack(
                  children: [
                    Image.asset(
                      "assets/back.png",
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    Center(
                      child: Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Image.asset(
                            "assets/forgot.png",
                            height: 200,
                            width: 200,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Container(
                    decoration: BoxDecoration(
                        color: primayBackgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  width: 60,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text("FORGOT PASSWORD",
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                              Container(
                                  width: 60,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  ))
                            ],
                          ),
                        ),
                        Center(
                            child: Text(
                          "Enter your email address below, We'll look for",
                          style: lightTextstyle,
                        )),
                        Center(
                            child: Text(
                          "your account and send you a password reset email",
                          style: lightTextstyle,
                        )),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1,
                              left: 30,
                              right: 30),
                          child: Container(
                            height: height * 0.085,
                            decoration: BoxDecoration(
                                color: cardColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10, bottom: 10),
                                  child: Text(
                                    "Enter Email",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Container(
                                    constraints: BoxConstraints(maxHeight: 30),
                                    child: TextFormField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          contentPadding: hintpadding,
                                          hintStyle: hinstyle,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          focusedErrorBorder: InputBorder.none,
                                          isCollapsed: true,
                                          errorStyle: validatorErrorStyle,
                                          hintText: "Email"),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value!.isNotEmpty &&
                                            RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                                .hasMatch(value.trim())) {
                                          return null;
                                        } else {
                                          return "Please Enter Valid Email";
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.1),
                          child: Container(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                // if (formKey.currentState!.validate()) {}
                              },
                              child: Text(
                                "RESET PASSWORD",
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          ),
                        ),
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
