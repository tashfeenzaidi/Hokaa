import 'package:flutter/material.dart';

class LabelValue extends StatelessWidget {
  String label;
  String value;

  LabelValue({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),
        ),
        Text(
          '\$$value',
          style: Theme.of(context).textTheme.headline2,
        ),
      ],
    );
  }
}
