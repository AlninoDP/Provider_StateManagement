import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  const Star({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
                color: Colors.white,
                spreadRadius: 9,
                blurRadius: 15,
                offset: Offset(0, 0))
          ]),
    );
  }
}
