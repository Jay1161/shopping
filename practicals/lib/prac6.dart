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
//       //title: 'Custom Widgets & State Management',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Prac6Page(),
//     );
//   }
// }
//
// class Prac6Page extends StatefulWidget {
//   @override
//   _CounterScreenState createState() => _CounterScreenState();
// }
//
// class _CounterScreenState extends State<Prac6Page> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _decrementCounter() {
//     setState(() {
//       _counter--;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Counter App'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Counter Value:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             SizedBox(height: 20),
//             CounterButtons(
//               onIncrement: _incrementCounter,
//               onDecrement: _decrementCounter,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CounterButtons extends StatelessWidget {
//   final VoidCallback onIncrement;
//   final VoidCallback onDecrement;
//
//   CounterButtons({required this.onIncrement, required this.onDecrement});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         FloatingActionButton(
//           onPressed: onIncrement,
//           tooltip: 'Increment',
//           child: Icon(Icons.add),
//         ),
//         FloatingActionButton(
//           onPressed: onDecrement,
//           tooltip: 'Decrement',
//           child: Icon(Icons.remove),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Prac6Page(),
    );
  }
}

class Prac6Page extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<Prac6Page> {
  int _counter = 0;
  bool _showEmail = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _toggleEmail() {
    setState(() {
      _showEmail = !_showEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practical-6'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go Back'),
            ),
            SizedBox(height: 20),

            GestureDetector(
              child: Text(
                _showEmail ? 'd22it183@charusat.edu.in' : 'Jay Vaja',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleEmail,
              child: Text(_showEmail ? 'Hide Email' : 'Show Email'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Counter Value:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            CounterButtons(
              onIncrement: _incrementCounter,
              onDecrement: _decrementCounter,
            ),
          ],
        ),
      ),
    );
  }
}

class CounterButtons extends StatelessWidget {
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  CounterButtons({required this.onIncrement, required this.onDecrement});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FloatingActionButton(
          onPressed: onDecrement,
          tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: onIncrement,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
