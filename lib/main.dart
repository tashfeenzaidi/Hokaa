import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Account/myaccount.dart';
import 'package:gold_crowne/Orders/orderdetails.dart';
import 'package:gold_crowne/Orders/orderdetailsnew.dart';
import 'package:gold_crowne/Orders/ordershistory.dart';
import 'package:gold_crowne/Orders/orderstatus.dart';
import 'package:gold_crowne/Screens/Auth/Signup.dart';

import 'package:gold_crowne/Screens/Auth/signin.dart';
import 'package:gold_crowne/Screens/ForgotPassword/forgotpassword.dart';
import 'package:gold_crowne/Screens/Splash/splashscreen.dart';
import 'package:gold_crowne/Screens/cartScreen.dart';
import 'package:gold_crowne/Screens/checkout.dart';
import 'package:gold_crowne/Screens/mainscreen.dart';
import 'package:gold_crowne/Screens/paymentcancel.dart';
import 'package:gold_crowne/Screens/paymentdone.dart';
import 'package:gold_crowne/Screens/prouctdetails.dart';
import 'package:gold_crowne/Screens/shop.dart';
import 'package:gold_crowne/noevent.dart';
import 'package:gold_crowne/onboarding.dart';
import 'package:gold_crowne/outofRadius.dart';

import 'package:gold_crowne/theme.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.lightTheme,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
        background: Container(color: const Color(0xFFF5F5F5)),
      ),
      getPages: [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/signIn", page: () => SignInScreen()),
        GetPage(name: "/onboard", page: () => OnboardingScreen()),
        GetPage(name: "/signup", page: () => SignUpScreen()),
        GetPage(name: "/mainScreen", page: () => MainScreen()),
        GetPage(name: "/shop", page: () => ShopWidget()),
        GetPage(name: "/productDetail", page: () => ProductDetailScreen()),
        GetPage(name: "/cart", page: () => CartScreen()),
        GetPage(name: "/checkout", page: () => CheckOutScreen()),
        GetPage(name: "/paymentDone", page: () => PaymentConfirm()),
        GetPage(name: "/paymentCancel", page: () => PaymentCancel()),
        GetPage(name: "/forgotPassword", page: () => ForgotPassword()),
        GetPage(name: "/ordersHistory", page: () => OrderHistory()),
        GetPage(name: "/orderDetail", page: () => OrderDetails()),
        GetPage(name: "/orderStatus", page: () => OrderStatus()),
        GetPage(name: "/myAccount", page: () => MyAccount()),
        GetPage(name: "/noEvent", page: () => NoEventScreen()),
        GetPage(name: "/outOfRadius", page: () => OutOfRadiusScreen()),
        GetPage(name: "/orderDetailsNew", page: () => OrderDetailsNew()),
      ],
      initialRoute: '/checkout',
    );
  }
}
