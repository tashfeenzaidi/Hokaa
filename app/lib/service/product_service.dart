import 'package:get/get_connect.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';

class ProductService extends GetConnect {
  String token = GetStorage().read('token');

  Future<Response<dynamic>> getProducts() async =>
      await get(baseUrl + 'product', headers: {'Authorization': token});
}
