import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constant/constants.dart';

class MyAccount extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primayBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 40,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            )),
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Text("MY ACCOUNT", style: Theme.of(context).textTheme.headline3),
                        ),
                        Container(
                            width: 40,
                            child: Divider(
                              color: Colors.white,
                              thickness: 1,
                            ))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage("assets/onboard1.png"),
                      ),
                      Transform.translate(
                          offset: Offset(-10, 20),
                          child: Image.asset(
                            "assets/edit.png",
                            width: 20,
                            height: 20,
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Container(
                      height: height * 0.08,
                      decoration: BoxDecoration(
                          color: cardBackgroundColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                            child: Text(
                              "Enter Name",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10),
                            child: Container(
                              constraints: BoxConstraints(maxHeight: 30),
                              child: TextFormField(
                                controller: name,
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
                                    suffixIconConstraints:
                                        BoxConstraints(maxWidth: 20, maxHeight: 20),
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
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Container(
                      height: height * 0.08,
                      decoration: BoxDecoration(
                          color: cardBackgroundColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                            child: Text(
                              "Email",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10),
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
                                    focusedErrorBorder: InputBorder.none,
                                    isCollapsed: true,
                                    suffixIconConstraints:
                                        BoxConstraints(maxWidth: 20, maxHeight: 20),
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
                      height: height * 0.08,
                      decoration: BoxDecoration(
                          color: cardBackgroundColor, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                            child: Text(
                              "Enter Mobile Number ",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10),
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
                                    suffixIconConstraints:
                                        BoxConstraints(maxWidth: 20, maxHeight: 20),
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
                ],
              ),
            ),
          ),
        ));
  }
}
