// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:to_do/3_Data/models/task.dart';

import '/1_UI/Home_Page/home_page.dart';

class ButtonMaker extends StatefulWidget {
  bool ispressed;
  bool stateChecker;
  Function(Task) onPressed;

  ButtonMaker({
    Key? key,
    required this.ispressed,
    required this.stateChecker,
    required this.onPressed,
  }) : super(key: key);
  @override
  State<ButtonMaker> createState() => _ButtonMakerState();
}

class _ButtonMakerState extends State<ButtonMaker> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    myFocusNode.dispose();

    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  List<String> daysOfWeek = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
    "Monday"
  ];
  final _taskTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  late String taskName;
  late String taskDescription;
  late DateTime dueDate;
  Widget build(BuildContext context) {
    if (widget.stateChecker == true) {
      Future.delayed(Duration(microseconds: 0)).then((value) => setState(() {
            widget.ispressed = true;
          }));
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              myFocusNode.unfocus();
              setState(() {
                widget.stateChecker = false;
              });
              Future.delayed(const Duration(milliseconds: 0))
                  .then((value) => setState(() {
                        widget.ispressed = false;
                      }));
              Future.delayed(Duration(milliseconds: 500))
                  .then((value) => Navigator.of(context).pop());
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: widget.ispressed ? Alignment(0, 1) : Alignment(0, 3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: const Text("Add Task",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF1CC600),
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        controller: _taskTextController,
                        autofocus: true,
                        focusNode: myFocusNode,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Task Name',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        controller: descriptionTextController,
                        keyboardAppearance: Brightness.dark,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 1,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.fromLTRB(10, 90, 0, 0),
                          hintMaxLines: 99,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.date_range_outlined),
                            Container(
                              margin: EdgeInsets.only(left: 7),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  MaterialButton(
                                    minWidth: 150,
                                    elevation: 15,
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1,
                                          color: Colors.greenAccent,
                                        ),
                                        borderRadius: BorderRadius.circular(5)),
                                    color: Colors.white,
                                    onPressed: () {
                                      showDialog(
                                          useSafeArea: true,
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Center(
                                              child: Container(
                                                color: Colors.white,
                                                height: 200,
                                                child: CupertinoDatePicker(
                                                  mode: CupertinoDatePickerMode
                                                      .dateAndTime,
                                                  initialDateTime:
                                                      DateTime.now(),
                                                  onDateTimeChanged:
                                                      (DateTime newDateTime) {
                                                    setState(() {
                                                      selectedDate =
                                                          newDateTime;
                                                    });
                                                    print(selectedDate.hour);
                                                  },
                                                  use24hFormat: false,
                                                  minuteInterval: 1,
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    child: Text(
                                        "${daysOfWeek[selectedDate.weekday - 1]} ${selectedDate.hour == 0 ? 12 : selectedDate.hour >= 12 ? selectedDate.hour - 12 == 0 ? 12 : selectedDate.hour - 12 : selectedDate.hour}:${selectedDate.minute} ${selectedDate.hour >= 12 ? "PM" : "AM"}"),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                dueDate = selectedDate;
                                taskName = _taskTextController.text;
                                taskDescription =
                                    descriptionTextController.text;
                                widget.onPressed(Task(
                                    id: taskDescription,
                                    taskName: taskName,
                                    dueDate: dueDate,
                                    isDone: false));
                              });
                              /////////////////////////
                              myFocusNode.unfocus();
                              setState(() {
                                widget.stateChecker = false;
                              });
                              Future.delayed(const Duration(milliseconds: 0))
                                  .then((value) => setState(() {
                                        widget.ispressed = false;
                                      }));
                              Future.delayed(Duration(milliseconds: 500))
                                  .then((value) => Navigator.of(context).pop());
                            },
                            icon: Icon(Icons.check_circle_outline_outlined,
                                color: Colors.blue[800])),
                      ],
                    )
                  ]),
                )),
          ),
        ],
      ),
    );
  }
}
