import 'package:flutter/material.dart';
import '../models/lesson_models.dart';
import '../data/lessons/lesson_registry.dart';
import '../components/lesson/story_screen.dart';
import '../components/lesson/content_screen.dart';
import '../components/lesson/game_screen.dart';
import '../components/lesson/question_screen.dart';
import '../components/lesson/mission_screen.dart';
import '../components/lesson/reward_screen.dart';

class LessonPage extends StatefulWidget {
  final int day;
  final int lessonNumber;

  const LessonPage({
    super.key,
    required this.day,
    this.lessonNumber = 1,
  });

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  int _currentScreenIndex = 0;
  late LessonData _lessonData;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadLesson();
  }

  void _loadLesson() {
    final lesson = LessonRegistry.getLessonByNumber(widget.day, widget.lessonNumber);
    if (lesson != null) {
      setState(() {
        _lessonData = lesson;
        _isLoaded = true;
      });
    }
  }

  void _goToNextScreen() {
    if (_currentScreenIndex < _lessonData.screens.length - 1) {
      setState(() {
        _currentScreenIndex++;
      });
    } else {
      // Lesson complete - return to skill challenge
      Navigator.of(context).pop(true); // true = completed
    }
  }

  void _goToPreviousScreen() {
    if (_currentScreenIndex > 0) {
      setState(() {
        _currentScreenIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(color: Colors.amber),
              const SizedBox(height: 20),
              Text(
                'Day ${widget.day} Lesson ${widget.lessonNumber} not found',
                style: const TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Go Back'),
              ),
            ],
          ),
        ),
      );
    }

    final currentScreen = _lessonData.screens[_currentScreenIndex];
    final progress = (_currentScreenIndex + 1) / _lessonData.screens.length;

    return Scaffold(
      body: Stack(
        children: [
          // Screen content
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            },
            child: KeyedSubtree(
              key: ValueKey(_currentScreenIndex),
              child: _buildScreen(currentScreen),
            ),
          ),

          // Top bar with progress and back button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Back/Close button
                      GestureDetector(
                        onTap: () {
                          if (_currentScreenIndex > 0) {
                            _goToPreviousScreen();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _currentScreenIndex > 0
                                ? Icons.arrow_back
                                : Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Progress bar
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Day ${widget.day}: ${_lessonData.title}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white70,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 6),
                            Stack(
                              children: [
                                Container(
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.white.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  height: 4,
                                  width: (MediaQuery.of(context).size.width - 120) *
                                      progress,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Colors.amber, Colors.orange],
                                    ),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Screen counter
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '${_currentScreenIndex + 1}/${_lessonData.screens.length}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScreen(LessonScreen screen) {
    // Determine theme color based on screen content
    Color? themeColor;
    if (screen.title?.toLowerCase().contains('consumer') == true) {
      themeColor = Colors.red;
    } else if (screen.title?.toLowerCase().contains('investor') == true) {
      themeColor = Colors.green;
    } else if (screen.title?.toLowerCase().contains('shift') == true) {
      themeColor = const Color(0xFF6366F1);
    }

    switch (screen.type) {
      case ScreenType.story:
        return StoryScreen(
          screen: screen,
          onContinue: _goToNextScreen,
        );

      case ScreenType.content:
        return ContentScreen(
          screen: screen,
          onContinue: _goToNextScreen,
          themeColor: themeColor,
        );

      case ScreenType.game:
        return GameScreen(
          screen: screen,
          onContinue: _goToNextScreen,
        );

      case ScreenType.question:
        return QuestionScreen(
          screen: screen,
          onContinue: _goToNextScreen,
        );

      case ScreenType.mission:
        return MissionScreen(
          screen: screen,
          onContinue: _goToNextScreen,
        );

      case ScreenType.reward:
        return RewardScreen(
          screen: screen,
          onContinue: _goToNextScreen,
        );
    }
  }
}
