import "package:flutter/material.dart";

class HomeTaskButton extends StatefulWidget {
  final String? text;
  final Function? onPressed;
  final bool isSelected;

  HomeTaskButton({this.text = "32", this.onPressed, this.isSelected = false});

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
        });
        widget.onPressed!(_isSelected);
      },
      color: _isSelected ? Colors.blue : Colors.white,
      child: Text(
        widget.text!,
        style: TextStyle(
          color: _isSelected ? Colors.white : Colors.blue,
        ),
      ),
    );
  }
}
