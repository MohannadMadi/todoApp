import 'dart:async';
import 'package:flutter/material.dart';

class CircularTimer extends StatefulWidget {
  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  int _time = 60;
  Timer? _timer;
  bool _isRunning = true;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isRunning = true;
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _time--;
          if (_time == 0) {
            _stopTimer();
          }
        });
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
      _timer?.cancel();
      _timer = null;
    });
  }

  void _resetTimer() {
    setState(() {
      _time = 60;
    });
  }

  void _lapTimer() {
    print('Lap time: ${60 - _time}s');
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
            strokeWidth: 8,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
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
            onPressed: _isRunning ? _stopTimer : _startTimer,
            child: Text(_isRunning ? 'Stop' : 'Start'),
          ),
        ),
        Positioned(
          bottom: 20,
          width: 200,
          child: Center(
            child: ElevatedButton(
              onPressed: _lapTimer,
              child: Text('Lap'),
            ),
          ),
        ),
      ],
    );
  }
}
