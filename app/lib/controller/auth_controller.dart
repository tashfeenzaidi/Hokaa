import 'dart:convert';
import 'dart:isolate';

import 'package:get/get_connect.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/models/ErrorResponseModel.dart';
import 'package:gold_crowne/models/SystemParameterResponse.dart';
import 'package:gold_crowne/models/user_response_model.dart';
import 'package:gold_crowne/service/auth_service.dart';
import 'package:gold_crowne/service/system_parameters_service.dart';

class AuthController extends GetxController with StateMixin<UserResponseModel> {
  static AuthController get to => Get.find();

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
        UserResponseModel user = UserResponseModel.fromJson(json.decode(value.bodyString!));
        GetStorage().write('user', user.data!.user?.toJson());
        GetStorage().write('token', user.data!.accessToken);
        Get.offAllNamed('/mainScreen');
        await getSystemParametersInBackground();
        //     .then((value) {
        //   if (value.statusCode! == 200) {
        //     Get.snackbar('system', 'loaded');
        //   }
        // });
      } else if (value.statusCode! == 401) {
        ErrorResponseModel error = ErrorResponseModel.fromJson(json.decode(value.bodyString!));
        Get.snackbar('Authentication', error.message!);
        change(null, status: RxStatus.error('error accoured'));
      }
    });
  }

  registerUser(String name, String email, String password, String phone) async {
    change(null, status: RxStatus.loading());
    await AuthService().registerUser(name, email, password, phone).then((value) {
      change(null, status: RxStatus.empty());
      if (value.statusCode == 201) {
        Get.back();
      }
      if (value.statusCode == 422) {
        ErrorResponseModel error = ErrorResponseModel.fromJson(json.decode(value.bodyString!));
        error.errors?.forEach((element) {
          Get.snackbar('${element.key}', element.message!);
        });
      }
    });
  }

  logOut() {
    GetStorage().remove('token');
    Get.offAllNamed('/signIn');
  }

  getSystemParametersInBackground() async {
    final p = ReceivePort();
    await Isolate.spawn(getSystemParameters(p.sendPort).then((value) {}), p);
    // return await p.first as Response<dynamic>;
  }

  static User getUser() {
    var user = GetStorage().read('user');
    return User.fromJson(user);
  }

  getSystemParameters(SendPort p) async {
    final response = await SystemParametersService().getSystemParameters().then((value) {
      if (value.statusCode! == 200) {
        SystemParameterResponse response =
            SystemParameterResponse.fromJson(jsonDecode(value.bodyString!));
        GetStorage().write('tax', response.data!.appSetting!.tax!);
        GetStorage().write('currency_symbol', response.data!.appSetting!.currencySymbol!);
        GetStorage().write(
              'systemParameters', SystemParameterResponse.fromJson(jsonDecode(value.bodyString!)));
        Isolate.exit(p, value);
      }
    });
  }

}
