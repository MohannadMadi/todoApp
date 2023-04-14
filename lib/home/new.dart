import "package:flutter/material.dart";

class HomeTaskButton extends StatefulWidget {
  Color? color;
  final Function? onPressed;
  final bool isSelected;

  HomeTaskButton({this.color, this.onPressed, this.isSelected = false});

  @override
  _HomeTaskButtonState createState() => _HomeTaskButtonState();
}

class _HomeTaskButtonState extends State<HomeTaskButton> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
          if (_isSelected == true) {
            widget.color = Colors.amber;
          } else {
            widget.color = Colors.black;
          }
        });
        widget.onPressed!(_isSelected);
      },
      color: widget.color,
      child: Text(
        "ss",
        style: TextStyle(
          color: _isSelected ? Colors.white : Colors.blue,
        ),
      ),
    );
  }
}
