import 'package:flutter/material.dart';
import 'calender_page/calendar.dart';
import 'calender_page/calendar_button.dart';
import '../../3_Data/models/task.dart';

class ListGenerator extends StatefulWidget {
  int? lenght;
  ListGenerator({
    super.key,
    this.lenght,
  });

  @override
  State<ListGenerator> createState() => _ListGeneratorState();
}

List<Task> listOfTasks = [
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
  Task(id: "hola", taskName: "yeah", dueDate: DateTime.now(), isDone: false),
];

class _ListGeneratorState extends State<ListGenerator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lenght = listOfTasks.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CalendarButton(
          onDelete: () {
            setState(() {
              listOfTasks.removeAt(index);
            });
          },
          index: index,
          task: listOfTasks[index],
        );
      },
    );
  }
}
