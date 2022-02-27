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
    return Form(
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
                  padding: cardfieldPadding,
                  child: Text("Name on Card", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 20),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          errorStyle: validatorErrorStyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintStyle: creditCardHintTextstyle,
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
                  padding: cardfieldPadding,
                  child: Text("Card Number", style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 20),
                    child: TextFormField(
                      controller: cardnumber,
                      decoration: InputDecoration(
                          errorStyle: validatorErrorStyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintStyle: creditCardHintTextstyle,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 10,
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: cardfieldPadding,
                        child:
                            Text("Exp Date", style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 20),
                          child: TextFormField(
                            controller: date,
                            decoration: InputDecoration(
                                errorStyle: validatorErrorStyle,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintStyle: creditCardHintTextstyle,
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
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, right: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: cardfieldPadding,
                        child: Text("CVV", style: TextStyle(color: Colors.white, fontSize: 12)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Container(
                          constraints: BoxConstraints(maxHeight: 20),
                          child: TextFormField(
                            controller: cvv,
                            decoration: InputDecoration(
                                errorStyle: validatorErrorStyle,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                                hintStyle: creditCardHintTextstyle,
                                hintText: "CVV"),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value!.isNotEmpty) {
                                return null;
                              } else {
                                return "Please Enter your cvv code";
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
        ],
      ),
    );
  }
}
