import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/Screens/Widgets/text_form_field_container.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/models/user_response_model.dart';

class MyAccount extends StatelessWidget {
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  var box = GetStorage();

  @override
  Widget build(BuildContext context) {
    User user = User.fromJson(box.read('user'));
    username.text = user.name!;
    email.text = user.email!;
    phoneNumber.text = user.phoneNo!;

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
                  PageTopHeading('MY ACCOUNT'),
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
                  TextFormFieldContainer(TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                      contentPadding: hintPadding,
                      hintStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                      label: Text(
                        'Name',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/edit.png",
                          width: 20,
                          height: 20,
                        ),
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
                      hintStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                      label: Text(
                        'Email',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/edit.png",
                          width: 20,
                          height: 20,
                        ),
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
                  TextFormFieldContainer(TextFormField(
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      contentPadding: hintPadding,
                      hintStyle:
                          Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
                      label: Text(
                        'Number',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/edit.png",
                          width: 20,
                          height: 20,
                        ),
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
                ],
              ),
            ),
          ),
        ));
  }
}
