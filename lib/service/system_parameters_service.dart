import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class SystemParametersService extends GetConnect {
  Future<Response<dynamic>> getSystemParameters() async =>
      await get(baseUrl + 'system_parameter', headers: {authorization: GetStorage().read('token')});
}
