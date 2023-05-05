import 'package:flutter/material.dart';
import 'calender_page/calendar.dart';
import 'calender_page/calendar_button.dart';
import '../../3_Data/models/task.dart';

class ListGenerator extends StatefulWidget {
  int? lenght;
  List<Task> listOfTasks;
  ListGenerator({
    super.key,
    required this.listOfTasks,
    this.lenght,
  });

  @override
  State<ListGenerator> createState() => _ListGeneratorState();
}

class _ListGeneratorState extends State<ListGenerator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lenght = widget.listOfTasks.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return CalendarButton(
          taskName: widget.listOfTasks[index].taskName,
          taskDescription: widget.listOfTasks[index].id,
          taskTime: widget.listOfTasks[index].dueDate,
          onDelete: () {
            setState(() {
              widget.listOfTasks.removeAt(index);
            });
          },
          index: index,
          task: widget.listOfTasks[index],
        );
      },
    );
  }
}
