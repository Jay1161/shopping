import 'package:flutter/material.dart';
import 'package:practicals/chatscreen.dart';
import 'package:practicals/prac6.dart';
import 'package:practicals/prac7.dart';

import 'prac8.dart';

class PracticalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigate Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to the destination page when the button is pressed
                Navigator.push(context, MaterialPageRoute(builder: (context) => Prac6Page()),);
              },
              child: Text('Practical-6'),
            ),
            SizedBox(height: 20),
            // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add functionality for button 2
                Navigator.push(context, MaterialPageRoute(builder: (context) => Prac7Page()));
              },
              child: Text('Practical-7'),
            ),
            SizedBox(height: 20), // Add spacing between buttons

            ElevatedButton(
              onPressed: () {
                // Add functionality for button 3
                Navigator.push(context, MaterialPageRoute(builder: (context) => Prac8Page()));
              },
              child: Text('Practical-8'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Add functionality for button 4
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ChatBody()));
              },
              child: Text('Practical-9'),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Add functionality for button 5
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
              },
              child: Text('Practical-10'),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}