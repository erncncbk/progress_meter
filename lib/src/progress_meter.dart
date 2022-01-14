import 'package:flutter/material.dart';
import 'dart:math';

import 'package:progress_meter/src/progress_arc.dart';

class ProgressMeter extends StatefulWidget {
  const ProgressMeter(
      {Key? key,
      this.begin = 0.0,
      this.end = 2,
      this.duration = 2,
      this.color = Colors.blue,
      this.levelText = ""})
      : super(key: key);

  final double? begin;
  final double? end;
  final Color? color;
  final String? levelText;
  final int? duration;

  @override
  _ProgressMeterState createState() => _ProgressMeterState();
}

class _ProgressMeterState extends State<ProgressMeter>
    with SingleTickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    _animation();
  }

  _animation() {
    animationController = AnimationController(
        vsync: this, duration: Duration(seconds: widget.duration!));
    final curvedAnimation = CurvedAnimation(
        parent: animationController!, curve: Curves.easeInOutCubic);
    animation = Tween<double>(begin: widget.begin, end: widget.end)
        .animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
    animationController!.isAnimating
        ? animationController!.stop()
        : animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(200, 150),
            painter: ProgressArc(
                arc: pi,
                progressColor: widget.color!.withOpacity(0.4),
                isBackground: true),
          ),
          CustomPaint(
            size: Size(200, 150),
            painter: ProgressArc(
                arc: animation!.value,
                progressColor: widget.color!,
                isBackground: false),
          ),
          Positioned(
            child: Text(
              "${(animation!.value / 3.14 * 100).round()}",
            ),
          ),
          Positioned(
            top: 100,
            child: Text(
              widget.levelText!,
            ),
          ),
        ],
      ),
    );
  }
}
