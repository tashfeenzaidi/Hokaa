import 'dart:io';

import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class MyAccountService extends GetConnect{
  String token = GetStorage().read('token');

  Future<Response<dynamic>>updateUser(Map<String,dynamic> map) async{
    var formData = FormData(map);

    return await post(baseUrl+'profile',formData,headers: {'Authorization':token});
  }

  Future<Response<dynamic>> updateProfilePic(File file) async {
    final formData = FormData({
      'image':MultipartFile(file,filename: file.path)
    });

    return await post(baseUrl+'profile',formData ,headers: {'Authorization': token},);
  }

}