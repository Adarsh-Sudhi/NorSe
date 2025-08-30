import 'package:flutter/material.dart';

class backgroundgradient extends StatelessWidget {
  const backgroundgradient({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
                           Color.fromARGB(255, 29, 27, 82),
                           Color.fromARGB(255, 25, 18, 57),
                           Color.fromARGB(255, 23, 17, 43),
                           Color.fromARGB(255, 0, 0, 0)
        ])
      ),
    );
  }
}