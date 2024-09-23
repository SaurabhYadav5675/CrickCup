import 'dart:math';
import 'package:crick_cup/constants/app_colors.dart';
import 'package:crick_cup/widgets/circular_dot.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_svg.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({super.key});

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> with TickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animationIn;
  Animation<double>? _animationOut;
  Animation<double>? _animationRotation;

  final double originalDistance = 40;
  double radiusDistance = 40;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animationRotation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: _controller!,
            curve: const Interval(0.0, 1.0, curve: Curves.linear)));
    _animationIn = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.75, 1.0, curve: Curves.elasticIn)));
    _animationOut = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _controller!,
        curve: const Interval(0.0, 0.25, curve: Curves.elasticOut)));
    _controller?.addListener(() {
      setState(() {
        if (_controller!.value >= 0.75 && _controller!.value <= 1.0) {
          radiusDistance = _animationIn!.value * originalDistance;
        } else if (_controller!.value >= 0.0 && _controller!.value <= 0.25) {
          radiusDistance = _animationOut!.value * originalDistance;
        }
      });
    });
    _controller?.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100,
        width: 100,
        child: RotationTransition(
          turns: _animationRotation!,
          child: Stack(
            children: [
              Center(
                  child: SvgPicture.asset(AppSvg.cricketBallSvg,
                      height: 35, width: 35)),
              for (int i = 1; i < 9; i++) ...[
                Transform.translate(
                    offset: Offset(radiusDistance * cos(i * pi / 4),
                        radiusDistance * sin(i * pi / 4)),
                    child: CircularDot(
                        radius: 10, color: AppColors.oliveGreen.v800)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
