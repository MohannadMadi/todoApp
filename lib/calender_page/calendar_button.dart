import 'package:flutter/material.dart';
import '../home_page/task_button.dart';

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
  Icon checkIcon;
  bool checkChecker;
  var taskTime;
  Color buttonColor;
  Color taskTimeColor;
  String? taskDescription;
  String? taskName;

  CalendarButton(
      {super.key,
      this.buttonColor = const Color(0xFFECFFE9),
      this.checkChecker = true,
      this.checkIcon = const Icon(Icons.circle_outlined),
      this.taskTime = const TimeOfDay(hour: 10, minute: 00),
      this.taskDescription,
      this.taskName,
      this.taskTimeColor = const Color(0xFF9B9B9B)});

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
        _CalendarTrashBin()
      ],
    );
  }
}
