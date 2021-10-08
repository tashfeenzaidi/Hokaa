import 'package:flutter/material.dart';
import 'package:gold_crowne/appbar.dart';
import 'package:gold_crowne/constants.dart';
import 'package:gold_crowne/drawer.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context),
      appBar: appbar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: primaryColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.black,
                  minWidth: 100,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.umbrella,
                        color: Colors.white,
                      ),
                      Text(
                        "Single",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 100,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.umbrella),
                      Text(
                        "Mix",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 100,
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(
                        Icons.umbrella,
                      ),
                      Text(
                        "Sort by",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.43,
                              height: MediaQuery.of(context).size.height * 0.6,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/more.png"),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(25)),
                            ),
                            Positioned(
                                bottom: 30,
                                child: Text(
                                  "Love",
                                  style: Theme.of(context).textTheme.subtitle1,
                                )),
                            Positioned(
                                bottom: 10,
                                left: 20,
                                child: Text(
                                  "\$ 23",
                                  style: Theme.of(context).textTheme.subtitle1,
                                )),
                            Positioned(
                                bottom: 10,
                                right: 20,
                                child: Icon(
                                  Icons.add_shopping_cart,
                                  color: primaryColor,
                                ))
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
