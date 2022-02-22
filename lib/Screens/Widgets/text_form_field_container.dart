import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class TextFormFieldContainer extends StatelessWidget {
  final Widget child;
  TextFormFieldContainer(this.child);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 28.0, vertical: 12.0),
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: textFormFieldBackgroundColor, borderRadius: BorderRadius.circular(20)),
        child: child);
  }
}
