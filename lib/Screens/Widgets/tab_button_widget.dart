import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  Color _color;
  String _label;
  String _icon;
  String? secondIcon;
  TabButton(this._color, this._label, this._icon, {this.secondIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Visibility(
            visible: secondIcon != null ? true : false,
            child: Image.asset(
              secondIcon ?? '',
              color: _color,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 3),
            child: Image.asset(
              _icon,
              color: _color,
            ),
          ),
          Text(_label),
        ],
      ),
    );
  }
}
