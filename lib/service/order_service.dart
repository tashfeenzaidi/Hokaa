import 'package:get/get_connect.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/cart_controller.dart';

class OrderService extends GetConnect {
  String token = GetStorage().read('token');
  CartController _cartController = Get.put(CartController());

  Future<Response<dynamic>> createOder() async {
    Map<String, dynamic> data = Map<String, dynamic>();
    var list = [];
    _cartController.itemList.forEach((element) {
      var item = Map<String, dynamic>();
      item = {'product_id': element.product.id, 'qty': element.quantity};
      list.add(item);
    });
    data['items'] = list;
    data['event_id'] = 1;
    return await post(baseUrl + 'order/checkout', data, headers: {'Authorization': token});
  }

  Future<Response<dynamic>> getAllOrder(int pageKey) async =>
      await get(baseUrl + 'order?page=$pageKey', headers: {'Authorization': token});
}
