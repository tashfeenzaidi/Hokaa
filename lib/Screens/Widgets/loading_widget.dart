import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final Widget child;
  LoadingWidget({required this.child});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
        Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
