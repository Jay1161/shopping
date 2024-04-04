// Import necessary libraries
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart'; // Displaying Lottie animations
import 'home_screen.dart'; // Navigating to the HomeScreen

// Define the SplashScreen widget
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  // UI for the SplashScreen
  @override
  Widget build(BuildContext context) {

    // Introduce a delayed transition to the HomeScreen
    Future.delayed(
      const Duration(seconds: 4), // Delay for 4 seconds
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()), // Navigate to HomeScreen
      ),
    );

    // Build the SplashScreen UI
    return Scaffold(
      body: Center(
        child: Lottie.asset('assets/logo.json'), // Display animation json file
      ),
    );
  }
}
