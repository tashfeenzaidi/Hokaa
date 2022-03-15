import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/state_manager.dart';
import 'package:gold_crowne/models/user_response_model.dart';
import 'package:gold_crowne/service/auth_service.dart';

class AuthController extends GetxController with StateMixin<UserResponseModel> {
  static AuthController get to => Get.find();

  registerUser(String name, String email, String password, String phone) {
    AuthService().registerUser();
    change(null, status: RxStatus.success());
  }
}
