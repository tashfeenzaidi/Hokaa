import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:gold_crowne/Screens/CheckOutCard/creditcard.dart';
import 'package:gold_crowne/Screens/CheckOutCard/paybycash.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/tab_state_controller.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TabStateController _stateController = Get.put(TabStateController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.animation?.addListener(() {
      _stateController.currentTab.value = _tabController.index;
      _stateController.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: cardBackgroundColor, borderRadius: BorderRadius.all(Radius.circular(20))),
      child: GetBuilder<TabStateController>(
        init: TabStateController(),
        initState: (_) => TabStateController().currentTab,
        builder: (_controller) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: TabBar(
              controller: _tabController,
              indicatorWeight: 2,
              unselectedLabelColor: cardBackgroundColor,
              indicatorColor: cardBackgroundColor,
              labelColor: primaryColor,
              indicator: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(_controller.currentTab.value == 1 ? 0 : 20),
                    topRight: Radius.circular(_controller.currentTab.value == 1 ? 20 : 0),
                  )),
              tabs: [
                Tab(
                  child: Center(
                    child: Image.asset(
                      "assets/cash.png",
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/visa.png",
                        height: 40,
                        width: 40,
                      ),
                      Image.asset(
                        "assets/mastercard.png",
                        height: 40,
                        width: 40,
                      )
                    ],
                  ),
                ),
              ],
              onTap: (val) {
                _controller.currentTab.value = val;
                _controller.update();
              },
            ),
            body: TabBarView(
              controller: _tabController,
              children: [PayByCash(), CreditCardFields()],
            ),
          );
        },
      ),
    );
  }
}
