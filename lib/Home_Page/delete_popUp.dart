import 'package:flutter/material.dart';
import 'home_page.dart';
import 'task_button.dart';

class PopUP extends StatefulWidget {
  int index;
  PopUP({super.key, this.index = 0});

  @override
  State<PopUP> createState() => _PopUPState();
}

class _PopUPState extends State<PopUP> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0x1FFF1F1F),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width -
                MediaQuery.of(context).size.width * (.1),
            height: 162,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Are you sure you want to delete?",
                    style: TextStyle(
                      color: Color(0xFF7600D3),
                      fontFamily: "Poppins",
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MaterialButton(
                        minWidth: 137,
                        height: 45,
                        shape: StadiumBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF1CC600))),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Color(0xFF1CC600),
                              fontFamily: "Poppins",
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 137,
                        height: 45,
                        shape: StadiumBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFFD30000))),
                        onPressed: () {
                          setState(() {
                            listOfButtons.removeAt(widget.index);
                            Navigator.pop(context);
                          });
                        },
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: Color(0xFFD30000),
                              fontFamily: "Poppins",
                              fontSize: 21,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ));
  }
}
