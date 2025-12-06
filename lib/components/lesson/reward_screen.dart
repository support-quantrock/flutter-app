import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../services/sound_service.dart';
import '../../services/qp_service.dart';

class RewardScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;
  final int? day;
  final int? lesson;
  final int? correctAnswers;
  final int? totalQuestions;

  const RewardScreen({
    super.key,
    required this.screen,
    required this.onContinue,
    this.day,
    this.lesson,
    this.correctAnswers,
    this.totalQuestions,
  });

  @override
  State<RewardScreen> createState() => _RewardScreenState();
}

class _RewardScreenState extends State<RewardScreen>
    with TickerProviderStateMixin {
  late AnimationController _fireworksController;
  late AnimationController _qpRainController;
  late AnimationController _qpCountController;
  late AnimationController _badgeController;
  late AnimationController _glowController;
  late AnimationController _levelBarController;
  late AnimationController _shineController;

  late Animation<double> _qpCountAnimation;
  late Animation<double> _badgeScale;
  late Animation<double> _glowAnimation;
  late Animation<double> _levelBarAnimation;

  LessonReward? _lessonReward;
  bool _showLevelUp = false;

  @override
  void initState() {
    super.initState();

    // Fireworks animation
    _fireworksController = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    )..repeat();

    // QP rain effect
    _qpRainController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();

    // QP count animation
    _qpCountController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Badge animation
    _badgeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Glow animation
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    // Level bar animation
    _levelBarController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Shine effect for badge
    _shineController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _qpCountAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _qpCountController, curve: Curves.easeOutCubic),
    );

    _badgeScale = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _badgeController, curve: Curves.elasticOut),
    );

    _glowAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    _levelBarAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _levelBarController, curve: Curves.easeOutCubic),
    );

    _initReward();
  }

  Future<void> _initReward() async {
    // Award QP
    final rewardData = widget.screen.rewardData;
    if (rewardData != null && widget.day != null && widget.lesson != null) {
      _lessonReward = await QPService().awardLessonQP(
        day: widget.day!,
        lesson: widget.lesson!,
        baseQP: rewardData.coins,
        correctAnswers: widget.correctAnswers ?? 0,
        totalQuestions: widget.totalQuestions ?? 0,
      );

      if (_lessonReward!.didLevelUp) {
        _showLevelUp = true;
      }
    }

    // Stagger animations
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) _qpCountController.forward();
    });

    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _levelBarController.forward();
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) _badgeController.forward();
    });

    // Play celebration sound
    Future.delayed(const Duration(milliseconds: 500), () {
      SoundService().playBellThreeTimes();
    });

    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _fireworksController.dispose();
    _qpRainController.dispose();
    _qpCountController.dispose();
    _badgeController.dispose();
    _glowController.dispose();
    _levelBarController.dispose();
    _shineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rewardData = widget.screen.rewardData;
    final qpService = QPService();

    return GestureDetector(
      onTap: widget.onContinue,
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F172A),
            ],
          ),
        ),
        child: Stack(
        children: [
          // Fireworks background
          _buildFireworks(),

          // QP rain effect
          _buildQPRain(),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Column(
                children: [
                  // Celebration title with glow
                  _buildCelebrationTitle(),

                  const SizedBox(height: 24),

                  // QP Reward Card
                  if (rewardData != null) _buildQPRewardCard(rewardData),

                  const SizedBox(height: 20),

                  // Level Progress
                  _buildLevelProgress(qpService),

                  const SizedBox(height: 20),

                  // Badge reward
                  if (rewardData?.badgeName != null)
                    _buildBadgeCard(rewardData!),

                  const Spacer(),

                  // Stats summary
                  _buildStatsSummary(qpService),

                  const SizedBox(height: 20),

                  // Continue button
                  _buildContinueButton(),
                ],
              ),
            ),
          ),

          // Level up overlay
          if (_showLevelUp) _buildLevelUpOverlay(),
        ],
      ),
      ),
    );
  }

  Widget _buildCelebrationTitle() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.6 * _glowAnimation.value),
                blurRadius: 25 * _glowAnimation.value,
                spreadRadius: 3,
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('🎉', style: TextStyle(fontSize: 24)),
              SizedBox(width: 10),
              Text(
                'Lesson Complete!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Text('🎉', style: TextStyle(fontSize: 24)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQPRewardCard(RewardData rewardData) {
    return AnimatedBuilder(
      animation: _qpCountAnimation,
      builder: (context, child) {
        final displayQP = _lessonReward != null
            ? (_lessonReward!.totalQP * _qpCountAnimation.value).round()
            : (rewardData.coins * _qpCountAnimation.value).round();

        return Transform.scale(
          scale: 0.8 + (_qpCountAnimation.value * 0.2),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFFBBF24).withValues(alpha: 0.2),
                  const Color(0xFFD97706).withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.amber.withValues(alpha: 0.4),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withValues(alpha: 0.2),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // QP Icon
                Container(
                  width: 60,
                  height: 60,
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
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'QP',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '+$displayQP',
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    if (_lessonReward != null && _lessonReward!.bonusQP > 0)
                      Text(
                        '(+${_lessonReward!.bonusQP} bonus)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.green.shade400,
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

  Widget _buildLevelProgress(QPService qpService) {
    return AnimatedBuilder(
      animation: _levelBarAnimation,
      builder: (context, child) {
        final progress = qpService.progressToNextLevel * _levelBarAnimation.value;

        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        qpService.levelEmoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Level ${qpService.currentLevel}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    qpService.levelTitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.purple.shade300,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Progress bar
              Stack(
                children: [
                  Container(
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progress.clamp(0.0, 1.0),
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
                        ),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF7C3AED).withValues(alpha: 0.5),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${qpService.totalQP} QP',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                  Text(
                    '${qpService.qpRemainingToNextLevel} QP to next level',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBadgeCard(RewardData rewardData) {
    return AnimatedBuilder(
      animation: _badgeScale,
      builder: (context, child) {
        return Transform.scale(
          scale: _badgeScale.value,
          child: AnimatedBuilder(
            animation: _shineController,
            builder: (context, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF7C3AED).withValues(alpha: 0.3),
                      const Color(0xFF6366F1).withValues(alpha: 0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF7C3AED).withValues(alpha: 0.5),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Badge icon with shine
                    Stack(
                      children: [
                        Text(
                          rewardData.badgeIcon ?? '🏅',
                          style: const TextStyle(fontSize: 48),
                        ),
                        // Shine effect
                        Positioned.fill(
                          child: ClipOval(
                            child: ShaderMask(
                              shaderCallback: (bounds) {
                                return LinearGradient(
                                  begin: Alignment(-1 + _shineController.value * 3, 0),
                                  end: Alignment(-0.5 + _shineController.value * 3, 0),
                                  colors: [
                                    Colors.transparent,
                                    Colors.white.withValues(alpha: 0.3),
                                    Colors.transparent,
                                  ],
                                ).createShader(bounds);
                              },
                              child: Container(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Badge Unlocked!',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          rewardData.badgeName!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildStatsSummary(QPService qpService) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem('🔥', '${qpService.currentStreak}', 'Streak'),
          Container(width: 1, height: 30, color: Colors.white24),
          _buildStatItem('📚', '${qpService.lessonsCompleted}', 'Lessons'),
          Container(width: 1, height: 30, color: Colors.white24),
          _buildStatItem('⭐', '${qpService.totalQP}', 'Total QP'),
        ],
      ),
    );
  }

  Widget _buildStatItem(String emoji, String value, String label) {
    return Column(
      children: [
        Row(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Colors.white54,
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: widget.onContinue,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF10B981),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 8,
          shadowColor: const Color(0xFF10B981).withValues(alpha: 0.5),
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
            Icon(Icons.arrow_forward_rounded, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _buildFireworks() {
    return AnimatedBuilder(
      animation: _fireworksController,
      builder: (context, child) {
        return Stack(
          children: List.generate(25, (index) {
            final random = Random(index);
            final centerX = random.nextDouble() * MediaQuery.of(context).size.width;
            final centerY = random.nextDouble() * MediaQuery.of(context).size.height * 0.6;
            final delay = random.nextDouble();
            final adjustedProgress = ((_fireworksController.value + delay) % 1.0);

            // Firework burst pattern
            if (adjustedProgress < 0.3) return const SizedBox.shrink();

            final burstProgress = ((adjustedProgress - 0.3) / 0.7).clamp(0.0, 1.0);
            final opacity = (1 - burstProgress).clamp(0.0, 1.0);

            final colors = [
              Colors.red,
              Colors.yellow,
              Colors.green,
              Colors.blue,
              Colors.purple,
              Colors.orange,
              Colors.pink,
              Colors.cyan,
            ];
            final color = colors[random.nextInt(colors.length)];

            return Stack(
              children: List.generate(8, (sparkIndex) {
                final angle = (sparkIndex / 8) * 2 * pi;
                final distance = burstProgress * 60;
                final sparkX = centerX + cos(angle) * distance;
                final sparkY = centerY + sin(angle) * distance;

                return Positioned(
                  left: sparkX,
                  top: sparkY,
                  child: Opacity(
                    opacity: opacity * 0.8,
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: color.withValues(alpha: 0.8),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
        );
      },
    );
  }

  Widget _buildQPRain() {
    return AnimatedBuilder(
      animation: _qpRainController,
      builder: (context, child) {
        return Stack(
          children: List.generate(15, (index) {
            final random = Random(index + 100);
            final startX = random.nextDouble() * MediaQuery.of(context).size.width;
            final delay = random.nextDouble();
            final adjustedProgress = ((_qpRainController.value + delay) % 1.0);
            final y = -20 + adjustedProgress * (MediaQuery.of(context).size.height + 40);
            final wobble = sin(adjustedProgress * 4 * pi) * 10;

            return Positioned(
              left: startX + wobble,
              top: y,
              child: Opacity(
                opacity: (1 - adjustedProgress * 0.5).clamp(0.3, 0.8),
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFBBF24), Color(0xFFD97706)],
                    ),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.5),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Q',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
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

  Widget _buildLevelUpOverlay() {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 800),
      builder: (context, value, child) {
        return Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.7 * value),
            child: Center(
              child: Transform.scale(
                scale: value,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF7C3AED).withValues(alpha: 0.5),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('🎊', style: TextStyle(fontSize: 48)),
                      const SizedBox(height: 16),
                      const Text(
                        'LEVEL UP!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Level ${_lessonReward?.newLevel ?? 1}',
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        _lessonReward?.newLevelTitle ?? 'Novice',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.amber,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => setState(() => _showLevelUp = false),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF7C3AED),
                        ),
                        child: const Text('Awesome!'),
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
}
