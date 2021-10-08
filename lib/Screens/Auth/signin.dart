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
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          color: primaryColor,
          child: ListView(
            children: [
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/signin.png",
                    height: 200,
                    width: 200,
                  )),
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
                                width: 80,
                                child: Divider(
                                  color: Colors.white,
                                  thickness: 1,
                                )),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text("SIGN IN",
                                  style: Theme.of(context).textTheme.headline3),
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
                        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                              color: cardBackgroundColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10.0, top: 10, bottom: 10),
                                child: Text(
                                  "UserName",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
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
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                        child: Container(
                            height: 90,
                            decoration: BoxDecoration(
                                color: cardBackgroundColor,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, top: 10, bottom: 10),
                                  child: Text(
                                    "Password",
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
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
                                      hintStyle: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              view = !view;
                                            });
                                          },
                                          child: view
                                              ? Icon(Icons.visibility,
                                                  color: primaryColor)
                                              : Icon(Icons.visibility_off,
                                                  color: primaryColor)),
                                      hintText: "Password",
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
                      Padding(
                          padding: EdgeInsets.only(top: 17.0),
                          child: Text(
                            "Forgot Password?",
                            style: Theme.of(context).textTheme.subtitle2,
                          )),
                      Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Text(
                            "OR Login  With",
                            style: Theme.of(context).textTheme.subtitle1,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/google.png",
                                height: 30,
                                width: 30,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                  "assets/facebook.png",
                                  height: 30,
                                  width: 30,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                "assets/apple.png",
                                fit: BoxFit.contain,
                                width: 30,
                                height: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont't have an account?",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("/signup");
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Sign Up",
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
    );
  }
}
