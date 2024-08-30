import 'package:flutter/material.dart';

class ContentSection extends StatefulWidget {
  const ContentSection({super.key});

  @override
  _ContentSectionState createState() => _ContentSectionState();
}

class _ContentSectionState extends State<ContentSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final String fullText =
        'Because of all the movement of your torso, as well as other parts of your body, it’s not a good idea to have a full meal within two hours of practicing yoga, says Barr. If you do need a light snack or you’re taking a class shortly after you wake up in the morning, stick to simple carbs, energizing snacks, or foods that are easy to digest. You might experiment with which foods work best for you; toast, nut butters, bananas, or low-fat yogurt are all good options before a workout, notes the American College of Sports Medicine.';
    final String truncatedText = 'What Should I Eat Before Yoga Class?';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Important Tips',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8.0),
            AnimatedCrossFade(
              firstChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    truncatedText,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: const Text('Show More'),
                  ),
                ],
              ),
              secondChild: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    fullText,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8.0),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: const Text('Show Less'),
                  ),
                ],
              ),
              crossFadeState: _isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
