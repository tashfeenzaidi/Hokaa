import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  LoadingWidget({required this.child});
  final spinKit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Align(
          alignment: Alignment.center,
          child: spinKit,
        ),
      ],
    );
  }
}
