import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import '../../services/sound_service.dart';
import '../../utils/responsive.dart';

class ContentScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;
  final Color? themeColor;
  final List<Color>? gradientColors;
  final int variant; // 0 = flip cards, 1 = swipe gallery

  const ContentScreen({
    super.key,
    required this.screen,
    required this.onContinue,
    this.themeColor,
    this.gradientColors,
    this.variant = 0,
  });

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late AnimationController _particleController;
  late Animation<double> _glowAnimation;

  // Flip card state
  final Map<int, AnimationController> _flipControllers = {};
  final Set<int> _flippedCards = {};
  bool _allRevealed = false;

  // Swipe gallery state
  late PageController _pageController;
  int _currentPage = 0;

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

    // Initialize flip controllers for each card
    final bulletCount = widget.screen.bullets?.length ?? 0;
    for (int i = 0; i < bulletCount; i++) {
      _flipControllers[i] = AnimationController(
        duration: const Duration(milliseconds: 600),
        vsync: this,
      );
    }

    // Page controller for swipe gallery
    _pageController = PageController(viewportFraction: 0.85);

    // Auto-reveal if no bullets
    if (bulletCount == 0) {
      _allRevealed = true;
    }
  }

  @override
  void dispose() {
    _glowController.dispose();
    _particleController.dispose();
    for (var controller in _flipControllers.values) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  void _flipCard(int index) {
    if (_flippedCards.contains(index)) return;

    SoundService().playReveal();
    _flipControllers[index]?.forward();

    setState(() {
      _flippedCards.add(index);
      if (widget.screen.bullets != null &&
          _flippedCards.length >= widget.screen.bullets!.length) {
        _allRevealed = true;
        SoundService().playCheer();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.themeColor ?? const Color(0xFF6366F1);

    // Use variant 1 (swipe gallery) for alternating content screens
    if (widget.variant == 1) {
      return _buildSwipeGallery(primaryColor);
    }

    return _buildFlipCards(primaryColor);
  }

  // ==================== FLIP CARDS VARIANT ====================
  Widget _buildFlipCards(Color primaryColor) {
    Responsive.init(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
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
          ...List.generate(15, (index) => _buildParticle(index, primaryColor)),

          SafeArea(
            child: Responsive.constrain(
              Column(
                children: [
                  // Header with title
                  Padding(
                    padding: EdgeInsets.fromLTRB(Responsive.horizontalPadding, Responsive.scale(60), Responsive.horizontalPadding, 0),
                    child: _buildHeader(primaryColor),
                  ),

                  SizedBox(height: Responsive.scale(16)),

                  // Progress dots
                  _buildProgressDots(primaryColor),

                  SizedBox(height: Responsive.scale(20)),

                  // Main content area
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: Responsive.horizontalPadding),
                      child: Column(
                        children: [
                          // Content text
                          if (widget.screen.content != null)
                            _buildContentText(primaryColor),

                          SizedBox(height: Responsive.scale(20)),

                          // Flip cards grid
                          if (widget.screen.bullets != null)
                            _buildFlipCardsGrid(primaryColor),
                        ],
                      ),
                    ),
                  ),

                  // Continue button
                  Padding(
                    padding: EdgeInsets.all(Responsive.horizontalPadding),
                    child: _buildContinueButton(primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlipCardsGrid(Color primaryColor) {
    final bullets = widget.screen.bullets!;
    final cardColors = [
      Colors.amber,
      Colors.cyan,
      Colors.purple,
      Colors.green,
      Colors.orange,
      Colors.pink,
    ];

    return Column(
      children: [
        // Tap instruction
        if (!_allRevealed)
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.amber.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.amber.withValues(alpha: 0.5)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedBuilder(
                  animation: _glowAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 0.9 + (0.1 * _glowAnimation.value),
                      child: const Text('🃏', style: TextStyle(fontSize: 20)),
                    );
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Tap cards to flip!',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

        // Cards in grid layout
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: List.generate(bullets.length, (index) {
            return _buildFlipCard(
              index,
              bullets[index],
              cardColors[index % cardColors.length],
            );
          }),
        ),
      ],
    );
  }

  Widget _buildFlipCard(int index, BulletPoint bullet, Color cardColor) {
    final controller = _flipControllers[index]!;
    final columns = Responsive.gridColumns(mobile: 2, tablet: 3, desktop: 4);
    final spacing = Responsive.scale(12);
    final cardWidth = Responsive.cardWidth(columns: columns, spacing: spacing);

    return GestureDetector(
      onTap: () => _flipCard(index),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          final angle = controller.value * pi;
          final isBackVisible = angle > pi / 2;

          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle),
            child: Container(
              width: cardWidth,
              height: cardWidth * 1.2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isBackVisible
                      ? [
                          cardColor.withValues(alpha: 0.3),
                          cardColor.withValues(alpha: 0.15),
                        ]
                      : [
                          Colors.white.withValues(alpha: 0.15),
                          Colors.white.withValues(alpha: 0.05),
                        ],
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isBackVisible
                      ? cardColor.withValues(alpha: 0.7)
                      : Colors.white.withValues(alpha: 0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: (isBackVisible ? cardColor : Colors.white)
                        .withValues(alpha: 0.2),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(isBackVisible ? pi : 0),
                child: isBackVisible
                    ? _buildCardBack(bullet, cardColor)
                    : _buildCardFront(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCardFront(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Text('❓', style: TextStyle(fontSize: 36)),
        ),
        const SizedBox(height: 12),
        Text(
          'Tap to reveal',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        AnimatedBuilder(
          animation: _glowAnimation,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0.2 * _glowAnimation.value),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.touch_app,
                color: Colors.amber.withValues(alpha: 0.5 + 0.5 * _glowAnimation.value),
                size: 24,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCardBack(BulletPoint bullet, Color cardColor) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Large icon
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: cardColor.withValues(alpha: 0.3),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: cardColor.withValues(alpha: 0.4),
                  blurRadius: 12,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Text(bullet.icon, style: const TextStyle(fontSize: 32)),
          ),
          const SizedBox(height: 12),
          // Title
          Text(
            bullet.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),
          if (bullet.description != null) ...[
            const SizedBox(height: 6),
            Text(
              bullet.description!,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 11,
                height: 1.3,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ==================== SWIPE GALLERY VARIANT ====================
  Widget _buildSwipeGallery(Color primaryColor) {
    Responsive.init(context);
    final bullets = widget.screen.bullets ?? [];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: widget.gradientColors ??
              [
                const Color(0xFF1A1A2E),
                const Color(0xFF16213E),
                const Color(0xFF0F3460),
              ],
        ),
      ),
      child: Stack(
        children: [
          // Animated particles
          ...List.generate(15, (index) => _buildParticle(index, primaryColor)),

          SafeArea(
            child: Responsive.constrain(
              Column(
                children: [
                  // Header
                  Padding(
                    padding: EdgeInsets.fromLTRB(Responsive.horizontalPadding, Responsive.scale(60), Responsive.horizontalPadding, 0),
                    child: _buildHeader(primaryColor),
                  ),

                  SizedBox(height: Responsive.scale(12)),

                  // Content text
                  if (widget.screen.content != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Responsive.horizontalPadding),
                      child: _buildContentText(primaryColor),
                    ),

                  SizedBox(height: Responsive.scale(20)),

                  // Swipe gallery
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentPage = index;
                          if (index == bullets.length - 1) {
                            _allRevealed = true;
                          }
                        });
                        SoundService().playReveal();
                      },
                      itemCount: bullets.length,
                      itemBuilder: (context, index) {
                        return _buildGalleryCard(
                          bullets[index],
                          index,
                          primaryColor,
                        );
                      },
                    ),
                  ),

                  // Page indicators
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Responsive.scale(16)),
                    child: _buildPageIndicators(bullets.length, primaryColor),
                  ),

                  // Swipe hint or Continue button
                  Padding(
                    padding: EdgeInsets.fromLTRB(Responsive.horizontalPadding, 0, Responsive.horizontalPadding, Responsive.horizontalPadding),
                    child: _currentPage < bullets.length - 1
                        ? _buildSwipeHint()
                        : _buildContinueButton(primaryColor),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryCard(BulletPoint bullet, int index, Color primaryColor) {
    final cardColors = [
      const Color(0xFF6366F1),
      const Color(0xFFEC4899),
      const Color(0xFF10B981),
      const Color(0xFFF59E0B),
      const Color(0xFF8B5CF6),
    ];
    final cardColor = cardColors[index % cardColors.length];

    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;
        if (_pageController.position.haveDimensions) {
          value = (_pageController.page! - index).abs();
          value = (1 - (value * 0.3)).clamp(0.0, 1.0);
        }

        return Transform.scale(
          scale: Curves.easeOut.transform(value),
          child: Opacity(
            opacity: value,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    cardColor.withValues(alpha: 0.4),
                    cardColor.withValues(alpha: 0.2),
                  ],
                ),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: cardColor.withValues(alpha: 0.6),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: cardColor.withValues(alpha: 0.3),
                    blurRadius: 25,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Large icon with glow
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: cardColor.withValues(alpha: 0.3),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: cardColor.withValues(alpha: 0.5),
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Text(
                        bullet.icon,
                        style: const TextStyle(fontSize: 48),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Title
                    Text(
                      bullet.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    if (bullet.description != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        bullet.description!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 16,
                          height: 1.5,
                        ),
                      ),
                    ],
                    const SizedBox(height: 24),
                    // Card number
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${index + 1} of ${widget.screen.bullets!.length}',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
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

  Widget _buildPageIndicators(int count, Color primaryColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == _currentPage;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 28 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isActive
                ? primaryColor
                : Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(5),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.5),
                      blurRadius: 8,
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }

  Widget _buildSwipeHint() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: 0.5 + (0.5 * _glowAnimation.value),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.swipe,
                color: Colors.white.withValues(alpha: 0.7),
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                'Swipe to see more',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ==================== SHARED WIDGETS ====================
  Widget _buildHeader(Color primaryColor) {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                primaryColor.withValues(alpha: 0.3),
                primaryColor.withValues(alpha: 0.1),
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: primaryColor.withValues(alpha: 0.5 * _glowAnimation.value),
            ),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withValues(alpha: 0.2 * _glowAnimation.value),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('📚', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.screen.title ?? 'Learn',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProgressDots(Color primaryColor) {
    final total = widget.screen.bullets?.length ?? 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final isRevealed = _flippedCards.contains(index);
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isRevealed ? 20 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: isRevealed
                ? primaryColor
                : Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(5),
            boxShadow: isRevealed
                ? [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.5),
                      blurRadius: 8,
                    ),
                  ]
                : null,
          ),
        );
      }),
    );
  }

  Widget _buildContentText(Color primaryColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.2),
        ),
      ),
      child: Text(
        widget.screen.content!,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white.withValues(alpha: 0.9),
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildContinueButton(Color primaryColor) {
    final canContinue = _allRevealed;

    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: canContinue ? 1.0 : 0.5,
          child: Container(
            decoration: canContinue
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withValues(alpha: 0.4 * _glowAnimation.value),
                        blurRadius: 15,
                        spreadRadius: 2,
                      ),
                    ],
                  )
                : null,
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: canContinue ? widget.onContinue : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  disabledBackgroundColor: Colors.grey.withValues(alpha: 0.3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: canContinue ? 6 : 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      canContinue ? 'Continue' : 'Reveal all cards',
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

  Widget _buildParticle(int index, Color primaryColor) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final startTop = random.nextDouble() * MediaQuery.of(context).size.height;
    final colors = [primaryColor, Colors.amber, Colors.cyan, Colors.white];

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
