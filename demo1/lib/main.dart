import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CHARUSAT'),

      ),

      body: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,

          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow,
                child: const Text("Attendance"),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow,
                child: const Text('Result'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow,
                child: const Text('Time Table'),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow,
                child: const Text('Syllabus'),
    ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow,
                child: const Text('Library'),
    ),
            Container(
                padding: const EdgeInsets.all(8),
                color: Colors.yellow,
                child: const Text('About CHARUSAT')
            ),
        ],
      ),
    );
  }
}