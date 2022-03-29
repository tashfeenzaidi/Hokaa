import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:gold_crowne/models/products_response_model.dart';
import 'package:gold_crowne/service/product_service.dart';

class ProductController extends GetxController with StateMixin<ProductResponseModel> {
  RxBool isSearchClicked = RxBool(false);

  @override
  onInit() {
    getProducts();
    super.onInit();
  }

  getProducts() {
    // change(null, status: RxStatus.loading());
    ProductService().getProducts().then((value) {
      if (value.statusCode == 200) {
        change(ProductResponseModel.fromJson(jsonDecode(value.bodyString!)),
            status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    });
  }
}
