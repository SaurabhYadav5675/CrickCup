import 'package:flutter/material.dart';

class CircularDot extends StatelessWidget {
  final double radius;
  final Color color;

  const CircularDot({required this.radius, required this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
