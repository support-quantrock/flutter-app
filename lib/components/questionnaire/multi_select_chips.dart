import 'package:flutter/material.dart';
import 'single_choice_card.dart';

class MultiSelectChips extends StatelessWidget {
  final String title;
  final List<ChoiceOption> options;
  final List<String> selectedValues;
  final ValueChanged<String> onToggle;
  final VoidCallback onContinue;

  const MultiSelectChips({
    super.key,
    required this.title,
    required this.options,
    required this.selectedValues,
    required this.onToggle,
    required this.onContinue,
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
          const SizedBox(height: 8),
          Text(
            'Select all that apply',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: options.map((option) {
                final isSelected = selectedValues.contains(option.value);
                return _ChipOption(
                  option: option,
                  isSelected: isSelected,
                  onTap: () => onToggle(option.value),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedValues.isNotEmpty ? onContinue : null,
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

class _ChipOption extends StatelessWidget {
  final ChoiceOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _ChipOption({
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Colors.grey[50],
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[300]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                option.icon,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 8),
              Text(
                option.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black87,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 18,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
