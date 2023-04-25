import 'dart:math';
import '../../3_Data/models/Task.dart';
import './delete_popUp.dart';
import 'package:flutter/material.dart';

class HomeTaskButton extends StatefulWidget {
  HomeTaskButton(
      {required this.onDelete,
      this.buttonColor = const Color(0xFFECFFE9),
      this.taskName,
      this.taskTime = const TimeOfDay(hour: 10, minute: 00),
      this.taskTimeColor = const Color(0xFF9B9B9B),
      this.arrowChecker = false,
      this.checkChecker = true,
      this.checkIcon = const Icon(Icons.circle_outlined),
      this.isAnimating = false,
      required this.index,
      required this.task});
  final int index;
  final Function() onDelete;
  final Task task;
  bool isAnimating;
  bool? arrowChecker;
  Icon? checkIcon;
  bool? checkChecker;

  String? taskName;
  var taskTime;
  Color buttonColor;
  Color taskTimeColor;

  @override
  State<HomeTaskButton> createState() => _HomeTaskButtonState();
}

class _HomeTaskButtonState extends State<HomeTaskButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                  widget.taskTimeColor = const Color(0xFF9B9B9B);

                  widget.buttonColor = const Color(0xFFECFFE9);
                }
              });
            },
            icon: widget.checkIcon!),
        Container(
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: widget.buttonColor,
                height: 62,
                minWidth: 270,
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
                child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: widget.isAnimating ? 200 : 62,
                      alignment: Alignment.topCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.taskName}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "${widget.taskTime.format(context)}",
                                style: TextStyle(
                                  color: widget.taskTimeColor,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                  fontSize: 20,
                                ),
                              ),
                              IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  setState(() {
                                    if (widget.isAnimating == true) {
                                      widget.isAnimating = false;
                                      widget.arrowChecker = false;
                                      print(widget.index);
                                    } else {
                                      widget.arrowChecker = true;
                                      widget.isAnimating = true;
                                      print(widget.index);
                                    }
                                  });
                                },
                                icon: AnimatedRotation(
                                  duration: Duration(milliseconds: 200),
                                  turns: widget.isAnimating ? .5 : 1,
                                  child: Icon(
                                    Icons.keyboard_arrow_down_sharp,
                                    color: Color(0xFFFF0000),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width - 137,
                    ),
                    child: widget.arrowChecker == false
                        ? Container()
                        : AnimatedOpacity(
                            duration: Duration(milliseconds: 20000),
                            opacity: widget.isAnimating ? 1 : 0,
                            child: IconButton(
                                hoverColor: Colors.transparent,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) => PopUP(
                                            onDelete: widget.onDelete,
                                            index: widget.index,

                                          ));
                                },
                                icon: const Icon(
                                  Icons.delete_outline_rounded,
                                  color: Color(0xFFFF0000),
                                )),
                          ),
                  ),
                ]))),
      ],
    );
  }
}
