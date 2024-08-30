// logout.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Logout failed: $e'),
                ),
              );
            }
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
