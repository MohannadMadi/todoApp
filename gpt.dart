import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circuits for Kids',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CircuitPage(),
    );
  }
}

class CircuitPage extends StatefulWidget {
  @override
  _CircuitPageState createState() => _CircuitPageState();
}

class _CircuitPageState extends State<CircuitPage> {
  bool _isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circuits for Kids'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Simple Circuit Example',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Image.asset(
              _isSwitchOn ? 'images/download (1).jpeg' : 'images/download.jpeg',
              width: 150,
            ),
            SizedBox(height: 20 ),
            Switch(
              value: _isSwitchOn,
              onChanged: (bool value) {
                setState(() {
                  _isSwitchOn = value;
                });
              },
            ),
            Text('Toggle switch to turn ON/OFF the light bulb'),
          ],
        ),
      ),
    );
  }
}
