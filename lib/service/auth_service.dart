import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class AuthService extends GetConnect {

  Future<Response<dynamic>> registerUser(
      String name, String email, String password, String phone, String image, String uid) async {
    var formData = FormData({
      'name': name,
      'phone_no': phone,
      'email': email,
      'password': password,
      'password_confirmation': password,
      'profile_image_url': image,
      'uuid': uid
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

  Future<Response<dynamic>> sendOtp(String email) async {
    var formData = FormData({
      'email': email,
    });
    return await post(baseUrl + 'send-otp', formData);
  }

  Future<Response<dynamic>> validateOtp(String email, String optCode) async {
    var formData = FormData({
      'email': email,
      'opt_code' : optCode
    });
    return await post(baseUrl + 'opt-validate', formData);
  }

  Future<Response<dynamic>> resetPassword(String newPassword, int otpId) async {
    var formData = FormData({
      'new_password': newPassword,
      'opt_id' : otpId
    });
    return await post(baseUrl + 'reset-password', formData);
  }
}
