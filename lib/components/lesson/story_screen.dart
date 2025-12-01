import 'dart:math';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../models/lesson_models.dart';
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
  late Animation<double> _glowAnimation;
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  bool _isVideoPlaying = false;

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
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();

    _initVideoPlayer();
  }

  Future<void> _initVideoPlayer() async {
    if (widget.screen.videoPath != null) {
      _videoController = VideoPlayerController.asset(widget.screen.videoPath!);
      try {
        await _videoController!.initialize();
        _videoController!.setLooping(true);
        _videoController!.play();
        setState(() {
          _isVideoInitialized = true;
          _isVideoPlaying = true;
        });
      } catch (e) {
        debugPrint('Error initializing video: $e');
      }
    }
  }

  void _toggleVideo() {
    if (_videoController == null || !_isVideoInitialized) return;

    setState(() {
      if (_isVideoPlaying) {
        _videoController!.pause();
      } else {
        _videoController!.play();
      }
      _isVideoPlaying = !_isVideoPlaying;
    });
  }

  @override
  void dispose() {
    _glowController.dispose();
    _particleController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0D0D1A),
            Color(0xFF1A1A2E),
            Color(0xFF16213E),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Animated particles
          ...List.generate(15, (index) => _buildParticle(index)),

          // Main content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Story title with glow
                  AnimatedBuilder(
                    animation: _glowAnimation,
                    builder: (context, child) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.amber.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber
                                  .withValues(alpha: 0.3 * _glowAnimation.value),
                              blurRadius: 20 * _glowAnimation.value,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Text(
                          widget.screen.title ?? 'Story',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                            letterSpacing: 1,
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 24),

                  // Video or Image placeholder
                  if (_isVideoInitialized && _videoController != null)
                    GestureDetector(
                      onTap: _toggleVideo,
                      child: Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withValues(alpha: 0.3),
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AspectRatio(
                                aspectRatio: _videoController!.value.aspectRatio,
                                child: VideoPlayer(_videoController!),
                              ),
                              if (!_isVideoPlaying)
                                Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.amber.withValues(alpha: 0.9),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    )
                  else if (widget.screen.imagePrompt != null)
                    ImagePlaceholder(
                      prompt: widget.screen.imagePrompt!,
                      imagePath: widget.screen.imagePath,
                      height: 220,
                      gradientColors: const [
                        Color(0xFF1A1A2E),
                        Color(0xFF4C1D95),
                        Color(0xFF1A1A2E),
                      ],
                    ),

                  const SizedBox(height: 16),

                  // Categories image (Spending, Saving, Investing)
                  if (widget.screen.videoPath != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/lessons/day2/day2_screen1_categories.png',
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                  const SizedBox(height: 16),

                  // Story content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: Colors.amber.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Text(
                          widget.screen.content ?? '',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withValues(alpha: 0.9),
                            height: 1.8,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Continue button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: widget.onContinue,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 8,
                        shadowColor: Colors.amber.withValues(alpha: 0.5),
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

  Widget _buildParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final startTop = random.nextDouble() * MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = (_particleController.value + index * 0.1) % 1.0;
        final top = startTop - (progress * 200);

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
                color: Colors.amber,
                boxShadow: [
                  BoxShadow(
                    color: Colors.amber.withValues(alpha: 0.5),
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
