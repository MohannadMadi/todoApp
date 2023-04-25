import 'dart:js/js_wasm.dart';

import 'package:flutter/material.dart';
import 'package:to_do/director.dart';

class ButtonMaker extends StatefulWidget {
  bool ispressed;
  bool stateChecker;

  ButtonMaker({super.key, this.stateChecker = true, this.ispressed = false});
  @override
  State<ButtonMaker> createState() => _ButtonMakerState();
}

class _ButtonMakerState extends State<ButtonMaker> {
  late FocusNode myFocusNode;
  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    if (widget.stateChecker == true) {
      Future.delayed(Duration(microseconds: 0)).then((value) => setState(() {
            widget.ispressed = true;
          }));
    }
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              myFocusNode.unfocus();
              setState(() {
                widget.stateChecker = false;
              });
              Future.delayed(const Duration(milliseconds: 0))
                  .then((value) => setState(() {
                        widget.ispressed = false;
                      }));
              Future.delayed(Duration(milliseconds: 500))
                  .then((value) => Navigator.of(context).pop());
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Center(
            child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                alignment: widget.ispressed ? Alignment(0, 1) : Alignment(0, 3),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: Column(children: [
                    const Text("Add Task",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFF1CC600),
                          fontFamily: "Poppins",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        )),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        autofocus: true,
                        focusNode: myFocusNode,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: 'Task Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        keyboardAppearance: Brightness.dark,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 6,
                        decoration: InputDecoration(
                          hintText: 'Description',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF8F00FF)),
                            borderRadius: BorderRadius.circular(11),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
          )
        ],
      ),
    );
  }
}
