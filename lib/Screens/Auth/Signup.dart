import 'package:flutter/material.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/Screens/Widgets/text_form_field_container.dart';

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
  TextEditingController confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool view = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Form(
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
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Expanded(
                  child: Column(
                    children: [
                      PageTopHeading('SIGN UP'),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 25),
                        child: Column(
                          children: [
                            TextFormFieldContainer(TextFormField(
                              controller: username,
                              decoration: InputDecoration(
                                contentPadding: hintPadding,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: hintTextSize),
                                label: Text(
                                  'Name',
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
                              textInputAction: TextInputAction.next,
                              textAlignVertical: TextAlignVertical.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.white70, fontSize: 14.0),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter your name';
                                }
                                return null;
                              },
                            )),
                            TextFormFieldContainer(TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                contentPadding: hintPadding,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: hintTextSize),
                                label: Text(
                                  'Email',
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
                              textInputAction: TextInputAction.next,
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
                            )),
                            TextFormFieldContainer(TextFormField(
                              controller: phoneNumber,
                              decoration: InputDecoration(
                                contentPadding: hintPadding,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(fontSize: hintTextSize),
                                label: Text(
                                  'Number',
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
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              textAlignVertical: TextAlignVertical.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.white70, fontSize: 14.0),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter contact number';
                                }
                                return null;
                              },
                            )),
                            TextFormFieldContainer(
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: password,
                                obscureText: view,
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length < 5) {
                                    return "Please Enter Password minimum length of 6";
                                  }
                                  return null;
                                },
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.visiblePassword,
                                textAlignVertical: TextAlignVertical.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white70, fontSize: 14.0),
                                decoration: InputDecoration(
                                  contentPadding: hintPadding,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: hintTextSize),
                                  label: Text(
                                    'Password',
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 11.0, color: Colors.red),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        view = view ? false : true;
                                      });
                                    },
                                    icon: Icon(
                                      view ? Icons.visibility : Icons.visibility_off,
                                      color: primaryColor,
                                    ),
                                  ),
                                  hintText: "*******",
                                ),
                              ),
                            ),
                            TextFormFieldContainer(
                              TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                controller: confirmPassword,
                                obscureText: view,
                                validator: (value) {
                                  if (value!.isNotEmpty && value.length < 5) {
                                    return "Please Enter Password minimum length of 6";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                textAlignVertical: TextAlignVertical.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(color: Colors.white70, fontSize: 14.0),
                                decoration: InputDecoration(
                                  contentPadding: hintPadding,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: hintTextSize),
                                  label: Text(
                                    'Confirm Password',
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  errorStyle: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(fontSize: 11.0, color: Colors.red),
                                  hintText: "*******",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontFamily: 'Helvetica',
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
