import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  bool _isAnimating = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_isAnimating == true) {
            _isAnimating = false;
          } else {
            _isAnimating = true;
          }
        });
        // Code to trigger animation goes here
        // You can use AnimatedBuilder or any other animation technique
        // to animate the button
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        color: _isAnimating ? Colors.red : Colors.blue,
        child: Text(
          'Button',
          style: TextStyle(color: Colors.white),
        ),
        padding: EdgeInsets.all(16),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            10,
            (index) => ButtonWidget(),
          ),
        ),
      ),
    );
  }
}
