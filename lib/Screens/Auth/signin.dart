import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: 30),
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
              onPressed: () {
                if (formKey.currentState!.validate()) {}
              },
              child: Text("Sign In"),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont't have an account?",
                    style: TextStyle(fontSize: 18),
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
