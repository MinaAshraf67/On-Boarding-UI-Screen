import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image;
  final String title;
  final String body;
  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // PageView Controller
  var boardController = PageController();

  // To check if the PageView on Last page or not, if On Last page Make "Skip" Not Visible
  bool isLast = false;

  Color primaryColor = const Color(0xFFFF6600);

// PageView Data Model
  List<BoardingModel> boarding = [
    BoardingModel(
      image: 'assets/images/onboard1.png',
      title: 'Never Stop Learning',
      body: 'Expand you Knowledge in Covid 19\n Lockdown',
    ),
    BoardingModel(
      image: 'assets/images/onboard2.png',
      title: 'Complet Courses',
      body: 'Eas to enroll Courses & Complete with\n in a short time',
    ),
    BoardingModel(
      image: 'assets/images/onboard3.png',
      title: 'Complet Courses',
      body: 'Eas to enroll Courses & Complete with\n in a short time',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // If you're on last page Make Skip Non-Visible
          showSkip(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length, // PageView Count
                physics: const BouncingScrollPhysics(),
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            SmoothPageIndicator(
              controller: boardController,
              count: boarding.length,
              effect: ExpandingDotsEffect(
                dotHeight: 10.0,
                dotWidth: 10.0,
                activeDotColor: primaryColor,
                dotColor: const Color(0xFFC4C5C4),
                expansionFactor: 3.0,
              ),
              onDotClicked: (index) {
                boardController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInSine,
                );
              },
            ),
            const SizedBox(
              height: 35.0,
            ),
            SizedBox(
              height: 80.0,
              width: 80.0,
              child: FloatingActionButton(
                onPressed: () {
                  boardController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInSine,
                  );
                },
                elevation: 0.0,
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //OnBording Design
  Widget buildBoardingItem(BoardingModel model) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Image(
              image: AssetImage(model.image),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Text(
            model.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF646161),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
        ],
      );
// Make "Skip" Non-Visible in Last Page
  Widget showSkip() {
    if (isLast == false) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          right: 40.0,
        ),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            'Skip',
            style: TextStyle(
              color: Color(0xFFE872FB),
              fontSize: 18.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
