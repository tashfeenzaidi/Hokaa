import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/models/cart_item.dart';
import 'package:gold_crowne/models/products_response_model.dart';

class CartController extends GetxController {
  RxList<CartItem> itemList = RxList<CartItem>();
  RxDouble subTotal = RxDouble(0);
  RxDouble total = RxDouble(0);
  double tax = double.parse(GetStorage().read('tax'));

  add(CartItem item) {
    int flag = 0;
    itemList.asMap().forEach((index, element) {
      if (element.product.id == item.product.id) {
        addQuantity(index);
        flag = 1;
        return;
      }
    });
    if (flag != 1) {
      itemList.add(item);
      getSubTotal();
    }
  }

  delete(CartItem item) {
    itemList.remove(item);
    getSubTotal();
  }

  addQuantity(int product) {
    itemList[product].quantity += 1;
    itemList.refresh();
    getSubTotal();
  }

  deleteQuantity(int product) {
    if (itemList[product].quantity <= 1) {
      showSnackBar('product', 'cont be less then');
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
    total.value = (subTotal.value + (subTotal.value * tax)).roundToDouble();
  }
}
