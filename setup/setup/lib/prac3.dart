import 'package:flutter/material.dart';
import 'package:setup/setup.dart';


class GestureDemo extends StatefulWidget {
  @override
  _GestureDemoState createState() => _GestureDemoState();
}

class _GestureDemoState extends State<GestureDemo> {
  String _gestureType = 'No gesture detected';

  void _updateGesture(String gesture) {
    setState(() {
      _gestureType = gesture;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => _updateGesture('Tap'),
              onDoubleTap: () => _updateGesture('Double Tap'),
              onLongPress: () => _updateGesture('Long Press'),
              onPanUpdate: (_) => _updateGesture('Pan'),
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                color: Colors.blue,
                child: Text(
                  'Gesture Area',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              _gestureType,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () => {
                //Navigator.push(context, MaterialPageRoute(builder: (context) =>badal()))
              },
              child: Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(20.0),
                color: Colors.blue,
                child: Text(
                  'Page Navigation',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
