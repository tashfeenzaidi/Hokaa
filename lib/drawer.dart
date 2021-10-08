import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

Drawer drawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: primaryColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.select_all),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0, top: MediaQuery.of(context).size.height * 0.1),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/onboard1.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Zotobyte",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Zotobyte@gmail.com"),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offNamed("/mainscreen");
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(Icons.home),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Home",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.add_shopping_cart),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My Cart",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.add_box),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My Orders",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.person),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "My Account",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.help),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Help",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.logout),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
