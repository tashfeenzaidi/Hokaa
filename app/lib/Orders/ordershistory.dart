import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/Widgets/back_button.dart';
import 'package:gold_crowne/Screens/Widgets/custom_appbar.dart';
import 'package:gold_crowne/Screens/Widgets/loading_widget.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/orderList_controller.dart';
import 'package:gold_crowne/controller/order_controller.dart';
import 'package:gold_crowne/models/order_response_model.dart';
import 'package:gold_crowne/models/orders_response_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../utils.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final OrderListController _controller = Get.put(OrderListController());
  final PagingController<int, Data> _pagingController = PagingController(firstPageKey: 1);
  static const _pageSize = 20;

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose(){
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      await _controller.fetchPage(pageKey).then((value) {
        final newItems = OrdersResponseModel.fromJson(jsonDecode(value.bodyString!)).data;
        final isLastPage = newItems!.length < _pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(newItems);
        } else {
          int nextPageKey = pageKey + newItems.length;
          _pagingController.appendPage(newItems, nextPageKey);
        }
      });
    } catch (error) {
      _pagingController.error = error;
    }
  }

  getStatusIcon(int status) {
    switch (status) {
      case 1:
        Icons.remove_circle_sharp;
        break;
      case 2:
        Icons.check_circle_sharp;
        break;
      case 3:
        Icons.check_circle_sharp;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: CustomAppBar(),
        extendBodyBehindAppBar: true,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background_pic.png"), fit: BoxFit.cover)),
          child: SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: primayBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              child: Column(
                children: [
                  Container(margin: EdgeInsets.only(top: 15), child: PageTopHeading('MY ORDERS')),
                  Expanded(
                      child: RefreshIndicator(
                        color: primaryColor,
                        onRefresh: () => Future.sync(
                              () => _pagingController.refresh(),
                        ),
                        child: PagedListView<int,Data>(
                          builderDelegate:
                          PagedChildBuilderDelegate<Data>(
                            firstPageProgressIndicatorBuilder: (_) => SpinKitSquareCircle(itemBuilder:(BuildContext context, int index) {
                              return DecoratedBox(
                                decoration: BoxDecoration(
                                color: index.isEven ? primaryColor : cardColor,
                                ),
                              );
                            },),
                              itemBuilder: (context, item, index) {
                              return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed("/orderDetailsNew", arguments: item);
                              },
                              child: Container(
                                  height: 120,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: cardBackgroundColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              Utils.getDate(DateTime.parse(item.createdAt!)),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1!
                                                  .copyWith(color: primaryColor, fontSize: 14),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              color: primaryColor,
                                              size: 18,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Order ID",
                                              style: historyTextstyle,
                                            ),
                                            Text(
                                              '${item.id!}',
                                              style: historyTextstyle,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Status",
                                              style: historyTextstyle,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.cancel,
                                                  color: Colors.red,
                                                  size: 15,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10.0),
                                                  child: Text(
                                                    item.status!,
                                                    style: historyTextstyle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total",
                                              style: historyTextstyle,
                                            ),
                                            Text(
                                              "\$ ${item.totalPrice!}",
                                              style: historyTextstyle,
                                            ),
                                          ],
                                        ),
                                      ]))),
                        );}),
                          pagingController: _pagingController,

                  ),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
