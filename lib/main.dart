import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:yoga/Authentication/login_screen.dart';
import 'package:yoga/Authentication/registerscreen.dart';
import 'package:yoga/OnBoardingPage/onboarding_screen.dart';
import 'package:yoga/Src/Screen/home_screen.dart';
import 'package:yoga/Src/Screen/landing_screen.dart';
import 'package:yoga/Theme/font.dart'; // Import the theme

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBC7AOdKZCZV97Tlu2T7I5Fa4BnwGFoVOo',
      authDomain: 'yoga-e92db.firebaseapp.com',
      projectId: 'yoga-e92db',
      storageBucket: 'yoga-e92db.appspot.com',
      messagingSenderId: '322477041175',
      appId: '1:322477041175:android:1d8fed7299d70bee3f5e52',
      measurementId:
          'G-MEASUREMENT_ID', // Replace with actual measurement ID if available
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yoga App',
      debugShowCheckedModeBanner: false,
      theme: appTheme, // Use the custom theme
      home: AuthCheck(), // Check authentication state
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/landing': (context) => LandingScreen(),
      },
    );
  }
}

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return OnboardingScreen();
        }
      },
    );
  }
}
