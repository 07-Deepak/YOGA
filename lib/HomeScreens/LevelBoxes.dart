import 'package:flutter/material.dart';
import 'beginner_page.dart';
import 'expert_page.dart';
import 'level_page.dart';

class LevelBoxes extends StatelessWidget {
  const LevelBoxes({super.key});

  void _navigateToPage(BuildContext context, String level) {
    Widget page;
    if (level == 'Beginner') {
      page = const BeginnerPage();
    } else if (level == 'Expert') {
      page = const ExpertPage();
    } else {
      page = LevelPage(level: level); // Default page if needed
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _navigateToPage(context, 'Beginner'),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/HomeScreen/Beginner.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Beginner',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 28, 51, 54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: GestureDetector(
            onTap: () => _navigateToPage(context, 'Expert'),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/HomeScreen/Expert.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Expert',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 28, 51, 54),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
