import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../models/lesson_models.dart';
import '../../utils/responsive.dart';
import 'image_placeholder.dart';

class StoryScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const StoryScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen>
    with TickerProviderStateMixin {
  late AnimationController _glowController;
  late AnimationController _particleController;
  late AnimationController _bubbleController;
  late AnimationController _mascotController;
  late AnimationController _imageController;
  late Animation<double> _glowAnimation;
  late Animation<double> _bubbleAnimation;
  late Animation<double> _mascotBounce;
  late Animation<double> _imageScale;

  // TTS and typing animation
  final FlutterTts _tts = FlutterTts();
  String _displayedText = '';
  String get _fullText => widget.screen.content ?? '';
  bool _hasStartedNarration = false;
  int _currentBubbleIndex = 0;
  List<String> _speechBubbles = [];

  @override
  void initState() {
    super.initState();

    // Parse content into speech bubbles (split by double newline or sentence)
    _speechBubbles = _fullText.split('\n\n').where((s) => s.trim().isNotEmpty).toList();
    if (_speechBubbles.isEmpty && _fullText.isNotEmpty) {
      _speechBubbles = [_fullText];
    }

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

    // Bubble appear animation
    _bubbleController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _bubbleAnimation = CurvedAnimation(
      parent: _bubbleController,
      curve: Curves.elasticOut,
    );

    // Mascot bounce animation
    _mascotController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _mascotBounce = Tween<double>(begin: 0, end: 8).animate(
      CurvedAnimation(parent: _mascotController, curve: Curves.easeInOut),
    );

    // Image scale animation
    _imageController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _imageScale = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.easeOutBack),
    );

    _initTts();

    // Start animations after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _startNarration();
        _imageController.forward();
      }
    });
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.45);
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  Future<void> _startNarration() async {
    if (_hasStartedNarration || _speechBubbles.isEmpty) return;

    setState(() {
      _hasStartedNarration = true;
      _currentBubbleIndex = 0;
    });

    _bubbleController.forward(from: 0);
    _animateTyping(_speechBubbles[0]);

    // Speak the first bubble
    await _tts.speak(_speechBubbles[0]);
  }

  void _animateTyping(String text) {
    _displayedText = '';
    int charIndex = 0;

    Future.doWhile(() async {
      if (!mounted || charIndex >= text.length) return false;

      await Future.delayed(const Duration(milliseconds: 30));
      if (mounted) {
        setState(() {
          charIndex++;
          _displayedText = text.substring(0, charIndex);
        });
      }
      return charIndex < text.length;
    });
  }

  void _nextBubble() async {
    if (_currentBubbleIndex < _speechBubbles.length - 1) {
      await _tts.stop();
      setState(() {
        _currentBubbleIndex++;
      });
      _bubbleController.forward(from: 0);
      _animateTyping(_speechBubbles[_currentBubbleIndex]);
      await _tts.speak(_speechBubbles[_currentBubbleIndex]);
    } else {
      // All bubbles shown, allow continue
      widget.onContinue();
    }
  }

  @override
  void dispose() {
    _glowController.dispose();
    _particleController.dispose();
    _bubbleController.dispose();
    _mascotController.dispose();
    _imageController.dispose();
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return GestureDetector(
      onTap: _hasStartedNarration ? _nextBubble : _startNarration,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1A1A2E),
              const Color(0xFF16213E),
              const Color(0xFF0F3460).withValues(alpha: 0.8),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Animated particles
            ...List.generate(20, (index) => _buildParticle(index)),

            // Main content
            SafeArea(
              child: Responsive.constrain(
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    Responsive.horizontalPadding,
                    Responsive.scale(60),
                    Responsive.horizontalPadding,
                    Responsive.verticalPadding,
                  ),
                  child: Column(
                    children: [
                      // Title header
                      _buildHeader(),

                      SizedBox(height: Responsive.scale(16)),

                      // Main story area with mascot and image
                      Expanded(
                        child: Responsive.isTablet
                            ? _buildTabletLayout()
                            : _buildMobileLayout(),
                      ),

                      SizedBox(height: Responsive.scale(16)),

                      // Progress dots for speech bubbles
                      if (_speechBubbles.length > 1)
                        _buildProgressDots(),

                      SizedBox(height: Responsive.scale(12)),

                      // Continue button / Tap hint
                      _buildBottomArea(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mascot on left
        _buildMascot(),

        SizedBox(width: Responsive.scale(12)),

        // Content area (speech bubble + image)
        Expanded(
          child: Column(
            children: [
              // Speech bubble
              _buildSpeechBubble(),

              SizedBox(height: Responsive.scale(16)),

              // Animated image
              if (widget.screen.imagePath != null || widget.screen.imagePrompt != null)
                Expanded(child: _buildAnimatedImage()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mascot on left
        _buildMascot(),

        SizedBox(width: Responsive.scale(20)),

        // Speech bubble in middle
        Expanded(
          flex: 2,
          child: _buildSpeechBubble(),
        ),

        SizedBox(width: Responsive.scale(20)),

        // Image on right
        if (widget.screen.imagePath != null || widget.screen.imagePrompt != null)
          Expanded(
            flex: 3,
            child: _buildAnimatedImage(),
          ),
      ],
    );
  }

  Widget _buildHeader() {
    return AnimatedBuilder(
      animation: _glowAnimation,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.scale(20),
            vertical: Responsive.scale(10),
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber.withValues(alpha: 0.2),
                Colors.orange.withValues(alpha: 0.15),
              ],
            ),
            borderRadius: BorderRadius.circular(Responsive.scale(20)),
            border: Border.all(
              color: Colors.amber.withValues(alpha: 0.4 * _glowAnimation.value),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.2 * _glowAnimation.value),
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('📖', style: TextStyle(fontSize: Responsive.fontSize(24))),
              SizedBox(width: Responsive.scale(10)),
              Flexible(
                child: Text(
                  widget.screen.title ?? 'Story Time',
                  style: TextStyle(
                    fontSize: Responsive.fontSize(18),
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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

  Widget _buildMascot() {
    final mascotWidth = Responsive.mascotWidth;
    final mascotHeight = mascotWidth * 1.25;

    return AnimatedBuilder(
      animation: _mascotBounce,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _mascotBounce.value),
          child: Column(
            children: [
              // Mascot container
              Container(
                width: mascotWidth,
                height: mascotHeight,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.amber.withValues(alpha: 0.3),
                      Colors.orange.withValues(alpha: 0.2),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(Responsive.scale(20)),
                  border: Border.all(
                    color: Colors.amber.withValues(alpha: 0.5),
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber.withValues(alpha: 0.3),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Character face
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Eyes
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildEye(),
                            SizedBox(width: Responsive.scale(12)),
                            _buildEye(),
                          ],
                        ),
                        SizedBox(height: Responsive.scale(8)),
                        // Smile
                        Container(
                          width: Responsive.scale(30),
                          height: Responsive.scale(15),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.amber.shade700,
                                width: 3,
                              ),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(Responsive.scale(15)),
                              bottomRight: Radius.circular(Responsive.scale(15)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Glasses
                    Positioned(
                      top: mascotHeight * 0.25,
                      child: Row(
                        children: [
                          Container(
                            width: Responsive.scale(22),
                            height: Responsive.scale(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          Container(width: Responsive.scale(6), height: 2, color: Colors.white70),
                          Container(
                            width: Responsive.scale(22),
                            height: Responsive.scale(16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white70, width: 2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: Responsive.scale(8)),
              // Name tag
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Responsive.scale(8),
                  vertical: Responsive.scale(4),
                ),
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.8),
                  borderRadius: BorderRadius.circular(Responsive.scale(8)),
                ),
                child: Text(
                  'Quinn',
                  style: TextStyle(
                    fontSize: Responsive.fontSize(12),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEye() {
    final eyeSize = Responsive.scale(14);
    return Container(
      width: eyeSize,
      height: eyeSize,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 2,
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: eyeSize * 0.43,
          height: eyeSize * 0.43,
          decoration: const BoxDecoration(
            color: Colors.black87,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  Widget _buildSpeechBubble() {
    if (!_hasStartedNarration || _speechBubbles.isEmpty) {
      return Container(
        padding: EdgeInsets.all(Responsive.scale(16)),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(Responsive.scale(16)),
        ),
        child: Text(
          'Tap to start...',
          style: TextStyle(
            fontSize: Responsive.fontSize(16),
            color: Colors.white.withValues(alpha: 0.6),
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }

    return AnimatedBuilder(
      animation: _bubbleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: 0.8 + (0.2 * _bubbleAnimation.value),
          child: Opacity(
            opacity: _bubbleAnimation.value.clamp(0.0, 1.0),
            child: Container(
              padding: EdgeInsets.all(Responsive.scale(16)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Responsive.scale(4)),
                  topRight: Radius.circular(Responsive.scale(20)),
                  bottomLeft: Radius.circular(Responsive.scale(20)),
                  bottomRight: Radius.circular(Responsive.scale(20)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _displayedText,
                    style: TextStyle(
                      fontSize: Responsive.fontSize(16),
                      color: const Color(0xFF1A1A2E),
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // Typing cursor
                  if (_displayedText.length < (_speechBubbles.isNotEmpty ? _speechBubbles[_currentBubbleIndex].length : 0))
                    AnimatedBuilder(
                      animation: _glowAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: _glowAnimation.value,
                          child: Container(
                            width: 2,
                            height: Responsive.scale(18),
                            color: Colors.amber,
                            margin: EdgeInsets.only(top: Responsive.scale(2)),
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnimatedImage() {
    return AnimatedBuilder(
      animation: _imageScale,
      builder: (context, child) {
        return Transform.scale(
          scale: _imageScale.value,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Responsive.scale(16)),
              boxShadow: [
                BoxShadow(
                  color: Colors.amber.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Responsive.scale(16)),
              child: ImagePlaceholder(
                prompt: widget.screen.imagePrompt ?? '',
                imagePath: widget.screen.imagePath,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProgressDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_speechBubbles.length, (index) {
        final isActive = index == _currentBubbleIndex;
        final isPast = index < _currentBubbleIndex;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: Responsive.scale(4)),
          width: isActive ? Responsive.scale(24) : Responsive.scale(8),
          height: Responsive.scale(8),
          decoration: BoxDecoration(
            color: isActive
                ? Colors.amber
                : isPast
                    ? Colors.amber.withValues(alpha: 0.5)
                    : Colors.white.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(Responsive.scale(4)),
            boxShadow: isActive ? [
              BoxShadow(
                color: Colors.amber.withValues(alpha: 0.5),
                blurRadius: 8,
              ),
            ] : null,
          ),
        );
      }),
    );
  }

  Widget _buildBottomArea() {
    final isLastBubble = _currentBubbleIndex >= _speechBubbles.length - 1;

    return Column(
      children: [
        // Tap hint
        AnimatedBuilder(
          animation: _glowAnimation,
          builder: (context, child) {
            return Opacity(
              opacity: 0.5 + (0.5 * _glowAnimation.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.touch_app,
                    color: Colors.white.withValues(alpha: 0.7),
                    size: Responsive.iconSize(mobile: 20),
                  ),
                  SizedBox(width: Responsive.scale(8)),
                  Text(
                    isLastBubble ? 'Tap to continue' : 'Tap for next',
                    style: TextStyle(
                      fontSize: Responsive.fontSize(14),
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        SizedBox(height: Responsive.scale(12)),

        // Continue button (shown when all bubbles are read)
        if (isLastBubble && _hasStartedNarration)
          SizedBox(
            width: double.infinity,
            height: Responsive.buttonHeight(),
            child: ElevatedButton(
              onPressed: widget.onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Responsive.scale(16)),
                ),
                elevation: 8,
                shadowColor: Colors.amber.withValues(alpha: 0.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: Responsive.fontSize(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: Responsive.scale(8)),
                  Icon(Icons.arrow_forward, size: Responsive.iconSize(mobile: 20)),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 3;
    final left = random.nextDouble() * Responsive.screenWidth;
    final startTop = random.nextDouble() * Responsive.screenHeight;
    final colors = [Colors.amber, Colors.orange, Colors.yellow, Colors.white];

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = (_particleController.value + index * 0.05) % 1.0;
        final top = startTop - (progress * 250);

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
