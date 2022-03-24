import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/Screens/Widgets/text_form_field_container.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/auth_controller.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  AuthController _authController = Get.put(AuthController());

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool view = true;

  @override
  void initState() {
    email.text = 'abdulsaboor@gmail.com';
    password.text = '12345678';
    super.initState();
  }

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
                  height: height * 0.3,
                  child: Center(
                      child: Container(
                          margin: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top * 2),
                          child: Image.asset('assets/signin.png'))),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: primayBackgroundColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20), topLeft: Radius.circular(20))),
                  child: SizedBox(
                    height: height * 0.7,
                    child: _authController.obx(
                      (user) => getWidgets(),
                      onEmpty: getWidgets(),
                      onLoading: getLoading(),
                      onError: (v) => getError(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getWidgets() {
    return Column(
      children: [
        PageTopHeading('SIGN IN'),
        TextFormFieldContainer(
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              contentPadding: hintPadding,
              hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
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
            textAlignVertical: TextAlignVertical.center,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white70, fontSize: 14.0),
            decoration: InputDecoration(
              contentPadding: hintPadding,
              hintStyle: Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: hintTextSize),
              label: Text(
                'Password',
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
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            height: 45,
            width: 200,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  _authController.loginUser(email.text, password.text);
                }
                // Get.toNamed("/mainScreen");
              },
              child: Text(
                "SIGN IN",
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
        Spacer(),
        Padding(
            padding: EdgeInsets.only(top: 26.0),
            child: Text(
              "Or Login  With",
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
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Image.asset(
                  "assets/google.png",
                  height: 25,
                  width: 20,
                  color: Colors.black,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: MaterialButton(
                  color: primaryColor,
                  height: 45,
                  minWidth: 40,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              Visibility(
                visible: Theme.of(context).platform == TargetPlatform.iOS ? true : false,
                child: MaterialButton(
                  color: primaryColor,
                  height: 45,
                  minWidth: 40,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Image.asset(
                    "assets/apple.png",
                    height: 30,
                    width: 23,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(0.0),
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
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getError() {
    return getWidgets();
  }

  Widget getLoading() {
    return Stack(children: [
      Positioned.fill(child: getWidgets()),
      Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
    ]);
  }
}
