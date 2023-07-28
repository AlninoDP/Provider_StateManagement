import 'package:flutter/material.dart';

class Moon extends StatelessWidget {
  const Moon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(color: Colors.white, spreadRadius: 1, blurRadius: 15)
          ]),
    );
  }
}
