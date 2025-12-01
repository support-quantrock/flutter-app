import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import 'image_placeholder.dart';

class MissionScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const MissionScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen>
    with TickerProviderStateMixin {
  int? _selectedIndex;
  bool _submitted = false;
  bool _isCorrect = false;
  late AnimationController _feedbackController;
  late AnimationController _glowController;
  late AnimationController _particleController;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_selectedIndex == null || _submitted) return;

    final missionData = widget.screen.missionData;
    if (missionData == null) return;

    setState(() {
      _submitted = true;
      _isCorrect = _selectedIndex == missionData.correctIndex;
    });

    _feedbackController.forward();

    if (_isCorrect) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        widget.onContinue();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1200), () {
        setState(() {
          _submitted = false;
          _selectedIndex = null;
        });
        _feedbackController.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final missionData = widget.screen.missionData;
    if (missionData == null) {
      return const Center(child: Text('No mission data'));
    }

    final labels = ['A', 'B', 'C', 'D', 'E', 'F'];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2D1B69),
            Color(0xFF1A1A2E),
            Color(0xFF0F0F1A),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated particles
          ...List.generate(15, (index) => _buildParticle(index)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(
                children: [
                  // Mission header with glow
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7C3AED)
                                  .withValues(alpha: 0.5 * _glowAnimation.value),
                              blurRadius: 20 * _glowAnimation.value,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('⭐', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 12),
                            Text(
                              'Mission',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  // Image placeholder
                  if (widget.screen.imagePrompt != null)
                    ImagePlaceholder(
                      prompt: widget.screen.imagePrompt!,
                      imagePath: widget.screen.imagePath,
                      height: 140,
                      gradientColors: const [
                        Color(0xFF2D1B69),
                        Color(0xFF4C1D95),
                        Color(0xFF2D1B69),
                      ],
                    ),

                  const SizedBox(height: 24),

                  // Mission text with glow
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: const Color(0xFF7C3AED)
                                .withValues(alpha: 0.4 * _glowAnimation.value),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF7C3AED)
                                  .withValues(alpha: 0.2 * _glowAnimation.value),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Text(
                          missionData.mission,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Options with staggered animation
                  Expanded(
                    child: ListView.builder(
                      itemCount: missionData.options.length,
                      itemBuilder: (context, index) {
                        return _buildAnimatedOption(
                          index,
                          missionData,
                          labels[index],
                        );
                      },
                    ),
                  ),

                  // Submit button with glow
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: _selectedIndex != null && !_submitted
                              ? [
                                  BoxShadow(
                                    color: const Color(0xFF7C3AED)
                                        .withValues(alpha: 0.4 * _glowAnimation.value),
                                    blurRadius: 15 * _glowAnimation.value,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _selectedIndex != null && !_submitted
                                ? _onSubmit
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF7C3AED),
                              disabledBackgroundColor:
                                  Colors.grey.withValues(alpha: 0.3),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              _submitted
                                  ? (_isCorrect ? '✅ Correct!' : '❌ Try again')
                                  : 'Submit Answer',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedOption(int index, MissionData missionData, String label) {
    final isSelected = _selectedIndex == index;
    final isCorrectOption = index == missionData.correctIndex;

    Color backgroundColor = Colors.white.withValues(alpha: 0.08);
    Color borderColor = Colors.white.withValues(alpha: 0.15);
    Color labelBg = const Color(0xFF7C3AED).withValues(alpha: 0.3);

    if (isSelected && !_submitted) {
      backgroundColor = const Color(0xFF7C3AED).withValues(alpha: 0.3);
      borderColor = const Color(0xFF7C3AED);
      labelBg = const Color(0xFF7C3AED);
    }

    if (_submitted && isSelected) {
      if (_isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: 0.3);
        borderColor = Colors.green;
        labelBg = Colors.green;
      } else {
        backgroundColor = Colors.red.withValues(alpha: 0.3);
        borderColor = Colors.red;
        labelBg = Colors.red;
      }
    }

    if (_submitted && !_isCorrect && isCorrectOption) {
      borderColor = Colors.green.withValues(alpha: 0.5);
    }

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + index * 100),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: _submitted
                    ? null
                    : () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: borderColor,
                      width: 2,
                    ),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: borderColor.withValues(alpha: 0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      // Label circle
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: labelBg,
                          shape: BoxShape.circle,
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: labelBg.withValues(alpha: 0.5),
                                    blurRadius: 8,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : null,
                        ),
                        child: Center(
                          child: Text(
                            label,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Option text
                      Expanded(
                        child: Text(
                          missionData.options[index],
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            height: 1.3,
                          ),
                        ),
                      ),
                      // Checkmark for selected
                      if (isSelected)
                        Icon(
                          _submitted
                              ? (_isCorrect ? Icons.check_circle : Icons.cancel)
                              : Icons.radio_button_checked,
                          color: _submitted
                              ? (_isCorrect ? Colors.green : Colors.red)
                              : const Color(0xFF7C3AED),
                          size: 24,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final startTop = random.nextDouble() * MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = (_particleController.value + index * 0.07) % 1.0;
        final top = startTop - (progress * 220);

        return Positioned(
          left: left,
          top: top,
          child: Opacity(
            opacity: (1 - progress) * 0.5,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF7C3AED),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF7C3AED).withValues(alpha: 0.5),
                    blurRadius: size * 2,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
