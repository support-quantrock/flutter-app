import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../services/sound_service.dart';
import '../../utils/responsive.dart';
import 'image_placeholder.dart';

class MissionScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;
  final void Function(bool isCorrect)? onAnswerResult;

  const MissionScreen({
    super.key,
    required this.screen,
    required this.onContinue,
    this.onAnswerResult,
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
  late AnimationController _treasureController;
  late AnimationController _scrollRevealController;

  late Animation<double> _glowAnimation;
  late Animation<double> _treasureScale;
  late Animation<double> _treasureRotate;

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

    _treasureController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _treasureScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _treasureController,
        curve: const Interval(0.0, 0.6, curve: Curves.elasticOut),
      ),
    );

    _treasureRotate = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _treasureController,
        curve: const Interval(0.3, 1.0, curve: Curves.easeOut),
      ),
    );

    _scrollRevealController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    // Start scroll reveal animation
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollRevealController.forward();
    });
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    _glowController.dispose();
    _particleController.dispose();
    _treasureController.dispose();
    _scrollRevealController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_selectedIndex == null || _submitted) return;

    final missionData = widget.screen.missionData;
    if (missionData == null) return;

    final isCorrect = _selectedIndex == missionData.correctIndex;

    if (isCorrect) {
      SoundService().playGood();
      widget.onAnswerResult?.call(true);
      _treasureController.forward();
    } else {
      SoundService().playBeep();
    }

    setState(() {
      _submitted = true;
      _isCorrect = isCorrect;
    });

    _feedbackController.forward();

    if (_isCorrect) {
      Future.delayed(const Duration(milliseconds: 2000), () {
        if (mounted) widget.onContinue();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            _submitted = false;
            _selectedIndex = null;
          });
          _feedbackController.reset();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final missionData = widget.screen.missionData;
    if (missionData == null) {
      return const Center(child: Text('No mission data'));
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF2D1B69),
            const Color(0xFF1A1A2E),
            const Color(0xFF0F0F1A).withValues(alpha: 0.95),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Quest background elements
          _buildQuestBackground(),

          // Animated particles
          ...List.generate(15, (index) => _buildParticle(index)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 60, 16, 20),
              child: Column(
                children: [
                  // Quest header
                  _buildQuestHeader(),

                  const SizedBox(height: 16),

                  // Main content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Image
                          if (widget.screen.imagePrompt != null)
                            ImagePlaceholder(
                              prompt: widget.screen.imagePrompt!,
                              imagePath: widget.screen.imagePath,
                              height: 130,
                              gradientColors: const [
                                Color(0xFF2D1B69),
                                Color(0xFF4C1D95),
                              ],
                            ),

                          const SizedBox(height: 16),

                          // Mission scroll/parchment
                          _buildMissionScroll(missionData),

                          const SizedBox(height: 20),

                          // Quest path options
                          _buildQuestPathOptions(missionData),
                        ],
                      ),
                    ),
                  ),

                  // Accept quest button
                  _buildAcceptButton(),
                ],
              ),
            ),
          ),

          // Treasure reveal overlay
          if (_isCorrect && _submitted) _buildTreasureReveal(),
        ],
      ),
    );
  }

  Widget _buildQuestBackground() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Stack(
          children: [
            // Top corner glow
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.purple.withValues(alpha: 0.2 * _glowAnimation.value),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Bottom glow
            Positioned(
              bottom: -100,
              left: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.amber.withValues(alpha: 0.1 * _glowAnimation.value),
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

  Widget _buildQuestHeader() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber.withValues(alpha: 0.3),
                Colors.orange.withValues(alpha: 0.2),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.amber.withValues(alpha: 0.6 * _glowAnimation.value),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.3 * _glowAnimation.value),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Quest icon
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: const Text('🗺️', style: TextStyle(fontSize: 22)),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.screen.title ?? 'Quest Challenge',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Choose your path wisely',
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.amber.withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Reward preview
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.amber.withValues(alpha: 0.5)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('🎁', style: TextStyle(fontSize: 14)),
                    SizedBox(width: 4),
                    Text(
                      '+15 QP',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMissionScroll(MissionData missionData) {
    return AnimatedBuilder(
      animation: _scrollRevealController,
      builder: (context, child) {
        final progress = _scrollRevealController.value;
        return Transform.scale(
          scale: 0.9 + (0.1 * Curves.easeOutBack.transform(progress)),
          child: Opacity(
            opacity: progress.clamp(0.0, 1.0),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF5E6D3).withValues(alpha: 0.15),
                    const Color(0xFFE8D4B8).withValues(alpha: 0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.amber.withValues(alpha: 0.4),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Scroll header decoration
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: 30, height: 2, color: Colors.amber.withValues(alpha: 0.5)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text('📜', style: TextStyle(fontSize: 24)),
                      ),
                      Container(width: 30, height: 2, color: Colors.amber.withValues(alpha: 0.5)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Mission text
                  Text(
                    'Your mission, should you accept:',
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: Colors.amber.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    missionData.mission,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
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

  Widget _buildQuestPathOptions(MissionData missionData) {
    return Column(
      children: List.generate(missionData.options.length, (index) {
        return _buildQuestOption(index, missionData);
      }),
    );
  }

  Widget _buildQuestOption(int index, MissionData missionData) {
    final isSelected = _selectedIndex == index;
    final isCorrectOption = index == missionData.correctIndex;
    final pathIcons = ['🛤️', '⛰️', '🌊', '🏰'];
    final pathColors = [Colors.green, Colors.orange, Colors.blue, Colors.purple];
    final color = pathColors[index % pathColors.length];
    final icon = pathIcons[index % pathIcons.length];

    // Determine colors based on state
    Color bgColor = color.withValues(alpha: 0.1);
    Color borderColor = color.withValues(alpha: 0.3);

    if (isSelected && !_submitted) {
      bgColor = color.withValues(alpha: 0.25);
      borderColor = color;
    }

    if (_submitted && isSelected) {
      if (_isCorrect) {
        bgColor = Colors.green.withValues(alpha: 0.3);
        borderColor = Colors.green;
      } else {
        bgColor = Colors.red.withValues(alpha: 0.3);
        borderColor = Colors.red;
      }
    }

    if (_submitted && !_isCorrect && isCorrectOption) {
      bgColor = Colors.green.withValues(alpha: 0.15);
      borderColor = Colors.green.withValues(alpha: 0.6);
    }

    return AnimatedBuilder(
      animation: _scrollRevealController,
      builder: (context, child) {
        final delay = 0.2 + (index * 0.1);
        final progress = ((_scrollRevealController.value - delay) / (1 - delay)).clamp(0.0, 1.0);
        final slideOffset = 40 * (1 - Curves.easeOutBack.transform(progress));

        return Opacity(
          opacity: progress,
          child: Transform.translate(
            offset: Offset(0, slideOffset),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GestureDetector(
                onTap: _submitted ? null : () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding: const EdgeInsets.all(14),
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
                      // Path icon
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: color.withValues(alpha: 0.5)),
                        ),
                        child: Center(
                          child: Text(icon, style: const TextStyle(fontSize: 22)),
                        ),
                      ),
                      const SizedBox(width: 14),
                      // Option text
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Path ${String.fromCharCode(65 + index)}',
                              style: TextStyle(
                                fontSize: 11,
                                color: color,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              missionData.options[index],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Selection indicator
                      if (isSelected)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: _submitted
                                ? (_isCorrect ? Colors.green : Colors.red)
                                : color,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _submitted
                                ? (_isCorrect ? Icons.check : Icons.close)
                                : Icons.arrow_forward,
                            color: Colors.white,
                            size: 18,
                          ),
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

  Widget _buildAcceptButton() {
    final canSubmit = _selectedIndex != null && !_submitted;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: canSubmit
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.4 * _glowAnimation.value),
                      blurRadius: 20,
                      spreadRadius: 3,
                    ),
                  ],
                )
              : null,
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: ElevatedButton(
              onPressed: canSubmit ? _onSubmit : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                disabledBackgroundColor: Colors.grey.withValues(alpha: 0.3),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: canSubmit ? 6 : 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _submitted
                        ? (_isCorrect ? Icons.emoji_events : Icons.refresh)
                        : Icons.play_arrow,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _submitted
                        ? (_isCorrect ? 'Quest Complete!' : 'Try Again')
                        : 'Accept Quest',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
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

  Widget _buildTreasureReveal() {
    return AnimatedBuilder(
      animation: _treasureController,
      builder: (context, child) {
        return Container(
          color: Colors.black.withValues(alpha: 0.7 * _treasureController.value),
          child: Center(
            child: Transform.scale(
              scale: _treasureScale.value,
              child: Transform.rotate(
                angle: sin(_treasureRotate.value * pi * 2) * 0.1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Treasure chest
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.amber.withValues(alpha: 0.3),
                            Colors.transparent,
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: const Text('🎁', style: TextStyle(fontSize: 80)),
                    ),
                    const SizedBox(height: 20),
                    // Success message
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.withValues(alpha: 0.9),
                            Colors.green.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.withValues(alpha: 0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Column(
                        children: [
                          Text(
                            'QUEST COMPLETE!',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '+15 QP Earned',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
    final colors = [Colors.amber, Colors.purple, Colors.orange, Colors.white];

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
