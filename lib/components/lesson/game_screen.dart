import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';

class GameScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const GameScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late List<AnimationController> _floatControllers;
  late List<AnimationController> _shakeControllers;
  late AnimationController _confettiController;

  int? _poppedIndex;
  bool _showConfetti = false;
  bool _wrongAnswer = false;
  int _wrongIndex = -1;

  @override
  void initState() {
    super.initState();
    final optionCount = widget.screen.gameData?.options.length ?? 3;

    _floatControllers = List.generate(optionCount, (index) {
      return AnimationController(
        duration: Duration(milliseconds: 1500 + index * 200),
        vsync: this,
      )..repeat(reverse: true);
    });

    _shakeControllers = List.generate(optionCount, (index) {
      return AnimationController(
        duration: const Duration(milliseconds: 500),
        vsync: this,
      );
    });

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    for (var c in _floatControllers) {
      c.dispose();
    }
    for (var c in _shakeControllers) {
      c.dispose();
    }
    _confettiController.dispose();
    super.dispose();
  }

  void _onBalloonTap(int index) {
    if (_poppedIndex != null) return;

    final gameData = widget.screen.gameData;
    if (gameData == null) return;

    if (index == gameData.correctIndex) {
      // Correct answer
      setState(() {
        _poppedIndex = index;
        _showConfetti = true;
      });
      _confettiController.forward();

      Future.delayed(const Duration(milliseconds: 1500), () {
        widget.onContinue();
      });
    } else {
      // Wrong answer - shake
      setState(() {
        _wrongAnswer = true;
        _wrongIndex = index;
      });
      _shakeControllers[index].forward(from: 0).then((_) {
        setState(() {
          _wrongAnswer = false;
          _wrongIndex = -1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final gameData = widget.screen.gameData;
    if (gameData == null) {
      return const Center(child: Text('No game data'));
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E3A5F),
            Color(0xFF0F172A),
          ],
        ),
      ),
      child: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(
                children: [
                  // Game title
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.purple.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('🎮', style: TextStyle(fontSize: 24)),
                        const SizedBox(width: 12),
                        Text(
                          widget.screen.title ?? 'Game Time!',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Instruction
                  Text(
                    gameData.instruction,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withValues(alpha: 0.9),
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Balloons
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(gameData.options.length, (index) {
                        return _buildBalloon(index, gameData.options[index]);
                      }),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Hint text
                  Text(
                    'Tap the balloon with the investor mindset!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withValues(alpha: 0.6),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Confetti overlay
          if (_showConfetti) _buildConfetti(),
        ],
      ),
    );
  }

  Widget _buildBalloon(int index, GameOption option) {
    final isPopped = _poppedIndex == index;
    final isWrong = _wrongIndex == index;
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
    final color = colors[index % colors.length];

    return AnimatedBuilder(
      animation: _floatControllers[index],
      builder: (context, child) {
        final floatOffset = sin(_floatControllers[index].value * pi) * 10;

        Widget balloon = Transform.translate(
          offset: Offset(0, floatOffset),
          child: GestureDetector(
            onTap: () => _onBalloonTap(index),
            child: AnimatedScale(
              scale: isPopped ? 0 : 1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Balloon
                  Container(
                    width: 80,
                    height: 95,
                    decoration: BoxDecoration(
                      gradient: RadialGradient(
                        center: const Alignment(-0.3, -0.3),
                        colors: [
                          color.withValues(alpha: 0.9),
                          color,
                          color.withValues(alpha: 0.7),
                        ],
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: color.withValues(alpha: 0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        option.emoji,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  // String
                  Container(
                    width: 2,
                    height: 20,
                    color: Colors.white.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 6),
                  // Label
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      option.label,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );

        // Shake animation for wrong answer
        if (isWrong) {
          return AnimatedBuilder(
            animation: _shakeControllers[index],
            builder: (context, child) {
              final shake = sin(_shakeControllers[index].value * pi * 8) * 10;
              return Transform.translate(
                offset: Offset(shake, 0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Colors.red,
                    BlendMode.srcATop,
                  ),
                  child: balloon,
                ),
              );
            },
          );
        }

        return balloon;
      },
    );
  }

  Widget _buildConfetti() {
    return AnimatedBuilder(
      animation: _confettiController,
      builder: (context, child) {
        return Stack(
          children: List.generate(50, (index) {
            final random = Random(index);
            final startX = random.nextDouble() * MediaQuery.of(context).size.width;
            final endX = startX + (random.nextDouble() - 0.5) * 200;
            final progress = _confettiController.value;
            final x = startX + (endX - startX) * progress;
            final y = -50 + progress * (MediaQuery.of(context).size.height + 100);
            final rotation = progress * pi * 4 * (random.nextBool() ? 1 : -1);
            final colors = [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.purple,
              Colors.orange,
              Colors.pink,
            ];

            return Positioned(
              left: x,
              top: y,
              child: Opacity(
                opacity: 1 - progress * 0.5,
                child: Transform.rotate(
                  angle: rotation,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: colors[random.nextInt(colors.length)],
                      borderRadius: BorderRadius.circular(2),
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
}
