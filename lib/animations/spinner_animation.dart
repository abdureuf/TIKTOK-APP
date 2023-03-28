import 'package:flutter/material.dart';
import 'dart:math' as math;


class SpinnerAnimation extends StatefulWidget {
  final Widget body;

  SpinnerAnimation({required this.body});

  @override
  _SpinnerAnimationState createState() =>_SpinnerAnimationState(body: this.body);
}

class _SpinnerAnimationState extends State<SpinnerAnimation>
    with SingleTickerProviderStateMixin {
  final Widget body;
  late AnimationController _controller;
  _SpinnerAnimationState({required this.body});


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.reset();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      child: body,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller.value * 2.0 * math.pi,
          child: child,
        ) ;
      },
    );
  }
}
