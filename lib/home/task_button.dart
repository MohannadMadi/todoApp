import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget {
  bool? arrowChecker;
  Icon? checkIcon = const Icon(Icons.circle_outlined);
  bool? checkChecker = true;

  ParentWidget({
    super.key,
    this.arrowChecker,
  });

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          HomeTaskButton(
            checkChecker: widget.checkChecker,
            checkIcon: widget.checkIcon,
            arrowChecker: widget.arrowChecker,
          ),
          _TrashBin(
            arrowChecker: widget.arrowChecker,
          )
        ],
      );
}

class HomeTaskButton extends StatefulWidget {
  HomeTaskButton({
    this.buttonColor = const Color(0xFFECFFE9),
    this.taskName = "sda",
    this.taskTime = const TimeOfDay(hour: 10, minute: 00),
    this.taskTimeColor = const Color(0xFF9B9B9B),
    this.arrowChecker = true,
    this.checkChecker = true,
    this.checkIcon = const Icon(Icons.circle_outlined),
    this.isAnimating = false,
  });
  bool? isAnimating;
  bool? arrowChecker;
  Icon? checkIcon;
  bool? checkChecker;

  String? taskName;
  var taskTime;
  Color buttonColor;
  Color taskTimeColor;

  @override
  State<HomeTaskButton> createState() => _HomeTaskButtonState();
}

late AnimationController controller;
late AnimationController heightController;
bool rotated = true;
Tween<double> animatedIcon = Tween(begin: 1, end: 0);
Tween<double> animatedOpacity = Tween(begin: 0, end: 1);
Tween<double> heightAnimation = Tween<double>(begin: 62, end: 200);

class _HomeTaskButtonState extends State<HomeTaskButton>
    with TickerProviderStateMixin {
  @override
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: .5,
      duration: const Duration(milliseconds: 200),
    );
    heightController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    controller.stop();
    heightController.stop();
  }

  @override
  void dispose() {
    controller.dispose();
    heightController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            hoverColor: Colors.transparent,
            onPressed: () {
              setState(() {
                if (widget.checkChecker == true) {
                  widget.checkIcon = const Icon(
                    Icons.check_circle_outline_outlined,
                    color: Colors.green,
                  );
                  widget.buttonColor = const Color(0xFFECFFE9);

                  widget.checkChecker = false;
                } else {
                  widget.checkIcon = const Icon(Icons.circle_outlined);
                  widget.checkChecker = true;
                  widget.buttonColor = const Color(0xFFECFFE9);
                }
              });
            },
            icon: widget.checkIcon!),
        Container(
            child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                color: widget.buttonColor,
                height: 62,
                minWidth: 270,
                elevation: 0,
                hoverElevation: 0,
                onPressed: () {
                  setState(() {
                    if (widget.checkChecker == true) {
                      widget.taskTimeColor = const Color(0xFFFFFFFF);
                      widget.buttonColor = const Color(0xFFD49DFF);
                      widget.checkIcon = const Icon(
                        Icons.radio_button_checked_rounded,
                        color: Colors.purple,
                      );

                      widget.checkChecker = false;
                    } else {
                      widget.taskTimeColor = const Color(0xFF9B9B9B);

                      widget.checkIcon = const Icon(Icons.circle_outlined);
                      widget.checkChecker = true;
                      widget.buttonColor = const Color(0xFFECFFE9);
                    }
                  });
                },
                child: Column(children: [
                  AnimatedBuilder(
                    animation: heightController,
                    builder: (BuildContext context, Widget? child) {
                      return Container(
                        width: MediaQuery.of(context).size.width - 100,
                        height: heightAnimation.animate(heightController).value,
                        alignment: Alignment.topCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.taskName}",
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
                                  "${widget.taskTime.format(context)}",
                                  style: TextStyle(
                                    color: widget.taskTimeColor,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                  ),
                                ),
                                IconButton(
                                    hoverColor: Colors.transparent,
                                    onPressed: () {
                                      setState(() {
                                        if (widget.arrowChecker == true) {
                                          controller.forward();
                                          heightController.forward();

                                          widget.arrowChecker = false;
                                        } else {
                                          heightController.reverse();

                                          controller.reverse();
                                          widget.arrowChecker = true;
                                        }
                                      });
                                    },
                                    icon: RotationTransition(
                                      turns: animatedIcon.animate(controller),
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

class _TrashBin extends StatefulWidget {
  bool? arrowChecker;

  _TrashBin({
    this.arrowChecker,
  });

  @override
  State<_TrashBin> createState() => __TrashBinState();
}

class __TrashBinState extends State<_TrashBin> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.arrowChecker == true) {
      return Container();
    } else {
      return AnimatedBuilder(
        animation: heightController,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: animatedOpacity.animate(controller).value,
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
