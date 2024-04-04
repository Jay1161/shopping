import 'package:flutter/material.dart';

// Defining the HomeScreen widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Building the UI for the HomeScreen
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // App bar with title
      appBar: AppBar(
        title: const Text('Animated Icon'),
      ),

      // Center a column of widgets
      body: Center(

        // Align child elements vertically in the center
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display animated icons from assets folder
            Image.asset('assets/icons/analytics.gif', height: 100),
            Image.asset('assets/icons/speedometer.gif', height: 100),
            Image.asset('assets/icons/coding.gif', height: 100),
            Image.asset('assets/icons/password.gif', height: 100),
          ],
        ),
      ),
    );
  }
}
