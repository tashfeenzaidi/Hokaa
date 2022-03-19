import 'package:get/get_connect.dart';
import 'package:gold_crowne/constant/constants.dart';

class BaseService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;

    super.onInit();
  }
}
