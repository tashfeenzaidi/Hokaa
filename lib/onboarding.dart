import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gold_crowne/constants.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<dynamic> slides = [
    {
      "image": "assets/onboard1.png",
      "title": "Select",
      "body1": "Choose the flavor you desire for",
      "body2": "Order at your table in just a click"
    },
    {
      "image": "assets/onboard2.png",
      "title": "Pay",
      "body1": "Easy payment integration",
      "body2": "Pay at your convenience"
    },
    {
      "image": "assets/onboard3.png",
      "title": "Served",
      "body1": "We served the best Hookah in town",
      "body2": "Place your order with a single click"
    }
  ];
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primayBackgroundColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: slides.length,
                itemBuilder: (context, index) {
                  // contents of slider
                  return Slider(
                    image: slides[index]["image"],
                    title: slides[index]["title"],
                    body1: slides[index]["body1"],
                    body2: slides[index]["body2"],
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              height: 40,
              width: 100,
              child: ElevatedButton(
                child:
                    Text(currentIndex == slides.length - 1 ? "Next" : "Skip",style:  Theme.of(context).textTheme.button,),
                onPressed: () {
                  if (currentIndex == slides.length - 1) {
                    Get.offAllNamed("/signIn");
                  }

                  _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: currentIndex == index ? 20 : 10,
      width: currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: primaryColor,
      ),
    );
  }
}

class Slider extends StatelessWidget {
  String image;
  String title;
  String body1;
  String body2;

  Slider(
      {required this.image,
      required this.title,
      required this.body1,
      required this.body2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image given in slider
          Image(image: AssetImage(image)),
        
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline1
            ),
          ),
          Text(
            body1,
            style: Theme.of(context).textTheme.headline2
          ),
            Text(
            body2,
            style: Theme.of(context).textTheme.headline2
          )
        ],
      ),
    );
  }
}
