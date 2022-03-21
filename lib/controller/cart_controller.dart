import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:gold_crowne/models/cart_item.dart';
import 'package:gold_crowne/models/products_response_model.dart';

class CartController extends GetxController {
  RxList<CartItem> itemList = RxList<CartItem>();
  RxDouble subTotal = RxDouble(0);
  RxDouble total = RxDouble(0);

  add(CartItem item) {
    itemList.add(item);
    getSubTotal();
  }

  addQuantity(int product) {
    itemList[product].quantity += 1;
    itemList.refresh();
    getSubTotal();
  }

  deleteQuantity(int product) {
    if (itemList[product].quantity <= 1) {
      Get.snackbar('product', 'cont be less then');
      return;
    }
    itemList[product].quantity -= 1;
    itemList.refresh();
    getSubTotal();
  }

  getSubTotal() {
    var total = 0.0;
    itemList.forEach((element) {
      total += (double.parse(element.product.price!) * element.quantity);
    });
    subTotal.value = total;
    getTotal();
  }

  getTotal() {
    total.value = (subTotal.value + (subTotal.value * 0.03)).roundToDouble();
  }
}
