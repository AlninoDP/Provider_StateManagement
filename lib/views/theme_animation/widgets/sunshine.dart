import 'package:flutter/material.dart';

class Sunshine extends StatelessWidget {
  final Widget child;
  final double radius;
  const Sunshine({super.key, required this.child, required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(child: child),
    );
  }
}
