import 'package:get/get_navigation/src/routes/get_route.dart';
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
import '../noevent.dart';
import '../onboarding.dart';
import '../outofRadius.dart';

class AppRoutes {
  static final routes = [
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
  ];
}
