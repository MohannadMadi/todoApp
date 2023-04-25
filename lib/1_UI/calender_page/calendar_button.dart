import 'package:flutter/material.dart';
import '../Home_Page/delete_popUp.dart';
import '../home_page/task_button.dart';
import 'calendar.dart';
import '../../3_Data/models/Task.dart';

class CalendarButton extends StatefulWidget {
  Icon checkIcon;
  int selectedDay;
  bool checkChecker;
  var taskTime;
  Color buttonColor;
  Color taskTimeColor;
  String? taskDescription;
  String? taskName;
  int? buttonDate;
  final int index;
  final Task task;
  final Function() onDelete;
  CalendarButton(
      {super.key,
      required this.task,
      this.buttonDate,
      this.buttonColor = const Color(0xFFECFFE9),
      this.checkChecker = true,
      this.checkIcon = const Icon(Icons.circle_outlined),
      this.taskTime = const TimeOfDay(hour: 10, minute: 00),
      this.taskDescription,
      this.taskName,
      this.taskTimeColor = const Color(0xFF9B9B9B),
      required this.onDelete,
      required this.index,
      this.selectedDay = 0});

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
                if (widget.checkChecker == true) {
                  widget.checkIcon = const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  );
                  widget.buttonColor = const Color(0xFFECFFE9);

                  widget.checkChecker = false;
                } else {
                  widget.checkIcon = const Icon(Icons.circle_outlined);
                  widget.checkChecker = true;
                  widget.buttonColor = const Color(0xFFECFFE9);
                }
              });
            },
            icon: widget.checkIcon),
        Container(
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: widget.buttonColor,
                height: 62,
                minWidth: 0,
                elevation: 0,
                hoverElevation: 0,
                onPressed: () {
                  setState(() {
                    if (widget.checkChecker == true) {
                      widget.taskTimeColor = const Color(0xFFFFFFFF);
                      widget.buttonColor = const Color(0xFFD49DFF);
                      widget.checkIcon = const Icon(
                        Icons.radio_button_checked_rounded,
                        color: Colors.purple,
                      );

                      widget.checkChecker = false;
                    } else {
                      widget.taskTimeColor = const Color(0xFF9B9B9B);

                      widget.checkIcon = const Icon(Icons.circle_outlined);
                      widget.checkChecker = true;
                      widget.buttonColor = const Color(0xFFECFFE9);
                    }
                  });
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width -
                            MediaQuery.of(context).size.width * .33,
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
                                  "${widget.taskDescription}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Text("${widget.taskDescription}",
                                    style: TextStyle(
                                      color: widget.taskTimeColor,
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
                                    "${widget.taskTime.format(context)}",
                                    style: TextStyle(
                                      color: widget.taskTimeColor,
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
        IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => PopUP(
                        onDelete: widget.onDelete,
                        index: widget.index,
                      ));
              print(widget.index);
            },
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFFFF0000),
            ))
      ],
    );
  }
}
