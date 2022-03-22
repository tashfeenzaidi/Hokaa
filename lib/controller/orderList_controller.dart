import 'dart:convert';

import 'package:get/get.dart';
import 'package:gold_crowne/models/order_response_model.dart';
import 'package:gold_crowne/models/orders_response_model.dart';
import 'package:gold_crowne/service/order_service.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class OrderListController extends GetxController {
  static const _pageSize = 20;

  Future<Response<dynamic>> fetchPage(int pageKey) async {
    return await OrderService().getAllOrder(pageKey);
  }
}
