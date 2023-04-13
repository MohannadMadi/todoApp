import 'package:flutter/material.dart';
import '../home/task_button.dart';

Icon _checkIcon = const Icon(Icons.circle_outlined);
bool _checkChecker = true;
var taskTime = const TimeOfDay(hour: 10, minute: 00);
Color buttonColor = const Color(0xFFECFFE9);
Color taskTimeColor = const Color(0xFF9B9B9B);
bool rotated = true;
Tween<double> animatedIcon = Tween(begin: 1, end: 0);

String? taskDescription = "sda";

class _CalendarTrashBin extends StatefulWidget {
  const _CalendarTrashBin({super.key});

  @override
  State<_CalendarTrashBin> createState() => __CalendarTrashBinState();
}

class __CalendarTrashBinState extends State<_CalendarTrashBin> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        hoverColor: Colors.transparent,
        onPressed: () {},
        icon: const Icon(
          Icons.delete_outline_rounded,
          color: Color(0xFFFF0000),
        ));
  }
}

class CalendarButton extends StatefulWidget {
  const CalendarButton({super.key});

  @override
  State<CalendarButton> createState() => _CalendarButtonState();
}

class _CalendarButtonState extends State<CalendarButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (_checkChecker == true) {
                  _checkIcon = const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  );
                  buttonColor = const Color(0xFFECFFE9);

                  _checkChecker = false;
                } else {
                  _checkIcon = const Icon(Icons.circle_outlined);
                  _checkChecker = true;
                  buttonColor = const Color(0xFFECFFE9);
                }
              });
            },
            icon: _checkIcon),
        Container(
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: buttonColor,
                height: 62,
                minWidth: 0,
                elevation: 0,
                hoverElevation: 0,
                onPressed: () {
                  setState(() {
                    if (_checkChecker == true) {
                      taskTimeColor = const Color(0xFFFFFFFF);
                      buttonColor = const Color(0xFFD49DFF);
                      _checkIcon = const Icon(
                        Icons.radio_button_checked_rounded,
                        color: Colors.purple,
                      );

                      _checkChecker = false;
                    } else {
                      taskTimeColor = const Color(0xFF9B9B9B);

                      _checkIcon = const Icon(Icons.circle_outlined);
                      _checkChecker = true;
                      buttonColor = const Color(0xFFECFFE9);
                    }
                  });
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 80,
                        alignment: Alignment.topCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "$taskName",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Text("$taskDescription",
                                    style: TextStyle(
                                      color: taskTimeColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontSize: 15,
                                    ))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    "${taskTime.format(context)}",
                                    style: TextStyle(
                                      color: taskTimeColor,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Poppins",
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]))),
        _CalendarTrashBin()
      ],
    );
  }
}
