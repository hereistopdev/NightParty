import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;

  const GradientBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(10, 9, 17, 1), // First color
            Color.fromRGBO(41, 9, 47, 1),
            // Add more colors for a multi-stop gradient
          ],
        ),
      ),
      child: child, // The child passed to GradientBackground
    );
  }
}
