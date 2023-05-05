import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularTimer extends StatefulWidget {
  @override
  _CircularTimerState createState() => _CircularTimerState();
}

class _CircularTimerState extends State<CircularTimer> {
  double _time = 60;
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
      _timer = Timer.periodic(Duration(milliseconds: 5), (timer) {
        setState(() {
          _time -= .005;
          if (_time <= .01) {
            _time = 0;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          "Stopwatch",
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Colors.black),
        ),
        CircularPercentIndicator(
          radius: (MediaQuery.of(context).size.width / 2) - 30,
          lineWidth: 6,
          circularStrokeCap: CircularStrokeCap.round,
          reverse: true,
          progressColor: Color(0xFF1CC600),
          percent: (_time) / 60,
          backgroundColor: Colors.grey.shade200,
          center: Text(
            _time.toInt().toString(),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
              fontSize: 45,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              onPressed: _isRunning ? _stopTimer : _startTimer,
              child: Text(
                _isRunning ? 'Stop' : 'Start',
                style: TextStyle(
                    color: Color(0xFF8F00FF),
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  backgroundColor: Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              onPressed: _resetTimer,
              child: Text(
                'Reset',
                style: TextStyle(
                    color: Color(0xFFFF0000),
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 4,
              backgroundColor: Color(0xFFFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
          onPressed: () {
            print((_time / 60));
          },
          child: Text(
            'Lap',
            style: TextStyle(
                color: Colors.green,
                fontSize: 15,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
