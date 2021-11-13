import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class OrderDetailsNew extends StatelessWidget {
  const OrderDetailsNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
    );
  }
}
