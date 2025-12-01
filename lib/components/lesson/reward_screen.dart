import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';

class RewardScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const RewardScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen>
    with TickerProviderStateMixin {
  late AnimationController _confettiController;
  late AnimationController _coinController;
  late AnimationController _badgeController;
  late AnimationController _glowController;
  late Animation<double> _coinScale;
  late Animation<double> _badgeScale;
  late Animation<double> _glowAnimation;

  @override
  void initState() {
    super.initState();

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();

    _coinController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _badgeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _coinScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _coinController, curve: Curves.elasticOut),
    );

    _badgeScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _badgeController, curve: Curves.elasticOut),
    );

    _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Stagger animations
    Future.delayed(const Duration(milliseconds: 300), () {
      _coinController.forward();
    });
    Future.delayed(const Duration(milliseconds: 800), () {
      _badgeController.forward();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _coinController.dispose();
    _badgeController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rewardData = widget.screen.rewardData;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1A1A2E),
            Color(0xFF0F172A),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Confetti
          _buildConfetti(),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Celebration title
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber
                                  .withValues(alpha: 0.5 * _glowAnimation.value),
                              blurRadius: 30 * _glowAnimation.value,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('🎉', style: TextStyle(fontSize: 28)),
                            SizedBox(width: 12),
                            Text(
                              'Lesson Complete!',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 12),
                            Text('🎉', style: TextStyle(fontSize: 28)),
                          ],
                        ),
                      );
                    },
                  ),

                  const Spacer(),

                  // Coin reward
                  if (rewardData != null)
                    AnimatedBuilder(
                      animation: _coinScale,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _coinScale.value,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.amber.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Colors.amber.withValues(alpha: 0.3),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                // Coin icon
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFFFBBF24),
                                        Color(0xFFF59E0B),
                                        Color(0xFFD97706),
                                      ],
                                    ),
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.amber.withValues(alpha: 0.5),
                                        blurRadius: 20,
                                        offset: const Offset(0, 5),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Q',
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  '+${rewardData.coins} qcoin',
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  const SizedBox(height: 32),

                  // Badge reward
                  if (rewardData?.badgeName != null)
                    AnimatedBuilder(
                      animation: _badgeScale,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _badgeScale.value,
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  const Color(0xFF7C3AED).withValues(alpha: 0.3),
                                  const Color(0xFF6366F1).withValues(alpha: 0.3),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: const Color(0xFF7C3AED).withValues(alpha: 0.5),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  '🏅',
                                  style: TextStyle(fontSize: 64),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Badge Unlocked!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  rewardData!.badgeName!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),

                  const Spacer(),

                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: widget.onContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: Colors.green.withValues(alpha: 0.5),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward, size: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfetti() {
    return AnimatedBuilder(
      animation: _confettiController,
      builder: (context, child) {
        return Stack(
          children: List.generate(80, (index) {
            final random = Random(index);
            final startX = random.nextDouble() * MediaQuery.of(context).size.width;
            final endX = startX + (random.nextDouble() - 0.5) * 150;
            final delay = random.nextDouble();
            final adjustedProgress =
                ((_confettiController.value + delay) % 1.0);
            final x = startX + (endX - startX) * adjustedProgress;
            final y = -30 +
                adjustedProgress * (MediaQuery.of(context).size.height + 60);
            final rotation =
                adjustedProgress * pi * 6 * (random.nextBool() ? 1 : -1);
            final size = 6.0 + random.nextDouble() * 8;
            final colors = [
              Colors.red,
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.purple,
              Colors.orange,
              Colors.pink,
              Colors.cyan,
              Colors.amber,
            ];

            return Positioned(
              left: x,
              top: y,
              child: Opacity(
                opacity: 1 - adjustedProgress * 0.3,
                child: Transform.rotate(
                  angle: rotation,
                  child: Container(
                    width: size,
                    height: size * 0.6,
                    decoration: BoxDecoration(
                      color: colors[random.nextInt(colors.length)],
                      borderRadius: BorderRadius.circular(1),
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
