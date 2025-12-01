import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import 'image_placeholder.dart';

class ContentScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;
  final Color? themeColor;
  final List<Color>? gradientColors;

  const ContentScreen({
    super.key,
    required this.screen,
    required this.onContinue,
    this.themeColor,
    this.gradientColors,
  });

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late AnimationController _particleController;
  late AnimationController _pulseController;
  late Animation<double> _glowAnimation;
  late Animation<double> _pulseAnimation;

  final Set<int> _revealedBullets = {};
  bool _allRevealed = false;

  @override
  void initState() {
    super.initState();
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

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Auto-reveal bullets if none exist
    if (widget.screen.bullets == null || widget.screen.bullets!.isEmpty) {
      _allRevealed = true;
    }
  }

  @override
  void dispose() {
    _glowController.dispose();
    _particleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _revealBullet(int index) {
    if (_revealedBullets.contains(index)) return;

    setState(() {
      _revealedBullets.add(index);
      if (widget.screen.bullets != null &&
          _revealedBullets.length >= widget.screen.bullets!.length) {
        _allRevealed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.themeColor ?? const Color(0xFF6366F1);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: widget.gradientColors ??
              [
                const Color(0xFF0D0D1A),
                const Color(0xFF1A1A2E),
                const Color(0xFF16213E),
              ],
        ),
      ),
      child: Stack(
        children: [
          // Animated particles
          ...List.generate(20, (index) => _buildParticle(index, primaryColor)),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // Progress indicator
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                  child: _buildProgressBar(primaryColor),
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title with game badge
                        if (widget.screen.title != null)
                          _buildGameTitle(primaryColor),

                        const SizedBox(height: 20),

                        // Image with glow frame
                        if (widget.screen.imagePrompt != null)
                          _buildGameImage(primaryColor),

                        const SizedBox(height: 20),

                        // Main content text
                        if (widget.screen.content != null)
                          _buildContentCard(primaryColor),

                        const SizedBox(height: 24),

                        // Interactive bullet cards
                        if (widget.screen.bullets != null)
                          _buildBulletSection(primaryColor),
                      ],
                    ),
                  ),
                ),

                // Continue button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: _buildContinueButton(primaryColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressBar(Color color) {
    final total = widget.screen.bullets?.length ?? 1;
    final revealed = _revealedBullets.length;
    final progress = total > 0 ? revealed / total : 1.0;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          height: 8,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                width: MediaQuery.of(context).size.width * progress * 0.85,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [color, color.withValues(alpha: 0.7)],
                  ),
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.5 * _glowAnimation.value),
                      blurRadius: 10,
                      spreadRadius: 2,
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

  Widget _buildGameTitle(Color color) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withValues(alpha: 0.3),
                color.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withValues(alpha: 0.5 * _glowAnimation.value),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.3 * _glowAnimation.value),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: const Text('📖', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.screen.title!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGameImage(Color color) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.3 * _glowAnimation.value),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: ImagePlaceholder(
              prompt: widget.screen.imagePrompt!,
              imagePath: widget.screen.imagePath,
              height: 180,
            ),
          ),
        );
      },
    );
  }

  Widget _buildContentCard(Color color) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.05),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: color.withValues(alpha: 0.3 * _glowAnimation.value),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.1 * _glowAnimation.value),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Text(
            widget.screen.content!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.6,
            ),
          ),
        );
      },
    );
  }

  Widget _buildBulletSection(Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tap instruction
        if (!_allRevealed)
          AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.amber.withValues(alpha: 0.5),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('👆', style: TextStyle(fontSize: 16)),
                      SizedBox(width: 8),
                      Text(
                        'Tap cards to reveal!',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),

        const SizedBox(height: 16),

        // Bullet cards
        ...widget.screen.bullets!.asMap().entries.map((entry) {
          return _buildBulletCard(entry.value, color, entry.key);
        }),
      ],
    );
  }

  Widget _buildBulletCard(BulletPoint bullet, Color color, int index) {
    final isRevealed = _revealedBullets.contains(index);

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: 400 + index * 100),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: GestureDetector(
              onTap: () => _revealBullet(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: isRevealed
                      ? LinearGradient(
                          colors: [
                            color.withValues(alpha: 0.2),
                            color.withValues(alpha: 0.1),
                          ],
                        )
                      : null,
                  color: isRevealed ? null : Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isRevealed
                        ? color.withValues(alpha: 0.5)
                        : Colors.white.withValues(alpha: 0.2),
                    width: isRevealed ? 2 : 1,
                  ),
                  boxShadow: isRevealed
                      ? [
                          BoxShadow(
                            color: color.withValues(alpha: 0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon container
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isRevealed
                            ? color.withValues(alpha: 0.3)
                            : Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: isRevealed
                            ? [
                                BoxShadow(
                                  color: color.withValues(alpha: 0.3),
                                  blurRadius: 10,
                                ),
                              ]
                            : null,
                      ),
                      child: Text(
                        isRevealed ? bullet.icon : '❓',
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(width: 14),
                    // Content
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AnimatedDefaultTextStyle(
                            duration: const Duration(milliseconds: 400),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isRevealed
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.5),
                            ),
                            child: Text(
                              isRevealed ? bullet.title : 'Tap to reveal...',
                            ),
                          ),
                          if (bullet.description != null && isRevealed) ...[
                            const SizedBox(height: 6),
                            AnimatedOpacity(
                              duration: const Duration(milliseconds: 400),
                              opacity: isRevealed ? 1.0 : 0.0,
                              child: Text(
                                bullet.description!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withValues(alpha: 0.7),
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    // Reveal indicator
                    if (!isRevealed)
                      AnimatedBuilder(
                        animation: _pulseAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _pulseAnimation.value,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.amber.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.touch_app,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ),
                          );
                        },
                      )
                    else
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.green.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 20,
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

  Widget _buildContinueButton(Color color) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        final canContinue = _allRevealed;

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: canContinue ? 1.0 : 0.5,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: canContinue
                  ? [
                      BoxShadow(
                        color: color.withValues(alpha: 0.5 * _glowAnimation.value),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ]
                  : null,
            ),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: canContinue ? widget.onContinue : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  disabledBackgroundColor: Colors.grey.withValues(alpha: 0.3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: canContinue ? 8 : 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      canContinue ? 'Continue' : 'Reveal all cards first!',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (canContinue) ...[
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, size: 20),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildParticle(int index, Color color) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 5;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final startTop = random.nextDouble() * MediaQuery.of(context).size.height;
    final particleColor = index % 3 == 0
        ? color
        : index % 3 == 1
            ? Colors.amber
            : Colors.cyan;

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = (_particleController.value + index * 0.05) % 1.0;
        final top = startTop - (progress * 300);

        return Positioned(
          left: left,
          top: top,
          child: Opacity(
            opacity: (1 - progress) * 0.6,
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: particleColor,
                boxShadow: [
                  BoxShadow(
                    color: particleColor.withValues(alpha: 0.5),
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
