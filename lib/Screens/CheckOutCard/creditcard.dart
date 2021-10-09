import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class CreditCardFields extends StatefulWidget {
  const CreditCardFields({Key? key}) : super(key: key);

  @override
  _CreditCardFieldsState createState() => _CreditCardFieldsState();
}

class _CreditCardFieldsState extends State<CreditCardFields> {
  TextEditingController name = TextEditingController();
  TextEditingController cardnumber = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController cvv = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: paymentCardBackgroundColor,
      body: Form(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Text("Name",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        controller: name,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            hintText: "Name"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Please Enter your Name";
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Text("Card Number",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        controller: cardnumber,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            hintText: "CardNumber"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Please Enter your cardnumber";
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Text("Exp Date",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        controller: date,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            hintText: "Exp Date"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Please Enter your expire date";
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                    child: Text("CVV",
                        style: TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        controller: cvv,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hintStyle:
                                TextStyle(fontSize: 12, color: Colors.white),
                            hintText: "CVV"),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value!.isNotEmpty) {
                            return null;
                          } else {
                            return "Please Enter your Cvv";
                          }
                        },
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
