import 'package:flutter/material.dart';
import 'calender_page/calendar.dart';
import 'calender_page/calendar_button.dart';

class ListGenerator extends StatefulWidget {
  int? lenght;
  Widget? items;
  ListGenerator({super.key, this.lenght, this.items});

  @override
  State<ListGenerator> createState() => _ListGeneratorState();
}

class _ListGeneratorState extends State<ListGenerator> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.lenght,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return widget.items;
      },
    );
  }
}
