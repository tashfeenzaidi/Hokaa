import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/product_controller.dart';
import 'package:gold_crowne/drawer.dart';

import 'Widgets/tab_button_widget.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> with SingleTickerProviderStateMixin {
  int selected = -1;
  int tab = 1;
  late TabController _tabController;
  ProductController _productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: appbar(context),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/background_pic.png"), fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            children: [
              TabBar(
                controller: _tabController,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                unselectedLabelStyle: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                  color: primayBackgroundColor,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                // indicatorColor: primaryColor,
                unselectedLabelColor: primayBackgroundColor,
                labelColor: primaryColor,
                labelStyle: Theme.of(context).textTheme.button!.copyWith(fontSize: 14),
                isScrollable: false,
                onTap: (val) {
                  setState(() {});
                },
                tabs: [
                  Tab(
                    height: 35,
                    child: TabButton(_tabController.index == 0 ? primaryColor : Colors.black,
                        'Single', "assets/small.png"),
                  ),
                  Tab(
                    height: 35,
                    child: TabButton(
                      _tabController.index == 1 ? primaryColor : Colors.black,
                      'Mix',
                      "assets/small.png",
                      secondIcon: "assets/small.png",
                    ),
                  ),
                ],
              ),
              _productController.obx(
                (products) => Expanded(
                  child: GridView.builder(
                      itemCount: products!.data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 0.8, crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                              Get.toNamed("/productDetail");
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.43,
                                    height: MediaQuery.of(context).size.height * 0.6,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF242424),
                                        border: Border.all(
                                            color: selected == index
                                                ? primaryColor
                                                : Color(0xFF242424)),
                                        borderRadius: BorderRadius.circular(25)),
                                  ),
                                  Positioned(
                                    top: MediaQuery.of(context).size.height * 0.03,
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.3,
                                      height: MediaQuery.of(context).size.height * 0.16,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(products.data![index].image!),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                      bottom: MediaQuery.of(context).size.height * 0.04,
                                      child: Text(
                                        products.data![index].name!,
                                        style: Theme.of(context).textTheme.subtitle1,
                                      )),
                                  Positioned(
                                      bottom: MediaQuery.of(context).size.height * 0.01,
                                      left: 25,
                                      child: Text(
                                        "\$ ${products.data![index].price!}",
                                        style: Theme.of(context).textTheme.subtitle1,
                                      )),
                                  Positioned(
                                    bottom: MediaQuery.of(context).size.height * 0.01,
                                    right: 20,
                                    child: Image.asset(
                                      "assets/shopping_cart.png",
                                      width: 25,
                                      height: 25,
                                      color: primaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ));
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
