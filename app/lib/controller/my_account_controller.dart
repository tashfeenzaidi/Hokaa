import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/service/my_account_service.dart';

import '../models/user_response_model.dart';

enum AppState {
  free,
  picked,
  cropped,
}

class MyAccountController extends GetxController{
  Rx<AppState> state = Rx<AppState>(AppState.free);
  final user = User().obs;

  @override
  onInit(){
    state.value = AppState.free;
    var map = GetStorage().read('user');
    if(map != null) {
      User userMap = User.fromJson(map);
      user.update((val) {
        val?.name = userMap.name;
        val?.email = userMap.email;
        val?.phoneNo = userMap.phoneNo;
        val?.profileImageUrl = userMap.profileImageUrl;
      });
    }
    super.onInit();
  }

  updateProfilePic(File imageFile){
    MyAccountService().updateProfilePic(imageFile).then((value) {
      if(value.statusCode == 200){
        Get.snackbar('Image', 'image uploaded successfully');
        final user = jsonDecode(value.bodyString!)['data'];
        final userModel = User.fromJson(user);
        GetStorage().write('user', userModel.toJson());
        onInit();
      }else{
        Get.snackbar('Image', 'image uploaded failed');
      }
    });
  }

  updateUser(){
    Map<String,dynamic> map = Map();
    MyAccountService().updateUser(user.toJson()).then((value){
      if(value.statusCode == 200){
        Get.snackbar('Profile', 'Profile updated successfully');
        GetStorage().write('user', jsonDecode(value.bodyString!)['data']);
      }
    });
  }

}