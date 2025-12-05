import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../services/sound_service.dart';
import 'image_placeholder.dart';

class QuestionScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;
  final void Function(bool isCorrect)? onAnswerResult;

  const QuestionScreen({
    super.key,
    required this.screen,
    required this.onContinue,
    this.onAnswerResult,
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
  late AnimationController _shakeController;
  late AnimationController _confettiController;
  late AnimationController _questionRevealController;
  late AnimationController _optionsRevealController;

  late Animation<double> _scaleAnimation;
  late Animation<double> _glowAnimation;
  late Animation<double> _shakeAnimation;
  late Animation<double> _questionSlide;

  // Battle theme state
  int _hearts = 3;

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

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _shakeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticOut),
    );

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _questionRevealController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _questionSlide = Tween<double>(begin: -50, end: 0).animate(
      CurvedAnimation(parent: _questionRevealController, curve: Curves.easeOutBack),
    );

    _optionsRevealController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Start animations
    Future.delayed(const Duration(milliseconds: 200), () {
      _questionRevealController.forward();
    });
    Future.delayed(const Duration(milliseconds: 500), () {
      _optionsRevealController.forward();
    });
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    _shakeController.dispose();
    _confettiController.dispose();
    _questionRevealController.dispose();
    _optionsRevealController.dispose();
    super.dispose();
  }

  void _onOptionTap(int index) {
    if (_showFeedback) return;

    final questionData = widget.screen.questionData;
    if (questionData == null) return;

    final isCorrect = index == questionData.correctIndex;

    if (isCorrect) {
      SoundService().playGood();
      widget.onAnswerResult?.call(true);
      _confettiController.forward();
    } else {
      SoundService().playBeep();
      _shakeController.forward(from: 0);
      setState(() {
        _hearts = (_hearts - 1).clamp(0, 3);
      });
    }

    setState(() {
      _selectedIndex = index;
      _isCorrect = isCorrect;
      _showFeedback = true;
    });

    _feedbackController.forward(from: 0);

    if (_isCorrect) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        if (mounted) widget.onContinue();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            _showFeedback = false;
            _selectedIndex = null;
          });
        }
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF1E293B),
            const Color(0xFF0F172A),
            const Color(0xFF1A0F2E).withValues(alpha: 0.9),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Battle arena background elements
          _buildArenaBackground(),

          // Animated particles
          ...List.generate(15, (index) => _buildParticle(index)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
              child: Column(
                children: [
                  // Battle header
                  _buildBattleHeader(),

                  const SizedBox(height: 16),

                  // Question area
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Image
                          if (widget.screen.imagePrompt != null)
                            AnimatedBuilder(
                              animation: _questionRevealController,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: _questionRevealController.value,
                                  child: Transform.translate(
                                    offset: Offset(0, _questionSlide.value),
                                    child: ImagePlaceholder(
                                      prompt: widget.screen.imagePrompt!,
                                      imagePath: widget.screen.imagePath,
                                      height: 140,
                                    ),
                                  ),
                                );
                              },
                            ),

                          const SizedBox(height: 20),

                          // Question card
                          _buildQuestionCard(questionData),

                          const SizedBox(height: 24),

                          // Options
                          ...List.generate(questionData.options.length, (index) {
                            return _buildBattleOption(index, questionData);
                          }),
                        ],
                      ),
                    ),
                  ),

                  // Feedback overlay
                  if (_showFeedback) _buildFeedbackBadge(),
                ],
              ),
            ),
          ),

          // Confetti overlay
          if (_isCorrect && _showFeedback) _buildConfetti(),
        ],
      ),
    );
  }

  Widget _buildArenaBackground() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            // Top glow
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.purple.withValues(alpha: 0.15 * _glowAnimation.value),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Bottom glow
            Positioned(
              bottom: -50,
              right: -50,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.cyan.withValues(alpha: 0.1 * _glowAnimation.value),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildBattleHeader() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple.withValues(alpha: 0.3),
                Colors.cyan.withValues(alpha: 0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.purple.withValues(alpha: 0.5 * _glowAnimation.value),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.withValues(alpha: 0.2 * _glowAnimation.value),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            children: [
              // Battle icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Text('⚔️', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(width: 12),
              // Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.screen.title ?? 'Quiz Battle',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'You vs Knowledge',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              // Hearts
              Row(
                children: List.generate(3, (index) {
                  return AnimatedScale(
                    scale: index < _hearts ? 1.0 : 0.8,
                    duration: const Duration(milliseconds: 200),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        index < _hearts ? Icons.favorite : Icons.favorite_border,
                        color: index < _hearts ? Colors.red : Colors.red.withValues(alpha: 0.3),
                        size: 24,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuestionCard(QuestionData questionData) {
    return AnimatedBuilder(
      animation: Listenable.merge([_questionRevealController, _shakeAnimation, _glowAnimation]),
      builder: (context, child) {
        final shakeOffset = _showFeedback && !_isCorrect
            ? sin(_shakeAnimation.value * pi * 4) * 8
            : 0.0;

        return Transform.translate(
          offset: Offset(shakeOffset, _questionSlide.value),
          child: Opacity(
            opacity: _questionRevealController.value.clamp(0.0, 1.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withValues(alpha: 0.1),
                    Colors.white.withValues(alpha: 0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.cyan.withValues(alpha: 0.4 * _glowAnimation.value),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.cyan.withValues(alpha: 0.2 * _glowAnimation.value),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text('❓', style: TextStyle(fontSize: 32)),
                  const SizedBox(height: 12),
                  Text(
                    questionData.question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBattleOption(int index, QuestionData questionData) {
    final isSelected = _selectedIndex == index;
    final isCorrectOption = index == questionData.correctIndex;
    final optionLetters = ['A', 'B', 'C', 'D'];
    final optionColors = [Colors.blue, Colors.green, Colors.orange, Colors.purple];
    final color = optionColors[index % optionColors.length];

    // Determine colors based on state
    Color bgColor = color.withValues(alpha: 0.15);
    Color borderColor = color.withValues(alpha: 0.4);
    IconData? trailingIcon;
    Color? iconColor;

    if (_showFeedback) {
      if (isSelected) {
        if (_isCorrect) {
          bgColor = Colors.green.withValues(alpha: 0.3);
          borderColor = Colors.green;
          trailingIcon = Icons.check_circle;
          iconColor = Colors.green;
        } else {
          bgColor = Colors.red.withValues(alpha: 0.3);
          borderColor = Colors.red;
          trailingIcon = Icons.cancel;
          iconColor = Colors.red;
        }
      } else if (!_isCorrect && isCorrectOption) {
        bgColor = Colors.green.withValues(alpha: 0.2);
        borderColor = Colors.green.withValues(alpha: 0.6);
        trailingIcon = Icons.lightbulb;
        iconColor = Colors.green;
      }
    }

    return AnimatedBuilder(
      animation: _optionsRevealController,
      builder: (context, child) {
        final delay = index * 0.15;
        final progress = ((_optionsRevealController.value - delay) / (1 - delay)).clamp(0.0, 1.0);
        final slideOffset = 50 * (1 - Curves.easeOutBack.transform(progress));

        return Opacity(
          opacity: progress,
          child: Transform.translate(
            offset: Offset(slideOffset, 0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: () => _onOptionTap(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        bgColor,
                        bgColor.withValues(alpha: bgColor.a * 0.5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: borderColor, width: 2),
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: borderColor.withValues(alpha: 0.4),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    children: [
                      // Option letter badge
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.3),
                          shape: BoxShape.circle,
                          border: Border.all(color: color, width: 2),
                        ),
                        child: Center(
                          child: Text(
                            optionLetters[index],
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Option text
                      Expanded(
                        child: Text(
                          questionData.options[index],
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      // Feedback icon
                      if (trailingIcon != null)
                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: _scaleAnimation.value,
                              child: Icon(trailingIcon, color: iconColor, size: 28),
                            );
                          },
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

  Widget _buildFeedbackBadge() {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isCorrect
                    ? [Colors.green.withValues(alpha: 0.9), Colors.green.withValues(alpha: 0.7)]
                    : [Colors.red.withValues(alpha: 0.9), Colors.red.withValues(alpha: 0.7)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: (_isCorrect ? Colors.green : Colors.red).withValues(alpha: 0.5),
                  blurRadius: 20,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _isCorrect ? Icons.emoji_events : Icons.refresh,
                  color: Colors.white,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _isCorrect ? 'CORRECT!' : 'TRY AGAIN!',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    if (_isCorrect)
                      const Text(
                        '+10 QP',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildConfetti() {
    return AnimatedBuilder(
      animation: _confettiController,
      builder: (context, child) {
        return Stack(
          children: List.generate(60, (index) {
            final random = Random(index);
            final startX = random.nextDouble() * MediaQuery.of(context).size.width;
            final endX = startX + (random.nextDouble() - 0.5) * 250;
            final progress = _confettiController.value;
            final x = startX + (endX - startX) * progress;
            final y = -50 + progress * (MediaQuery.of(context).size.height + 150);
            final rotation = progress * pi * 6 * (random.nextBool() ? 1 : -1);
            final colors = [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.purple,
              Colors.orange,
              Colors.pink,
              Colors.cyan,
            ];
            final isSquare = random.nextBool();

            return Positioned(
              left: x,
              top: y,
              child: Opacity(
                opacity: (1 - progress * 0.6).clamp(0.0, 1.0),
                child: Transform.rotate(
                  angle: rotation,
                  child: Container(
                    width: isSquare ? 10 : 8,
                    height: isSquare ? 10 : 14,
                    decoration: BoxDecoration(
                      color: colors[random.nextInt(colors.length)],
                      borderRadius: BorderRadius.circular(isSquare ? 2 : 4),
                    ),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final startTop = random.nextDouble() * MediaQuery.of(context).size.height;
    final colors = [Colors.cyan, Colors.purple, Colors.amber, Colors.white];

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = (_particleController.value + index * 0.06) % 1.0;
        final top = startTop - (progress * 280);

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
                color: colors[random.nextInt(colors.length)],
                boxShadow: [
                  BoxShadow(
                    color: colors[random.nextInt(colors.length)].withValues(alpha: 0.5),
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
