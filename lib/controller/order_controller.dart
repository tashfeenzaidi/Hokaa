import 'package:get/state_manager.dart';
import 'package:gold_crowne/service/order_service.dart';

class OrderController extends GetxController with StateMixin {
  getOrderList() {
    change(null, status: RxStatus.loading());

    OrderService().getAllOrder(1).then((value) {
      change(null, status: RxStatus.error('no orders'));
    });
  }

  @override
  void onInit() {
    getOrderList();
    super.onInit();
  }
}
