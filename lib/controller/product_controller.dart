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
    successStatus(val.isEmpty
        ? productList
        : productList
            .where((element) => element.name!.toLowerCase().contains(val.toLowerCase()))
            .toList());
  }

  filterProduct(int isSingle) {
    switch (isSingle) {
      case 0:
        successStatus(productList);
        break;
      case 1:
        successStatus(productList.where((element) => element.isSingle == 0).toList());
        break;
      case 2:
        successStatus(productList.where((element) => element.isSingle == 1).toList());
        break;
    }
  }

  getProducts() {
    // change(null, status: RxStatus.loading());
    ProductService().getProducts().then((value) {
      if (value.statusCode == 200) {
        productList = ProductResponseModel.fromJson(jsonDecode(value.bodyString!)).data!;
        successStatus(productList);
      } else {
        change(null, status: RxStatus.empty());
      }
    });
  }

  successStatus(List<Data> list) {
    change(list, status: RxStatus.success());
  }
}
