import 'package:flutter/material.dart';

class ChoiceOption {
  final String label;
  final String value;
  final String icon;

  const ChoiceOption({
    required this.label,
    required this.value,
    required this.icon,
  });
}

class SingleChoiceCard extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<ChoiceOption> options;
  final String? selectedValue;
  final ValueChanged<String> onSelect;

  const SingleChoiceCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.options,
    this.selectedValue,
    required this.onSelect,
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
          if (subtitle != null) ...[
            const SizedBox(height: 8),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
          const SizedBox(height: 32),
          Expanded(
            child: ListView.separated(
              itemCount: options.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final option = options[index];
                final isSelected = selectedValue == option.value;

                return _OptionCard(
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

class _OptionCard extends StatelessWidget {
  final ChoiceOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const _OptionCard({
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
          padding: const EdgeInsets.all(20),
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
          child: Row(
            children: [
              Text(
                option.icon,
                style: const TextStyle(fontSize: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  option.label,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                    color: isSelected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black87,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
