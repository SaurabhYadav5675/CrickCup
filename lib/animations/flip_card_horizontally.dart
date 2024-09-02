import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardHorizontally extends StatefulWidget {
  final bool selectedValue;
  final Widget firstChild;
  final Widget secondChild;

  const FlipCardHorizontally(
      {required this.firstChild,
      required this.secondChild,
      required this.selectedValue,
      super.key});

  @override
  State<FlipCardHorizontally> createState() => _FlipCardHorizontallyState();
}

class _FlipCardHorizontallyState extends State<FlipCardHorizontally>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 8000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    if (widget.selectedValue) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(2, 1, 0.0015)
        ..rotateY(pi * _animation.value),
      alignment: FractionalOffset.center,
      child: Card(
        child: _animation.value <= 0.5 ? widget.firstChild : widget.secondChild,
      ),
    );
  }
}
