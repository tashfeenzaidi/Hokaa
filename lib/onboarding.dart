import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<dynamic> slides = [
    {"image": "assets/logo.png"},
    {"image": "assets/logo.png"},
    {"image": "assets/logo.png"}
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
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
              child: ElevatedButton(
                child:
                    Text(currentIndex == slides.length - 1 ? "Next" : "Skip"),
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
      backgroundColor: Colors.white,
    );
  }

// container created for dots
  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.green,
      ),
    );
  }
}

class Slider extends StatelessWidget {
  String image;

  Slider({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // image given in slider
          Image(image: AssetImage(image)),
          SizedBox(height: 25),
          Text(
            "Title",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "body",
            style: TextStyle(fontSize: 25),
          )
        ],
      ),
    );
  }
}
