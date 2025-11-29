import 'package:flutter/material.dart';
import 'single_choice_card.dart';

class SingleChoiceGrid extends StatelessWidget {
  final String title;
  final List<ChoiceOption> options;
  final String? selectedValue;
  final ValueChanged<String> onSelect;
  final int columns;

  const SingleChoiceGrid({
    super.key,
    required this.title,
    required this.options,
    this.selectedValue,
    required this.onSelect,
    this.columns = 2,
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
          const SizedBox(height: 32),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.0,
              ),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = selectedValue == option.value;

                return _GridOptionCard(
                  option: option,
                  isSelected: isSelected,
                  onTap: () => onSelect(option.value),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _GridOptionCard extends StatelessWidget {
  final ChoiceOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _GridOptionCard({
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
        borderRadius: BorderRadius.circular(16),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.1)
                : Colors.grey[50],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey[200]!,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                option.icon,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 12),
              Text(
                option.label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected
                      ? Theme.of(context).colorScheme.primary
                      : Colors.black87,
                ),
              ),
              if (isSelected) ...[
                const SizedBox(height: 8),
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
