import 'package:flutter/material.dart';
import 'package:learnflutter/views/theme_animation/widgets/sunshine.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return Sunshine(
      radius: 200,
      child: Sunshine(
        radius: 160,
        child: Sunshine(
          radius: 120,
          child: Center(
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.orange.shade400,
                        spreadRadius: 1,
                        blurRadius: 15)
                  ],
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0Xddfffa66),
                        Color(0xddffa057),
                      ])),
            ),
          ),
        ),
      ),
    );
  }
}
