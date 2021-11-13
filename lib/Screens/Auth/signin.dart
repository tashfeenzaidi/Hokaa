import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool view = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: primaryColor,
            child: Column(
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
                      child: Image.asset(
                        "assets/signin.png",
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.73,
                  width: MediaQuery.of(context).size.width,
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
                                  width: 80,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(13.0),
                                child: Text("SIGN IN",
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                              Container(
                                  width: 80,
                                  child: Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: height * 0.02, left: 30, right: 30),
                          child: Container(
                            height: height * 0.085,
                            decoration: BoxDecoration(
                                color: cardBackgroundColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 10, bottom: 10),
                                  child: Text(
                                    "UserName",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.0),
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
                          padding:
                              EdgeInsets.only(top: 20, left: 30, right: 30),
                          child: Container(
                              height: height * 0.085,
                              decoration: BoxDecoration(
                                  color: cardBackgroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, top: 10, bottom: 10),
                                    child: Text(
                                      "Password",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 15.0),
                                    child: Container(
                                      constraints:
                                          BoxConstraints(maxHeight: 30),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        controller: password,
                                        obscureText: view,
                                        validator: (value) {
                                          if (value!.isNotEmpty &&
                                              value.length > 5) {
                                            return null;
                                          } else {
                                            return "Please Enter Password minimum length of 6";
                                          }
                                        },
                                        decoration: InputDecoration(
                                          contentPadding: hintpadding,
                                          hintStyle: hinstyle,
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          errorStyle: validatorErrorStyle,
                                          suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  view = !view;
                                                });
                                              },
                                              child: view
                                                  ? Transform.translate(
                                                      offset: Offset(0, -15),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 30),
                                                        child: Icon(
                                                            Icons.visibility,
                                                            color:
                                                                primaryColor),
                                                      ),
                                                    )
                                                  : Transform.translate(
                                                      offset: Offset(0, -15),
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 30),
                                                          child: Image.asset(
                                                              "assets/eye-off.png",
                                                              color:
                                                                  primaryColor)),
                                                    )),
                                          hintText: "*******",
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Container(
                            height: 45,
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                // if (formKey.currentState!.validate()) {}
                                Get.toNamed("/mainscreen");
                              },
                              child: Text(
                                "SIGN IN",
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed("/forgotPassword");
                          },
                          child: Padding(
                              padding: EdgeInsets.only(top: 17.0),
                              child: Text(
                                "Forgot Password?",
                                style: Theme.of(context).textTheme.subtitle2,
                              )),
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 26.0),
                            child: Text(
                              "OR Login  With",
                              style: Theme.of(context).textTheme.subtitle1,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                color: primaryColor,
                                height: 45,
                                minWidth: 40,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {},
                                child: Image.asset(
                                  "assets/google.png",
                                  height: 25,
                                  width: 20,
                                  color: Colors.black,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              // Container(
                              //   height: 40,
                              //   width: 40,
                              //   decoration: BoxDecoration(
                              //       color: primaryColor,
                              //       borderRadius: BorderRadius.circular(10)),
                              //   child: Image.asset(
                              //     "assets/google.png",
                              //     height: 30,
                              //     width: 30,
                              //     fit: BoxFit.contain,
                              //   ),
                              // ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                child: MaterialButton(
                                  color: primaryColor,
                                  height: 45,
                                  minWidth: 40,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {},
                                  child: Image.asset(
                                    "assets/facebook.png",
                                    height: 25,
                                    width: 20,
                                    color: Colors.black,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                color: primaryColor,
                                height: 45,
                                minWidth: 40,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {},
                                child: Image.asset(
                                  "assets/apple.png",
                                  height: 30,
                                  width: 23,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: smalltextStyle2,
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed("/signup");
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Signup!",
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
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
