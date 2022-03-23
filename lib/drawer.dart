import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/auth_controller.dart';
import 'package:gold_crowne/models/user_response_model.dart';

// User user = AuthController.getUser();

Drawer drawer(BuildContext context) {
  var box = GetStorage();
  User user = User.fromJson(box.read('user'));

  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        color: primaryColor,
        image: DecorationImage(image: AssetImage("assets/dback.png"), fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                  child: Image.asset(
                "assets/drawer.png",
                width: 20,
                height: 20,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: MediaQuery.of(context).size.height * 0.1),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: AssetImage("assets/onboard1.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Text(
                user.name!,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10),
              child: Text(
                user.email!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1!
                    .copyWith(color: Colors.black)!
                    .copyWith(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Divider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {
                Get.toNamed("/mainscreen");
              },
              leading: Image.asset(
                "assets/home.png",
                width: 22,
                height: 22,
              ),
              title: Text(
                "Home",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {
                Get.toNamed("/cart");
              },
              leading: Image.asset(
                "assets/mycart.png",
                width: 22,
                height: 22,
              ),
              title: Text(
                "My Cart",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {
                Get.toNamed("/ordersHistory");
              },
              leading: Image.asset(
                "assets/package.png",
                width: 22,
                height: 22,
              ),
              title: Text(
                "My Orders",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {
                Get.toNamed("/myAccount");
              },
              leading: Icon(
                Icons.person_outlined,
                color: Colors.black,
              ),
              title: Text(
                "My Account",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
              ),
            ),
            ListTile(
              horizontalTitleGap: 0,
              onTap: () {
                AuthController _controller = Get.put(AuthController());
                _controller.logOut();
                Get.offAllNamed('/signIn');
                _controller.dispose();
              },
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.black,
              ),
              title: Text(
                "Logout",
                style: Theme.of(context).textTheme.subtitle1!.copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
