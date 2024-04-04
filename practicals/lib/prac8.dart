// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Navigation Example',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Prac8Page(),
//         '/second': (context) => SecondScreen(),
//       },
//     );
//   }
// }
//
// class Prac8Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/second');
//           },
//           child: Text('Go to Second Screen'),
//         ),
//       ),
//     );
//   }
// }
//
// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back to Home'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'prac6.dart';
// import 'prac7.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Prac8Page(),
//         './prac6.dart': (context) => Prac6Page(),
//         './prac7.dart': (context) => Prac7Page(),
//       },
//     );
//   }
// }
//
// class Prac8Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Practical-8'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, './prac6.dart');
//               },
//               child: Text('Go to Practical-6 Screen'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, './prac7.dart');
//               },
//               child: Text('Go to Practical-7 Screen'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'prac6.dart';
// import 'prac7.dart';
//
// class Prac8Page extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Practical-8'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Prac6Page()),
//                 );
//               },
//               child: Text('Go to Practical-6 Page'),
//             ),
//             SizedBox(height: 20),
//
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Prac7Page()),
//                 );
//               },
//               child: Text('Go to Practical-7 Page'),
//             ),
//             SizedBox(height: 20),
//
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:practicals/prac6.dart';
import 'package:practicals/prac7.dart';

class Prac8Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical-8'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prac6Page()),
                );
              },
              child: const Text('Go to Practical-6 Page'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Prac7Page()),
                );
              },
              child: const Text('Go to Practical-7 Page'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
