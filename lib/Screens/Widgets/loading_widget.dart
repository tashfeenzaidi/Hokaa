import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../constant/constants.dart';

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
          child: SpinKitFadingCircle(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? primaryColor : cardColor,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
