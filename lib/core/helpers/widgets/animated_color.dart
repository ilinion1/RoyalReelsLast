import 'package:flutter/material.dart';

class MyAnimatedColor extends StatefulWidget {
  const MyAnimatedColor({super.key, 
    required this.builder,
    required this.colorTween,
    required this.duration,
  });
  final colorAnimFunc builder;
  final ColorTween colorTween;
  final Duration duration;
  @override
  _MyAnimatedColorState createState() => _MyAnimatedColorState();
}

class _MyAnimatedColorState extends State<MyAnimatedColor>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: widget.duration);
    _colorTween = widget.colorTween.animate(_animationController);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorTween,
      builder: (context, child) {
        return widget.builder(context, _animationController, _colorTween);
      },
    );
  }
}

typedef colorAnimFunc = Widget Function(
    BuildContext context, AnimationController controller, Animation anim);
