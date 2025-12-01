import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import 'image_placeholder.dart';

class QuestionScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const QuestionScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with TickerProviderStateMixin {
  int? _selectedIndex;
  bool _isCorrect = false;
  bool _showFeedback = false;
  late AnimationController _feedbackController;
  late AnimationController _glowController;
  late AnimationController _particleController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _feedbackController, curve: Curves.elasticOut),
    );

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _glowAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 3500),
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

  void _onOptionTap(int index) {
    if (_showFeedback) return;

    final questionData = widget.screen.questionData;
    if (questionData == null) return;

    setState(() {
      _selectedIndex = index;
      _isCorrect = index == questionData.correctIndex;
      _showFeedback = true;
    });

    _feedbackController.forward(from: 0);

    if (_isCorrect) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        widget.onContinue();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _showFeedback = false;
          _selectedIndex = null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionData = widget.screen.questionData;
    if (questionData == null) {
      return const Center(child: Text('No question data'));
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E293B),
            Color(0xFF0F172A),
            Color(0xFF0D1520),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated particles
          ...List.generate(12, (index) => _buildParticle(index)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Question header with glow
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.cyan.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.cyan.withValues(alpha: 0.3 * _glowAnimation.value),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan.withValues(alpha: 0.3 * _glowAnimation.value),
                              blurRadius: 15 * _glowAnimation.value,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('❓', style: TextStyle(fontSize: 24)),
                            SizedBox(width: 12),
                            Text(
                              'Question',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyan,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Image placeholder
                  if (widget.screen.imagePrompt != null)
                    ImagePlaceholder(
                      prompt: widget.screen.imagePrompt!,
                      imagePath: widget.screen.imagePath,
                      height: 150,
                    ),

                  const SizedBox(height: 32),

                  // Question text with glow border
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.cyan.withValues(alpha: 0.2 * _glowAnimation.value),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.cyan.withValues(alpha: 0.1 * _glowAnimation.value),
                              blurRadius: 10,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          questionData.question,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  // Options with animations
                  ...List.generate(questionData.options.length, (index) {
                    return _buildAnimatedOption(index, questionData);
                  }),

                  const Spacer(),

                  // Feedback text
                  if (_showFeedback)
                    AnimatedBuilder(
                      animation: _scaleAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _scaleAnimation.value,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            decoration: BoxDecoration(
                              color: _isCorrect
                                  ? Colors.green.withValues(alpha: 0.2)
                                  : Colors.red.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: _isCorrect ? Colors.green : Colors.red,
                                width: 2,
                              ),
                            ),
                            child: Text(
                              _isCorrect ? '✅ Correct!' : '❌ Try again!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: _isCorrect ? Colors.green : Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedOption(int index, QuestionData questionData) {
    final isSelected = _selectedIndex == index;
    final isCorrectOption = index == questionData.correctIndex;

    Color backgroundColor = Colors.white.withValues(alpha: 0.1);
    Color borderColor = Colors.white.withValues(alpha: 0.2);
    Color textColor = Colors.white;

    if (_showFeedback && isSelected) {
      if (_isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: 0.3);
        borderColor = Colors.green;
      } else {
        backgroundColor = Colors.red.withValues(alpha: 0.3);
        borderColor = Colors.red;
      }
    }

    if (_showFeedback && !_isCorrect && isCorrectOption) {
      backgroundColor = Colors.green.withValues(alpha: 0.2);
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
            offset: Offset(30 * (1 - value), 0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => _onOptionTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 18,
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        questionData.options[index],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      if (_showFeedback && isSelected) ...[
                        const SizedBox(width: 12),
                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Icon(
                                _isCorrect ? Icons.check_circle : Icons.cancel,
                                color: _isCorrect ? Colors.green : Colors.red,
                                size: 28,
                              ),
                            );
                          },
                        ),
                      ],
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
        final progress = (_particleController.value + index * 0.08) % 1.0;
        final top = startTop - (progress * 200);

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
                color: Colors.cyan,
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withValues(alpha: 0.5),
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
