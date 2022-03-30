import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:gold_crowne/models/products_response_model.dart';
import 'package:gold_crowne/service/product_service.dart';

class ProductController extends GetxController with StateMixin<List<Data>> {
  RxBool isSearchClicked = RxBool(false);

  List<Data> productList = [];
  @override
  onInit() {
    getProducts();
    super.onInit();
  }

  productSearch(String val) {
    change(
        val.isEmpty
            ? productList
            : productList
                .where((element) => element.name!.toLowerCase().contains(val.toLowerCase()))
                .toList(),
        status: RxStatus.success());
  }

  getProducts() {
    // change(null, status: RxStatus.loading());
    ProductService().getProducts().then((value) {
      if (value.statusCode == 200) {
        productList = ProductResponseModel.fromJson(jsonDecode(value.bodyString!)).data!;
        change(productList, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.empty());
      }
    });
  }
}
