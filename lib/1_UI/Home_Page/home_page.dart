// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../3_Data/models/task.dart';
import 'task_button.dart';

class Home_page extends StatefulWidget {
  List<Task> listOfTasks;
  Home_page({
    Key? key,
    required this.listOfTasks,
  }) : super(key: key);

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  late int counter = widget.listOfTasks.length;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              child: const Text(
                "Your Tasks",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Poppins"),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(70),
                    color: Colors.black),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                child: Text(
                  "${widget.listOfTasks.length} tasks",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      fontFamily: "Poppins"),
                )),
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
          SingleChildScrollView(
            child: Column(
              children: List.generate(
                widget.listOfTasks.length,
                (index) {
                  return HomeTaskButton(
                      taskName: widget.listOfTasks[index].taskName,
                      taskTime: widget.listOfTasks[index].dueDate,
                      onDelete: () {
                        setState(() {
                          widget.listOfTasks.removeAt(index);
                        });
                      },
                      index: index,
                      task: widget.listOfTasks[index]);
                },
              ).toList(),
            ),
          ),
        ])),
      ),
    );
  }
}
