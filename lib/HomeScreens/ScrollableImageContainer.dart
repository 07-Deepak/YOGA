import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Import the package
import 'package:yoga/Authentication/login_screen.dart';
import 'package:yoga/Authentication/registerscreen.dart';
import 'package:yoga/Src/Screen/landing_screen.dart';

class ScrollableImageContainer extends StatefulWidget {
  ScrollableImageContainer({super.key});

  @override
  _ScrollableImageContainerState createState() =>
      _ScrollableImageContainerState();
}

class _ScrollableImageContainerState extends State<ScrollableImageContainer> {
  final PageController _pageController = PageController();
  final List<String> imagePaths = [
    'assets/landing/home.jpg',
    'assets/landing/home1.jpg',
    'assets/landing/home2.jpg',
  ];

  final List<Widget> pages = [
    LoginScreen(),
    RegisterScreen(),
    LandingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 200.0, // Adjust as needed
          child: PageView.builder(
            controller: _pageController,
            itemCount: imagePaths.length, // Number of images
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the corresponding page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pages[index],
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Full width of the device
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    imagePaths[index], // Load local image
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(
            height: 10.0), // Space between the PageView and indicator
        SmoothPageIndicator(
          controller: _pageController,
          count: imagePaths.length,
          effect: WormEffect(
            dotHeight: 8.0,
            dotWidth: 8.0,
            spacing: 16.0,
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
          ),
          onDotClicked: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}
