import 'dart:convert';
import 'dart:isolate';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/models/ErrorResponseModel.dart';
import 'package:gold_crowne/models/SystemParameterResponse.dart';
import 'package:gold_crowne/models/user_response_model.dart' as userResponse;
import 'package:gold_crowne/service/auth_service.dart';
import 'package:gold_crowne/service/system_parameters_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'firebase_controller.dart';
import 'firebase_messaging_controller.dart';

class AuthController extends GetxController with StateMixin<userResponse.UserResponseModel> {
  static AuthController get to => Get.find();
  FireBaseController _fireBaseController = Get.put(FireBaseController());

  @override
  onInit() {
    change(null, status: RxStatus.empty());
    super.onInit();
  }

  loginUser(String email, String password) async {
    change(null, status: RxStatus.loading());

    await AuthService().loginUser(email, password).then((value) async {
      if (value.statusCode! == 200) {
        change(null, status: RxStatus.success());
        userResponse.UserResponseModel user =
            userResponse.UserResponseModel.fromJson(json.decode(value.bodyString!));
        GetStorage().write('user', user.data!.user?.toJson());
        GetStorage().write('token', user.data!.accessToken);
        _fireBaseController.signInWithEmailPassword(email, password);
        Get.put(FirebaseMessagingController());
        getSystemParametersInBackground();
      } else if (value.statusCode! == 401) {
        ErrorResponseModel error = ErrorResponseModel.fromJson(json.decode(value.bodyString!));
        Get.snackbar('Authentication', error.message!);
        change(null, status: RxStatus.error('error accoured'));
      }
    });
  }

  registerUser(
      String name, String email, String password, String phone, String image, String uid) async {
    change(null, status: RxStatus.loading());
    await AuthService().registerUser(name, email, password, phone, image, uid).then((value) async {
      change(null, status: RxStatus.empty());
      if (value.statusCode == 201) {
        userResponse.UserResponseModel user =
            userResponse.UserResponseModel.fromJson(json.decode(value.bodyString!));
        _fireBaseController.fcmSubscribe();
        GetStorage().write('user', user.data!.user?.toJson());
        GetStorage().write('token', user.data!.accessToken);
        Get.offAllNamed('/mainScreen');
        Get.put(FirebaseMessagingController());
        await getSystemParametersInBackground();
      }
      if (value.statusCode == 422) {
        _fireBaseController.deleteUser();
        ErrorResponseModel error = ErrorResponseModel.fromJson(json.decode(value.bodyString!));
        error.errors?.forEach((element) {
          Get.snackbar('${element.key}', element.message!);
        });
      }
    });
  }

  logOut() {
    GetStorage().remove('token');
    _fireBaseController.signOutUser();
    Get.offAllNamed('/signIn');
  }

  getSystemParametersInBackground() async {
    final p = ReceivePort();
    await Isolate.spawn(getSystemParameters(),'');
  }

  static userResponse.User getUser() {
    var user = GetStorage().read('user');
    return userResponse.User.fromJson(user);
  }

  getSystemParameters() async {
    await SystemParametersService().getSystemParameters().then((value) {
      if (value.statusCode! == 200) {
        SystemParameterResponse response =
            SystemParameterResponse.fromJson(value.body!);
        GetStorage().write('tax', response.data!.appSetting!.tax!);
        GetStorage().write('currency_symbol', response.data!.appSetting!.currencySymbol!);
        GetStorage().write(
            'systemParameters', SystemParameterResponse.fromJson(jsonDecode(value.bodyString!)));
      }
    });
  }

  googleLogin() {
    _fireBaseController.signInWithGoogle().then((value) {
      if (value.user != null) {
        Get.snackbar('Google Login', 'successful');
        registerUser(value.user!.displayName!, value.user!.email!, value.user!.uid, '',
            value.user!.photoURL!, value.user!.uid);
      }
    });
  }

  facebookLogin() {
    _fireBaseController.signInWithFacebook().then((value) {
      if (value.user != null) {
        Get.snackbar('Facebook Login', 'successful');
        registerUser(value.user!.displayName!, value.user!.email!, value.user!.uid, '',
            value.user!.photoURL!, value.user!.uid);
      }
    });
  }

  signUp(String name, String email, String password, String phone) {
    _fireBaseController.createUserWithEmailPassword(email, password).then((value) {
      registerUser(name, email, password, phone, '', value.user!.uid);
    });
  }
}
