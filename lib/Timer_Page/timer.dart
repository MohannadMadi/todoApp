import 'dart:async';
import 'package:flutter/material.dart';

class CircularTimer extends StatefulWidget {
  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  int _time = 8;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resetTimer() {
    setState(() {
      _time = 0;
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          child: CircularProgressIndicator(
            value: _time / 60,
            strokeWidth: 10,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            semanticsLabel: '${(_time / 60 * 100).toStringAsFixed(0)}%',
          ),
        ),
        Positioned(
          left: 20,
          bottom: 20,
          child: ElevatedButton(
            onPressed: _resetTimer,
            child: Text('Reset'),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 20,
          child: ElevatedButton(
            onPressed: _stopTimer,
            child: Text('Stop'),
          ),
        ),
      ],
    );
  }
}
