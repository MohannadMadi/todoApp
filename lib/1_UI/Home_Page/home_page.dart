import 'package:flutter/material.dart';
// import 'new.dart';
import '../../3_Data/models/Task.dart';
import 'task_button.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  late int counter = listOfTasks.length;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  borderRadius: BorderRadius.circular(70), color: Colors.black),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Text(
                "${listOfTasks.length} tasks",
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
              listOfTasks.length,
              (index) {
                return HomeTaskButton(
                    onDelete: () {
                      setState(() {
                        listOfTasks.removeAt(index);
                      });
                    },
                    index: index,
                    task: listOfTasks[index]);
              },
            ).toList(),
          ),
        ),
      ])),
    );
  }
}
