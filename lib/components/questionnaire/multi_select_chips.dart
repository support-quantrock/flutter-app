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
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Question badge with counter
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_box_outlined, color: Colors.green.shade400, size: 16),
                            const SizedBox(width: 6),
                            Text(
                              'Select multiple',
                              style: TextStyle(
                                color: Colors.green.shade400,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      if (selectedValues.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 14),
                              const SizedBox(width: 4),
                              Text(
                                '${selectedValues.length} selected',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: options.asMap().entries.map((entry) {
                      final index = entry.key;
                      final option = entry.value;
                      final isSelected = selectedValues.contains(option.value);
                      return _GameChip(
                        option: option,
                        isSelected: isSelected,
                        onTap: () => onToggle(option.value),
                        index: index,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Animated continue button
          _ContinueButton(
            enabled: selectedValues.isNotEmpty,
            onPressed: onContinue,
          ),
        ],
      ),
    );
  }
}

class _GameChip extends StatefulWidget {
  final ChoiceOption option;
  final bool isSelected;
  final VoidCallback onTap;
  final int index;

  const _GameChip({
    required this.option,
    required this.isSelected,
    required this.onTap,
    required this.index,
  });

  @override
  State<_GameChip> createState() => _GameChipState();
}

class _GameChipState extends State<_GameChip>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getChipColor() {
    final colors = [
      Colors.cyan,
      Colors.purple,
      Colors.orange,
      Colors.green,
      Colors.pink,
      Colors.blue,
    ];
    return colors[widget.index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    final chipColor = _getChipColor();

    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                gradient: widget.isSelected
                    ? LinearGradient(
                        colors: [
                          chipColor,
                          chipColor.withValues(alpha: 0.7),
                        ],
                      )
                    : null,
                color: widget.isSelected
                    ? null
                    : Colors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: widget.isSelected
                      ? chipColor
                      : Colors.white.withValues(alpha: 0.2),
                  width: widget.isSelected ? 2 : 1,
                ),
                boxShadow: widget.isSelected
                    ? [
                        BoxShadow(
                          color: chipColor.withValues(alpha: 0.4),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: widget.isSelected
                          ? Colors.white.withValues(alpha: 0.25)
                          : Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        widget.option.icon,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.option.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight:
                          widget.isSelected ? FontWeight.w600 : FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  if (widget.isSelected) ...[
                    const SizedBox(width: 8),
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        color: chipColor,
                        size: 14,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ContinueButton extends StatefulWidget {
  final bool enabled;
  final VoidCallback onPressed;

  const _ContinueButton({
    required this.enabled,
    required this.onPressed,
  });

  @override
  State<_ContinueButton> createState() => _ContinueButtonState();
}

class _ContinueButtonState extends State<_ContinueButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return GestureDetector(
          onTap: widget.enabled ? widget.onPressed : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              gradient: widget.enabled
                  ? LinearGradient(
                      colors: [Colors.cyan, Colors.blue.shade600],
                    )
                  : null,
              color: widget.enabled
                  ? null
                  : Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              boxShadow: widget.enabled
                  ? [
                      BoxShadow(
                        color: Colors.cyan.withValues(alpha: _glowAnimation.value),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: widget.enabled
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.4),
                  ),
                ),
                if (widget.enabled) ...[
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
