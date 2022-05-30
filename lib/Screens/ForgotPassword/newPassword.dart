import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gold_crowne/controller/forgot_password_controller.dart';

import '../../constant/constants.dart';
import '../Widgets/page_top_heading.dart';
import '../Widgets/text_form_field_container.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  ForgotPasswordController _controller = Get.find();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool view = false;
  final formKey = GlobalKey<FormState>();

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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                                  TextFormFieldContainer(
                                    TextFormField(
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      controller: password,
                                      obscureText: view,
                                      validator: (value) {
                                        if (value!.isEmpty || value.length < 5) {
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
                                        if (value!.isEmpty || value.length < 5) {
                                          return "Please Enter Password minimum length of 6";
                                        }
                                        if(password.text != confirmPassword.text){
                                          return 'password does not match';
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
                                if (formKey.currentState!.validate()) {
                                  _controller.resetPassword(password.text,_controller.otpId);
                                }
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
        ),
      ),
    );
  }
}
