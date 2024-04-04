// import 'package:flutter/material.dart';
// import 'package:setup/prac3.dart';
//
// class NavigatePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Navigate Page'),
//       ),
//       body: Center(
//         child:
//         ElevatedButton(
//           onPressed: () {
//             // Button pressed action
//             Navigator.push(context,
//             MaterialPageRoute(builder: (context) => GestureDemo()));
//           },
//           child: Text('Practical-3'),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:setup/prac4.dart';
import 'package:setup/prac5.dart';
import 'package:setup/prac3.dart';

class NavigatePage extends StatelessWidget {
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GestureDemo()),
                );
              },
              child: Text('Practical-3'),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add functionality for button 2
                Navigator.push(context, MaterialPageRoute(builder: (context) => TodoList()));
              },
              child: Text('Practical-4'),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add functionality for button 3
                Navigator.push(context, MaterialPageRoute(builder: (context) => ThemePage()));
              },
              child: Text('Practical-5'),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add functionality for button 4
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
              },
              child: Text('Practical-6'),
            ),
            SizedBox(height: 20), // Add spacing between buttons
            ElevatedButton(
              onPressed: () {
                // Add functionality for button 5
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
              },
              child: Text('Practical-7'),
            ),
            // Add more buttons as needed
          ],
        ),
      ),
    );
  }
}

