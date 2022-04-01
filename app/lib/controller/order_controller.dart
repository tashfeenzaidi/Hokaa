import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:gold_crowne/models/order_response_model.dart';
import 'package:gold_crowne/service/order_service.dart';

class OrderController extends GetxController with StateMixin<OrderResponseModel> {
  createOrder() {
    OrderService().createOder().then((value) {
      if (value.statusCode! == 201) {
        Get.toNamed('/paymentDone');
      } else {
        Get.toNamed('/paymentCancel');
      }
    });
  }
}
