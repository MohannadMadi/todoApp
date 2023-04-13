import 'package:flutter/material.dart';
import '../home/home_page.dart';
import '../home/task_button.dart';
import 'calendar_button.dart';
import 'package:intl/intl.dart';

class _Calendar extends StatefulWidget {
  const _Calendar({super.key});

  @override
  State<_Calendar> createState() => __CalendarState();
}

class __CalendarState extends State<_Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List eachDayButton = [
    [CalendarButton(), CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
    [CalendarButton()],
  ];

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
                "$counter tasks",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Poppins"),
              )),
        ),
        CalendarWidget(),
        SingleChildScrollView(
          child: Column(
            children: [
              ...eachDayButton[1],
            ],
          ),
        )
      ])),
    );
  }
}

int selectedDay = 0;

class CalendarWidget extends StatefulWidget {
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
    return SizedBox(
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
                    var firstDayOfMonth = DateTime(date.year, date.month, 1);
                    var dayOfWeek = (firstDayOfMonth.weekday + index - 1) % 7;
                    var dayOfMonth = index + 4 - firstDayOfMonth.weekday;
                    print(dayOfMonth + 3);

                    if (selectedDay == null || selectedDay != index) {
                      setState(() {
                        selectedDay = index;
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
                    side: selectedDay == index
                        ? BorderSide(width: .5)
                        : BorderSide(width: 0, style: BorderStyle.none),
                    borderRadius: BorderRadius.circular(5),
                  )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
