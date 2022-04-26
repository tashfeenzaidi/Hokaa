import 'package:flutter/material.dart';

class PageTopHeading extends StatelessWidget {
  String heading;
  PageTopHeading(this.heading);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Divider(
                color: Colors.white,
                thickness: 1,
              )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(heading, style: Theme.of(context).textTheme.headline3),
          ),
          Container(
              width: MediaQuery.of(context).size.width * 0.1,
              child: Divider(
                color: Colors.white,
                thickness: 1,
              ))
        ],
      ),
    );
  }
}
