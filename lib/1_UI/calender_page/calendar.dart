import 'package:flutter/material.dart';
import '../home_page/home_page.dart';
import '../home_page/task_button.dart';
import 'calendar_button.dart';
import 'package:intl/intl.dart';
import 'package:to_do/1_UI/generator.dart';
import '../../3_Data/models/Task.dart';

class Calendar extends StatefulWidget {
  int index;
  Calendar({super.key, this.index = 0});

  @override
  State<Calendar> createState() => _CalendarState();
}

List<Widget> buttonGenerators = [
  ListGenerator(),
  ListGenerator(),
  ListGenerator(),
  ListGenerator(),
];

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: Text(
            "Caalendar",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: "Poppins",
                fontSize: 23),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            "Today",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontSize: 30,
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(70), color: Colors.black),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Text(
                "tasks",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Poppins"),
              )),
        ),
        CalendarWidget(),
      ])),
    );
  }
}

class ButtonScroller extends StatefulWidget {
  int selectedDay;
  late List? eachDayButton;

  ButtonScroller({super.key, this.eachDayButton, this.selectedDay = 0});

  @override
  State<ButtonScroller> createState() => _ButtonScrollerState();
}

class _ButtonScrollerState extends State<ButtonScroller> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: buttonGenerators[widget.selectedDay]);
  }
}

class CalendarWidget extends StatefulWidget {
  CalendarWidget({super.key, this.selectedDay = 0});
  int selectedDay;

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  final List<String> _daysOfWeek = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  List<String> _daysOfMonth = [];
  List<String> _daysOfMonthNum = [];

  @override
  void initState() {
    super.initState();
    _getDaysOfMonth();
  }

  void _getDaysOfMonth() {
    var now = DateTime.now();
    var firstDayOfMonth = DateTime(now.year, now.month, 1);
    var lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    for (var i = 1; i <= lastDayOfMonth.day; i++) {
      var date = DateTime(now.year, now.month, i);
      var formatter = DateFormat('E');
      String formattedDate = formatter.format(date);

      _daysOfMonth.add('${formattedDate}');
      _daysOfMonthNum.add("$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(_daysOfMonth.length, (index) {
                return ConstrainedBox(
                  constraints: BoxConstraints(minWidth: 51, minHeight: 60),
                  child: MaterialButton(
                      minWidth: 1,
                      onPressed: () {
                        var date = DateTime.now();
                        var firstDayOfMonth =
                            DateTime(date.year, date.month, 1);
                        var dayOfWeek =
                            (firstDayOfMonth.weekday + index - 1) % 7;
                        var dayOfMonth = index + 4 - firstDayOfMonth.weekday;

                        if (widget.selectedDay == null ||
                            widget.selectedDay != index) {
                          setState(() {
                            widget.selectedDay = index;
                            print(widget.selectedDay);
                          });
                        }
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            " ${_daysOfMonthNum[index]} ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w300),
                          ),
                          Text(
                            "${_daysOfMonth[index]}",
                            style: TextStyle(
                                color: Color(0xFF888888),
                                fontFamily: "Poppins",
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: widget.selectedDay == index
                            ? BorderSide(width: .5)
                            : BorderSide(width: 0, style: BorderStyle.none),
                        borderRadius: BorderRadius.circular(5),
                      )),
                );
              }).toList(),
            ),
          ),
        ),
        ButtonScroller(
          selectedDay: widget.selectedDay,
        )
      ],
    );
  }
}
