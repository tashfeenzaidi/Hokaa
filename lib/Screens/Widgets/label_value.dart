import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  String label;
  String value;

  LabelValue({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '$label: ',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
        ),
        Text(
          '\$ $value',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
