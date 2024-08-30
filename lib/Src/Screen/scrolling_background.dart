import 'dart:async';
import 'package:flutter/material.dart';

class ScrollingBackground extends StatefulWidget {
  @override
  _ScrollingBackgroundState createState() => _ScrollingBackgroundState();
}

class _ScrollingBackgroundState extends State<ScrollingBackground> {
  late PageController _pageController;
  final List<String> _imagePaths = [
    'assets/landing/home.jpg',
    'assets/landing/home1.jpg',
    'assets/landing/home2.jpg',
    'assets/landing/home3.jpg',
  ];

  int _currentPage = 0;
  final _pageDuration = Duration(seconds: 2);

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    Timer.periodic(_pageDuration, (timer) {
      if (_pageController.hasClients) {
        _currentPage = (_currentPage + 1) % _imagePaths.length;
        _pageController.animateToPage(
          _currentPage,
          duration: _pageDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: _imagePaths.length,
      itemBuilder: (context, index) {
        return Image.asset(
          _imagePaths[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
