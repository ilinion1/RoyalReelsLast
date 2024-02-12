import 'package:flutter/cupertino.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';

class MyAnimatedSwitcher extends StatefulWidget {
  const MyAnimatedSwitcher({super.key, required this.child});
  final Widget child;

  @override
  State<MyAnimatedSwitcher> createState() => _MyAnimatedSwitcherState();
}

class _MyAnimatedSwitcherState extends State<MyAnimatedSwitcher> {
  @override
  void didUpdateWidget(covariant MyAnimatedSwitcher oldWidget) {
    setState(() {});
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: 500.msDuration,
      reverseDuration: Duration.zero,
      transitionBuilder: (Widget child, Animation<double> animation) {
        const begin = Offset(0.1, 0.0);
        const end = Offset(0, 0.0);
        const curve = Curves.easeInOut;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: offsetAnimation,
            child: child,
          ),
        );
      },
      child: widget.child,
    );
  }
}
