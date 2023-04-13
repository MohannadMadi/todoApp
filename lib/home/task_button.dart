import 'package:flutter/material.dart';

 bool _arrowChecker = true;
String taskName = "aksksadass";
Icon _checkIcon = const Icon(Icons.circle_outlined);
bool _checkChecker = true;
var taskTime = const TimeOfDay(hour: 10, minute: 00);
Color buttonColor = const Color(0xFFECFFE9);
Color taskTimeColor = const Color(0xFF9B9B9B);



late AnimationController _controller;
late AnimationController _heightController;
bool rotated = true;
Tween<double> animatedIcon = Tween(begin: 1, end: 0);
Tween<double> animatedOpacity = Tween(begin: 0, end: 1);
Animation<double> heightAnimation =
    Tween<double>(begin: 62, end: 200).animate(_heightController);

class _TrashBin extends StatefulWidget {
  const _TrashBin({super.key});

  @override
  State<_TrashBin> createState() => __TrashBinState();
}

class __TrashBinState extends State<_TrashBin> {
  @override
  Widget build(BuildContext context) {
    if (_arrowChecker == true) {
      return Container();
    } else {
      return AnimatedBuilder(
        animation: _heightController,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: animatedOpacity.animate(_controller).value,
            child: IconButton(
                hoverColor: Colors.transparent,
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.black,
                        );
                      });
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Color(0xFFFF0000),
                )),
          );
        },
      );
    }
  }
}

class HomeTaskButton extends StatefulWidget {
  const HomeTaskButton({super.key});

  @override
  State<HomeTaskButton> createState() => _HomeTaskButtonState();
}

class _HomeTaskButtonState extends State<HomeTaskButton>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: .5,
      duration: const Duration(milliseconds: 200),
    );
    _heightController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _controller.stop();
    _heightController.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (_checkChecker == true) {
                  _checkIcon = const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  );
                  buttonColor = const Color(0xFFECFFE9);

                  _checkChecker = false;
                } else {
                  _checkIcon = const Icon(Icons.circle_outlined);
                  _checkChecker = true;
                  buttonColor = const Color(0xFFECFFE9);
                }
              });
            },
            icon: _checkIcon),
        Container(
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: buttonColor,
                height: 62,
                minWidth: 270,
                elevation: 0,
                hoverElevation: 0,
                onPressed: () {
                  setState(() {
                    if (_checkChecker == true) {
                      taskTimeColor = const Color(0xFFFFFFFF);
                      buttonColor = const Color(0xFFD49DFF);
                      _checkIcon = const Icon(
                        Icons.radio_button_checked_rounded,
                        color: Colors.purple,
                      );

                      _checkChecker = false;
                    } else {
                      taskTimeColor = const Color(0xFF9B9B9B);

                      _checkIcon = const Icon(Icons.circle_outlined);
                      _checkChecker = true;
                      buttonColor = const Color(0xFFECFFE9);
                    }
                  });
                },
                child: Column(children: [
                  AnimatedBuilder(
                    animation: _heightController,
                    builder: (BuildContext context, Widget? child) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: heightAnimation.value,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$taskName",
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "${taskTime.format(context)}",
                                  style: TextStyle(
                                    color: taskTimeColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                  ),
                                ),
                                IconButton(
                                    hoverColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        if (_arrowChecker == true) {
                                          _controller.forward();
                                          _heightController.forward();

                                          _arrowChecker = false;
                                        } else {
                                          _heightController.reverse();

                                          _controller.reverse();
                                          _arrowChecker = true;
                                        }
                                      });
                                    },
                                    icon: RotationTransition(
                                      turns: animatedIcon.animate(_controller),
                                      child: const Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        color: Color(0xFFFF0000),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width - 137,
                    ),
                    child: _TrashBin(),
                  ),
                ]))),
      ],
    );
  }
}
