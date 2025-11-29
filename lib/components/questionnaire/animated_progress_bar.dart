import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatelessWidget {
  final int step;
  final int total;

  const AnimatedProgressBar({
    super.key,
    required this.step,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final progress = step / total;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Container(
        height: 6,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(3),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: constraints.maxWidth * progress,
                  height: 6,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Theme.of(context).colorScheme.primary,
                        Theme.of(context).colorScheme.secondary,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
