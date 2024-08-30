import 'package:flutter/material.dart';

class LevelPage extends StatelessWidget {
  final String level;
  const LevelPage({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$level Level'),
      ),
      body: Center(
        child: Text('Welcome to $level level!'),
      ),
    );
  }
}
