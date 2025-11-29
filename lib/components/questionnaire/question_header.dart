import 'package:flutter/material.dart';

class QuestionHeader extends StatelessWidget {
  final int step;
  final int total;
  final VoidCallback onBack;
  final VoidCallback onSkip;
  final bool showBack;

  const QuestionHeader({
    super.key,
    required this.step,
    required this.total,
    required this.onBack,
    required this.onSkip,
    this.showBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (showBack)
              IconButton(
                onPressed: onBack,
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.grey[700],
              )
            else
              const SizedBox(width: 48),
            Text(
              '$step / $total',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey[600],
              ),
            ),
            TextButton(
              onPressed: onSkip,
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
