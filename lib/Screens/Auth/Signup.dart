import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

  final formKey = GlobalKey<FormState>();
  bool view = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: username,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    hintText: "Username"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please Enter Your Name";
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: phoneNumber,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    hintText: "Phone Number"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return "Please Enter Your Phone Number";
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
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
            Container(
                padding: EdgeInsets.all(20),
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
                    hintStyle: TextStyle(
                      fontSize: 20,
                    ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            view = !view;
                          });
                        },
                        child: view
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    hintText: "Password",
                  ),
                )),
            ElevatedButton(
              onPressed: () {},
              child: Text("Sign Up"),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.red, fontSize: 18),
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
    );
  }
}
