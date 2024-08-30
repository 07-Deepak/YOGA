import 'package:flutter/material.dart';
import 'package:yoga/AppBar/custom_app_bar.dart';
import 'package:yoga/HomeScreens/ScrollableImageContainer.dart';
import 'package:yoga/HomeScreens/LevelBoxes.dart';
import 'package:yoga/HomeScreens/content_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const LevelBoxes(),
                const SizedBox(height: 20),
                const ContentSection(),
                const SizedBox(height: 20),
                ScrollableImageContainer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
