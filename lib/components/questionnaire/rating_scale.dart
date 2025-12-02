import 'package:flutter/material.dart';

class RatingScale extends StatefulWidget {
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
  State<RatingScale> createState() => _RatingScaleState();
}

class _RatingScaleState extends State<RatingScale>
    with SingleTickerProviderStateMixin {
  late AnimationController _glowController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _glowController.dispose();
    super.dispose();
  }

  Color _getRatingColor(int value) {
    final progress = (value - widget.min) / (widget.max - widget.min);
    if (progress <= 0.25) return Colors.green;
    if (progress <= 0.5) return Colors.cyan;
    if (progress <= 0.75) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.tune, color: Colors.amber, size: 16),
                const SizedBox(width: 6),
                const Text(
                  'Rate your level',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 48),

          // Rating circles with connecting line
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.1),
              ),
            ),
            child: Column(
              children: [
                // Rating selector
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(widget.max - widget.min + 1, (index) {
                    final value = widget.min + index;
                    final isSelected = widget.selectedValue == value;
                    final ratingColor = _getRatingColor(value);

                    return _RatingCircle(
                      value: value,
                      isSelected: isSelected,
                      color: ratingColor,
                      onTap: () => widget.onSelect(value),
                    );
                  }),
                ),
                const SizedBox(height: 20),

                // Labels
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green, size: 16),
                          const SizedBox(width: 6),
                          Flexible(
                            child: Text(
                              widget.leftLabel,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              widget.rightLabel,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.7),
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(Icons.info_outline, color: Colors.orange, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Selected value indicator
          if (widget.selectedValue != null) ...[
            const SizedBox(height: 24),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: _getRatingColor(widget.selectedValue!).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: _getRatingColor(widget.selectedValue!),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: _getRatingColor(widget.selectedValue!),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'You selected: ${widget.selectedValue}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: _getRatingColor(widget.selectedValue!),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],

          const Spacer(),

          // Continue button
          AnimatedBuilder(
            animation: _glowAnimation,
            builder: (context, child) {
              return GestureDetector(
                onTap: widget.selectedValue != null ? widget.onContinue : null,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    gradient: widget.selectedValue != null
                        ? const LinearGradient(
                            colors: [
                              Color(0xFF22C55E),
                              Color(0xFF3B82F6),
                              Color(0xFFA855F7),
                            ],
                          )
                        : null,
                    color: widget.selectedValue != null
                        ? null
                        : Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: widget.selectedValue != null
                        ? [
                            BoxShadow(
                              color: const Color(0xFF3B82F6).withValues(alpha: _glowAnimation.value),
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
                          color: widget.selectedValue != null
                              ? Colors.white
                              : Colors.white.withValues(alpha: 0.4),
                        ),
                      ),
                      if (widget.selectedValue != null) ...[
                        const SizedBox(width: 8),
                        const Icon(
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
          ),
        ],
      ),
    );
  }
}

class _RatingCircle extends StatefulWidget {
  final int value;
  final bool isSelected;
  final Color color;
  final VoidCallback onTap;

  const _RatingCircle({
    required this.value,
    required this.isSelected,
    required this.color,
    required this.onTap,
  });

  @override
  State<_RatingCircle> createState() => _RatingCircleState();
}

class _RatingCircleState extends State<_RatingCircle>
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
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
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
              width: widget.isSelected ? 60 : 50,
              height: widget.isSelected ? 60 : 50,
              decoration: BoxDecoration(
                gradient: widget.isSelected
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          widget.color,
                          widget.color.withValues(alpha: 0.7),
                        ],
                      )
                    : null,
                color: widget.isSelected
                    ? null
                    : Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.isSelected
                      ? widget.color
                      : Colors.white.withValues(alpha: 0.3),
                  width: widget.isSelected ? 3 : 2,
                ),
                boxShadow: widget.isSelected
                    ? [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.5),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ]
                    : null,
              ),
              child: Center(
                child: Text(
                  '${widget.value}',
                  style: TextStyle(
                    fontSize: widget.isSelected ? 22 : 18,
                    fontWeight: FontWeight.bold,
                    color: widget.isSelected
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
