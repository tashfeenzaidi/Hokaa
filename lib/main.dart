import 'package:flutter/material.dart';
import 'package:gold_crowne/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,
      home: Scaffold(
        ),
    );
  }
}
