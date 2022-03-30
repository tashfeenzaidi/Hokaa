import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constant/constants.dart';
import 'package:gold_crowne/controller/cart_controller.dart';
import 'package:gold_crowne/controller/product_controller.dart';
import 'package:gold_crowne/drawer.dart';
import 'package:gold_crowne/models/cart_item.dart';

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
  CartController _controller = Get.put(CartController());
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: CustomAppBar(),
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
                  _productController.filterProduct(_tabController.index);
                },
                tabs: [
                  Tab(
                    height: 35,
                    child:
                        TabButton(_tabController.index == 0 ? primaryColor : Colors.black, 'All'),
                  ),
                  Tab(
                    height: 35,
                    child: TabButton(
                        _tabController.index == 1 ? primaryColor : Colors.black, 'Single',
                        icon: "assets/small.png"),
                  ),
                  Tab(
                    height: 35,
                    child: TabButton(
                      _tabController.index == 2 ? primaryColor : Colors.black,
                      'Mix',
                      icon: "assets/small.png",
                      secondIcon: "assets/small.png",
                    ),
                  ),
                ],
              ),
              _productController.obx(
                (products) => Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(
                        itemCount: products!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.8),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = index;
                                });
                                Get.toNamed("/productDetail", arguments: index);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    color: Color(0xFF242424),
                                    border: Border.all(
                                        color:
                                            selected == index ? primaryColor : Color(0xFF242424)),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Spacer(),
                                    Image.network(products[index].image!),
                                    Text(
                                      products[index].name!,
                                      style: Theme.of(context).textTheme.subtitle1,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$ ${products[index].price!}",
                                          style: Theme.of(context).textTheme.subtitle1,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            _controller.add(CartItem(product: products[index]));
                                          },
                                          icon: Image.asset(
                                            "assets/shopping_cart.png",
                                            width: 25,
                                            height: 25,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ));
                        }),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
