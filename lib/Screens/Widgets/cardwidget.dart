import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/cart_controller.dart';

class CardWidget extends StatefulWidget {
  int val;
  final void Function(int val) onPressed;
  CardWidget({required this.val, required this.onPressed});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          height: 100,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      _cartController.delete(_cartController.itemList[widget.val]);
                    },
                    icon: Icon(
                      Icons.cancel,
                    ),
                    color: Colors.red,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints.loose(Size(20, 20)),
                  ),
                  Column(
                    children: [
                      Image.network(
                        _cartController.itemList[widget.val].product.imageUrl!,
                        height: 70,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                      Text(
                        _cartController.itemList[widget.val].product.name!,
                        style: smallStyle,
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
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
                _cartController.itemList[widget.val].product.description!,
                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontWeight: FontWeight.w300),
                maxLines: 2,
              ),
              Transform.translate(
                offset: Offset(0, 10),
                child: Text("\$${_cartController.itemList[widget.val].product.price!}",
                    style: Theme.of(context).textTheme.headline3),
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
                  _cartController.addQuantity(widget.val);
                },
                child: Icon(Icons.add_circle, color: primaryColor),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  _cartController.itemList[widget.val].quantity.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _cartController.deleteQuantity(widget.val);
                },
                child: Icon(Icons.remove_circle, color: primaryColor),
              )
            ],
          ),
        )
      ]),
    );
  }
}
