import 'package:flutter/material.dart';
import 'package:to_do/1_UI/Button_Creator/button_maker.dart';
import 'package:to_do/3_Data/models/task.dart';

import '1_UI/Home_Page/home_page.dart';
import '1_UI/Timer_Page/timer.dart';
import '1_UI/calender_page/calendar.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: _Director(),
  ));
}

class _Director extends StatefulWidget {
  const _Director({super.key});

  @override
  State<_Director> createState() => __DirectorState();
}

List<Task> listOfTasks = [
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
];

class __DirectorState extends State<_Director> {
  bool isPressed = true;
  bool ispressed = false;

  Widget pageScroller = Home_page(
    listOfTasks: listOfTasks,
  );
  Color _homeIconColor = Color(0xFFD49DFF);
  Color _calendarIconColor = Color(0xFFFFFFFF);
  Color _timerIconColor = Color(0xFFFFFFFF);
  double scrollIconBarHeight = 80;
  @override
  Widget build(BuildContext context) {
    final double safeAreaHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: (MediaQuery.of(context).size.height -
                      safeAreaHeight -
                      scrollIconBarHeight),
                  child: pageScroller,
                ),
                Container(
                  margin: EdgeInsets.zero,
                  height: scrollIconBarHeight,
                  color: const Color(0xFF353535),
                  alignment: Alignment.topCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            pageScroller = Home_page(
                              listOfTasks: listOfTasks,
                            );
                            _homeIconColor = Color(0xFFD49DFF);
                            _calendarIconColor = Color(0xFFFFFFFF);
                            _timerIconColor = Color(0xFFFFFFFF);
                          });
                        },
                        icon: Icon(
                          Icons.home_outlined,
                          color: _homeIconColor,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pageScroller = Calendar(listOfTasks: listOfTasks);
                              _homeIconColor = Color(0xFFFFFFFF);
                              _calendarIconColor = Color(0xFFD49DFF);
                              _timerIconColor = Color(0xFFFFFFFF);
                            });
                          },
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: _calendarIconColor,
                          )),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              pageScroller = CircularTimer();
                              _homeIconColor = Color(0xFFFFFFFF);
                              _calendarIconColor = Color(0xFFFFFFFF);
                              _timerIconColor = Color(0xFFD49DFF);
                            });
                          },
                          icon: Icon(
                            Icons.timer_outlined,
                            color: _timerIconColor,
                          )),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isPressed = false;
                          });
                          Future.delayed(Duration(milliseconds: 0))
                              .then((value) => setState(() {
                                    ispressed = true;
                                  }));
                          showDialog(
                              barrierDismissible: false,
                              useSafeArea: true,
                              context: context,
                              builder: (BuildContext context) {
                                return ButtonMaker(
                                  stateChecker: true,
                                  onPressed: (ask) {
                                    listOfTasks.add(ask);
                                  },
                                  ispressed: false,
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.add_circle_rounded,
                          color: Color(0xFFFFFFFF),
                        ),
                        iconSize: 70,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
