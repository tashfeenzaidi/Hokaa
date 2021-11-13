import 'package:flutter/material.dart';
import 'package:gold_crowne/constants.dart';

class CardWidget extends StatefulWidget {
  int val;
  final void Function(int val) onPressed;
  CardWidget({required this.val, required this.onPressed});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: 100,
          width: 80,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 8.0, left: 8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/cancel.png",
                    width: 10,
                    height: 10,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/hookah.png",
                  height: 70,
                  width: 60,
                  fit: BoxFit.fill,
                ),
              ),

              Text(
                "Watermelon",
                style: smallStyle,
              ),

              // Icon(Icons.cancel_outlined,fonts, color: primaryColor)
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "An exclusive flovour with lemon and peach flovour",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Transform.translate(
                offset: Offset(0, 10),
                child:
                    Text("\$23", style: Theme.of(context).textTheme.headline3),
              )
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(-13, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.val > 0) {
                    widget.onPressed(widget.val - 1);
                    setState(() {
                      widget.val--;
                    });
                  }
                },
                child: Icon(Icons.remove_circle, color: primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  widget.val.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              GestureDetector(
                  onTap: () {
                    widget.onPressed(widget.val + 1);
                    setState(() {
                      widget.val++;
                    });
                  },
                  child: Image.asset("assets/plus.png"))
            ],
          ),
        )
      ]),
    );
  }
}
