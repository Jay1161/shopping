import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.spaceMonoTextTheme(),
      ),
      home: ThemePage(),
    );
  }
}

class ThemePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical-5'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Custom Page',
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Button Pressed", style: GoogleFonts.spaceMono()), // Custom font for title
                    content: Text("You pressed the button!", style: GoogleFonts.spaceMono()), // Custom font for content
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child:  Text("Close", style: GoogleFonts.spaceMono()), // Custom font for button text
                      ),
                    ],
                  ),
                );
              },
              child: Text('Press Me', style: GoogleFonts.spaceMono()), // Custom font for button text
            ),
          ],
        ),
      ),
    );
  }
}
