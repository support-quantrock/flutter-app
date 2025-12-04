import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:video_player/video_player.dart';
import '../../models/lesson_models.dart';

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
  late AnimationController _typingController;
  late Animation<double> _glowAnimation;
  VideoPlayerController? _videoController;
  bool _isVideoInitialized = false;
  bool _isVideoPlaying = false;

  // TTS and typing animation
  final FlutterTts _tts = FlutterTts();
  String _displayedText = '';
  String get _fullText => widget.screen.content ?? '';
  bool _hasStartedNarration = false;

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

    // Typing animation controller - 5 seconds to match TTS duration
    _typingController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..addListener(() {
      setState(() {
        final charCount = (_typingController.value * _fullText.length).floor();
        _displayedText = _fullText.substring(0, charCount);
      });
    });

    _initVideoPlayer();
    _initTts();
  }

  Future<void> _initTts() async {
    await _tts.setLanguage('en-US');
    await _tts.setSpeechRate(0.45); // Slower for clarity
    await _tts.setVolume(1.0);
    await _tts.setPitch(1.0);
  }

  // Called on user tap - browsers require user interaction for audio
  Future<void> _startNarration() async {
    if (_hasStartedNarration) return;
    setState(() {
      _hasStartedNarration = true;
    });
    // Skip TTS and typing if content is empty (video has its own audio)
    if (_fullText.isNotEmpty) {
      _typingController.forward();
      await _tts.speak(_fullText);
    }
  }

  Future<void> _initVideoPlayer() async {
    if (widget.screen.videoPath != null) {
      _videoController = VideoPlayerController.asset(widget.screen.videoPath!);
      try {
        await _videoController!.initialize();
        _videoController!.setLooping(false); // Play only once

        // Listen for video completion to auto-start narration
        _videoController!.addListener(_onVideoProgress);

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

  void _onVideoProgress() {
    if (_videoController == null) return;
    final position = _videoController!.value.position;
    final duration = _videoController!.value.duration;

    // Check if video has finished
    if (duration > Duration.zero && position >= duration) {
      if (!_hasStartedNarration && mounted) {
        _startNarration();
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
    _typingController.dispose();
    _tts.stop();
    _videoController?.removeListener(_onVideoProgress);
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
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
              child: Column(
                children: [
                  // Video player (plays first, then triggers narration)
                  if (_isVideoInitialized && _videoController != null)
                    Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: _toggleVideo,
                        child: Container(
                          width: double.infinity,
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
                                SizedBox.expand(
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: SizedBox(
                                      width: _videoController!.value.size.width,
                                      height: _videoController!.value.size.height,
                                      child: VideoPlayer(_videoController!),
                                    ),
                                  ),
                                ),
                                if (!_isVideoPlaying)
                                  Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: Colors.amber.withValues(alpha: 0.9),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                      size: 50,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  // Only show text box and categories if content is not empty
                  if (_fullText.isNotEmpty) ...[
                    const SizedBox(height: 24),

                    // Quote text (appears with typing animation after video ends)
                    AnimatedBuilder(
                      animation: _glowAnimation,
                      builder: (context, child) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.amber.withValues(alpha: 0.3 * _glowAnimation.value),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.amber.withValues(alpha: 0.2 * _glowAnimation.value),
                                blurRadius: 20 * _glowAnimation.value,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: _hasStartedNarration ? _displayedText : ''),
                                // Blinking cursor while typing
                                if (_hasStartedNarration && _displayedText.length < _fullText.length)
                                  TextSpan(
                                    text: '|',
                                    style: TextStyle(
                                      color: Colors.amber.withValues(alpha: _glowAnimation.value),
                                    ),
                                  ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.95),
                              height: 1.6,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 16),

                    // Categories image (Spending, Saving, Investing)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        'assets/images/lessons/day2/day2_screen1_categories.png',
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],

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
