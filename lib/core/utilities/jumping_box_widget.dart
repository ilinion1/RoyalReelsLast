import 'package:flutter/cupertino.dart';
import 'dart:math' as math;

class JumpingBox extends StatefulWidget {
  const JumpingBox({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  State<JumpingBox> createState() => _JumpingBoxState();
}

class _JumpingBoxState extends State<JumpingBox>
    with TickerProviderStateMixin {
  late AnimationController _jumpController;
  late Animation<double> _jumpAnimation;
  late Animation<double> _shakeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _jumpController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _jumpController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _jumpController.forward();
        }
      });

    _jumpAnimation = Tween<double>(begin: 0, end: -50).animate(
      CurvedAnimation(
          parent: _jumpController,
          curve: Interval(0.0, 0.5, curve: Curves.easeOut)),
    );

    _shakeAnimation = Tween<double>(begin: 0.0, end: 2 * math.pi).animate(
      CurvedAnimation(
          parent: _jumpController,
          curve: Interval(0.5, 0.6, curve: Curves.easeInOut)),
    );

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 1.1), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 1.1, end: 1.0), weight: 50),
    ]).animate(
        CurvedAnimation(parent: _jumpController, curve: Curves.easeInOut));

    _jumpController.forward();
  }

  @override
  void dispose() {
    _jumpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, _jumpAnimation.value),
      child: Transform.rotate(
        angle: _jumpController.value < 0.5
            ? 0
            : math.sin(_shakeAnimation.value) * 0.05,
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: widget.child,
        ),
      ),
    );
  }
}
