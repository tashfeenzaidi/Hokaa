import 'package:flutter/material.dart';

import 'package:gold_crowne/constants.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool view = true;
  bool view1 = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Form(
        key: formKey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                  color: primayBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text("SIGN UP", style: Theme.of(context).textTheme.headline3),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ))
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.04, left: 30, right: 30),
                    child: Container(
                      height: height * 0.085,
                      decoration:
                          BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                            child: Text(
                              "Enter Name",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 30),
                              child: TextFormField(
                                controller: username,
                                decoration: InputDecoration(
                                    contentPadding: hintPadding,
                                    hintStyle: hinstyle,
                                    border: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorStyle: validatorErrorStyle,
                                    hintText: "Enter Name"),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please Enter Your name";
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
                    padding: EdgeInsets.only(top: height * 0.03, left: 30, right: 30),
                    child: Container(
                      height: height * 0.085,
                      decoration:
                          BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                            child: Text(
                              "Enter Email",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 30),
                              child: TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                    contentPadding: hintPadding,
                                    hintStyle: hinstyle,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorStyle: validatorErrorStyle,
                                    hintText: "Email"),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    padding: EdgeInsets.only(top: height * 0.03, left: 30, right: 30),
                    child: Container(
                      height: height * 0.085,
                      decoration:
                          BoxDecoration(color: cardColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                            child: Text(
                              "Enter Mobile Number (Optional)",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 30),
                              child: TextFormField(
                                controller: phoneNumber,
                                decoration: InputDecoration(
                                    contentPadding: hintPadding,
                                    hintStyle: hinstyle,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    errorStyle: validatorErrorStyle,
                                    hintText: "+924242424"),
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please Enter Your Number";
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
                    padding: EdgeInsets.only(top: height * 0.03, left: 30, right: 30),
                    child: Container(
                        height: height * 0.085,
                        decoration: BoxDecoration(
                            color: cardColor, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                              child: Text(
                                "Password",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 30),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: password,
                                  obscureText: view,
                                  validator: (value) {
                                    if (value!.isNotEmpty && value.length > 5) {
                                      return null;
                                    } else {
                                      return "Please Enter Password minimum length of 6";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: hintPadding,
                                    errorStyle: validatorErrorStyle,
                                    hintStyle: hinstyle,
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
                                                  padding: EdgeInsets.only(right: 30),
                                                  child:
                                                      Icon(Icons.visibility, color: primaryColor),
                                                ),
                                              )
                                            : Transform.translate(
                                                offset: Offset(0, -15),
                                                child: Padding(
                                                    padding: EdgeInsets.only(right: 30),
                                                    child: Image.asset("assets/eye-off.png",
                                                        color: primaryColor)),
                                              )),
                                    hintText: "***********",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.03, left: 30, right: 30),
                    child: Container(
                        height: height * 0.085,
                        decoration: BoxDecoration(
                            color: cardColor, borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
                              child: Text(
                                "Confirm Password",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Container(
                                constraints: BoxConstraints(maxHeight: 30),
                                child: TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  controller: confirmpassword,
                                  obscureText: view1,
                                  validator: (value) {
                                    if (value!.isNotEmpty && value.length > 5) {
                                      return null;
                                    } else {
                                      return "Please Enter Password minimum length of 6";
                                    }
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: hintPadding,
                                    errorStyle: validatorErrorStyle,
                                    hintStyle: hinstyle,
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            view1 = !view1;
                                          });
                                        },
                                        child: view
                                            ? Transform.translate(
                                                offset: Offset(0, -15),
                                                child: Padding(
                                                  padding: EdgeInsets.only(right: 30),
                                                  child:
                                                      Icon(Icons.visibility, color: primaryColor),
                                                ),
                                              )
                                            : Transform.translate(
                                                offset: Offset(0, -15),
                                                child: Padding(
                                                    padding: EdgeInsets.only(right: 30),
                                                    child: Image.asset("assets/eye-off.png",
                                                        color: primaryColor)),
                                              )),
                                    hintText: "***********",
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.03, left: 90, right: 90),
                    child: Container(
                      height: 45,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          "SIGN UP",
                          style: Theme.of(context).textTheme.button,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
