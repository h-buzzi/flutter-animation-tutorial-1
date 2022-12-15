import 'dart:math' as math;

import 'package:animation_tutorial_1/animated_widget.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOut);
    animation =
        Tween<double>(begin: 0, end: 2 * math.pi).animate(curvedAnimation)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              animController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              animController.forward();
            }
          });
    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RotatingImage(animation: animation));
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
}
