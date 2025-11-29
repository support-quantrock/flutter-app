import 'package:flutter/material.dart';

class RatingScale extends StatelessWidget {
  final String title;
  final String leftLabel;
  final String rightLabel;
  final int? selectedValue;
  final ValueChanged<int> onSelect;
  final VoidCallback onContinue;
  final int min;
  final int max;

  const RatingScale({
    super.key,
    required this.title,
    required this.leftLabel,
    required this.rightLabel,
    this.selectedValue,
    required this.onSelect,
    required this.onContinue,
    this.min = 1,
    this.max = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(max - min + 1, (index) {
              final value = min + index;
              final isSelected = selectedValue == value;

              return GestureDetector(
                onTap: () => onSelect(value),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[100],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[300]!,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '$value',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.white : Colors.grey[700],
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  leftLabel,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  rightLabel,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedValue != null ? onContinue : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
