import 'package:flutter/material.dart';

class ButtonMaker extends StatefulWidget {
  const ButtonMaker({super.key});

  @override
  State<ButtonMaker> createState() => _ButtonMakerState();
}

class _ButtonMakerState extends State<ButtonMaker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        children: [],
      ),
    );
  }
}
