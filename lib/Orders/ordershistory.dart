import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/Screens/Widgets/loading_widget.dart';
import 'package:gold_crowne/Screens/Widgets/page_top_heading.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/orderList_controller.dart';
import 'package:gold_crowne/controller/order_controller.dart';
import 'package:gold_crowne/models/order_response_model.dart';
import 'package:gold_crowne/models/orders_response_model.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
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
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: PagedListView(
                      builderDelegate:
                          PagedChildBuilderDelegate<Data>(itemBuilder: (context, item, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                              onTap: () {
                                Get.toNamed("/orderDetailsNew");
                              },
                              child: Container(
                                  height: 100,
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
                                              "15th Oct,12:24",
                                              style: littleDateStyle,
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              color: primaryColor,
                                              size: 15,
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
                                              "#1234555555",
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
                                                    "Rejetced",
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
                                              "\$80",
                                              style: historyTextstyle,
                                            ),
                                          ],
                                        ),
                                      ]))),
                        );
                      }),
                      pagingController: _pagingController,
                      // child: ListView.builder(
                      //     itemCount: 10,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.all(8.0),
                      //         child: GestureDetector(
                      //             onTap: () {
                      //               Get.toNamed("/orderDetailsNew");
                      //             },
                      //             child: Container(
                      //                 height: 100,
                      //                 padding: EdgeInsets.all(10),
                      //                 decoration: BoxDecoration(
                      //                   color: cardBackgroundColor,
                      //                   borderRadius: BorderRadius.circular(10),
                      //                 ),
                      //                 child: Column(
                      //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //                     children: [
                      //                       Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             "15th Oct,12:24",
                      //                             style: littleDateStyle,
                      //                           ),
                      //                           Icon(
                      //                             Icons.arrow_forward_ios,
                      //                             color: primaryColor,
                      //                             size: 15,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             "Order ID",
                      //                             style: historyTextstyle,
                      //                           ),
                      //                           Text(
                      //                             "#1234555555",
                      //                             style: historyTextstyle,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             "Status",
                      //                             style: historyTextstyle,
                      //                           ),
                      //                           Row(
                      //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                             children: [
                      //                               Icon(
                      //                                 Icons.cancel,
                      //                                 color: Colors.red,
                      //                                 size: 15,
                      //                               ),
                      //                               Padding(
                      //                                 padding: EdgeInsets.only(left: 10.0),
                      //                                 child: Text(
                      //                                   "Rejetced",
                      //                                   style: historyTextstyle,
                      //                                 ),
                      //                               ),
                      //                             ],
                      //                           ),
                      //                         ],
                      //                       ),
                      //                       Row(
                      //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //                         children: [
                      //                           Text(
                      //                             "Total",
                      //                             style: historyTextstyle,
                      //                           ),
                      //                           Text(
                      //                             "\$80",
                      //                             style: historyTextstyle,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ]))),
                      //       );
                      //     }),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
