import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class AuthService extends GetConnect {
  Future<Response<dynamic>> registerUser(
      String name, String email, String password, String phone) async {
    var formData = FormData({
      'name': name,
      'phone_no': phone,
      'email': email,
      'password': password,
      'password_confirmation': password
    });
    return await post(baseUrl + 'registration', formData);
  }

  Future<Response<dynamic>> loginUser(String email, String password) async {
    var formData = FormData({
      'email': email,
      'password': password,
    });
    return await post(baseUrl + 'login', formData);
  }

}
