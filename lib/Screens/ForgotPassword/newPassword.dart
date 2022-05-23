import 'package:flutter/material.dart';

import '../../constant/constants.dart';
import '../Widgets/page_top_heading.dart';
import '../Widgets/text_form_field_container.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {

  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      backgroundColor: primayBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: primayBackgroundColor,
            image: DecorationImage(
                image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image:
                  DecorationImage(image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        color: primayBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    margin: EdgeInsets.symmetric(vertical: 24),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        PageTopHeading('Change Password'),
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
                                    'New Password',
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
                                controller: username,
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
                                  if (value!.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value.trim())) {
                                    return 'please enter correct format';
                                  }
                                  return null;
                                },
                              )),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // if (formKey.currentState!.validate()) {
                            //   _authController.signUp(
                            //       username.text, email.text, password.text, phoneNumber.text);
                            // }
                          },
                          child: Text(
                            "Confirm",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
