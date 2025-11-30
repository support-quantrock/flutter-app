import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import 'image_placeholder.dart';

class QuestionScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const QuestionScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen>
    with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  bool _isCorrect = false;
  bool _showFeedback = false;
  late AnimationController _feedbackController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _feedbackController, curve: Curves.elasticOut),
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _onOptionTap(int index) {
    if (_showFeedback) return;

    final questionData = widget.screen.questionData;
    if (questionData == null) return;

    setState(() {
      _selectedIndex = index;
      _isCorrect = index == questionData.correctIndex;
      _showFeedback = true;
    });

    _feedbackController.forward(from: 0);

    if (_isCorrect) {
      Future.delayed(const Duration(milliseconds: 1200), () {
        widget.onContinue();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _showFeedback = false;
          _selectedIndex = null;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionData = widget.screen.questionData;
    if (questionData == null) {
      return const Center(child: Text('No question data'));
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1E293B),
            Color(0xFF0F172A),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Question header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.cyan.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.cyan.withValues(alpha: 0.3),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('❓', style: TextStyle(fontSize: 24)),
                    SizedBox(width: 12),
                    Text(
                      'Question',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.cyan,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Image placeholder
              if (widget.screen.imagePrompt != null)
                ImagePlaceholder(
                  prompt: widget.screen.imagePrompt!,
                  height: 150,
                ),

              const SizedBox(height: 32),

              // Question text
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.1),
                  ),
                ),
                child: Text(
                  questionData.question,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ),

              const Spacer(),

              // Options
              ...List.generate(questionData.options.length, (index) {
                final isSelected = _selectedIndex == index;
                final isCorrectOption = index == questionData.correctIndex;

                Color backgroundColor = Colors.white.withValues(alpha: 0.1);
                Color borderColor = Colors.white.withValues(alpha: 0.2);
                Color textColor = Colors.white;

                if (_showFeedback && isSelected) {
                  if (_isCorrect) {
                    backgroundColor = Colors.green.withValues(alpha: 0.3);
                    borderColor = Colors.green;
                  } else {
                    backgroundColor = Colors.red.withValues(alpha: 0.3);
                    borderColor = Colors.red;
                  }
                }

                if (_showFeedback && !_isCorrect && isCorrectOption) {
                  backgroundColor = Colors.green.withValues(alpha: 0.2);
                  borderColor = Colors.green.withValues(alpha: 0.5);
                }

                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: GestureDetector(
                    onTap: () => _onOptionTap(index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 18,
                      ),
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: borderColor,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            questionData.options[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                          if (_showFeedback && isSelected) ...[
                            const SizedBox(width: 12),
                            AnimatedBuilder(
                              animation: _scaleAnimation,
                              builder: (context, child) {
                                return Transform.scale(
                                  scale: _scaleAnimation.value,
                                  child: Icon(
                                    _isCorrect ? Icons.check_circle : Icons.cancel,
                                    color: _isCorrect ? Colors.green : Colors.red,
                                    size: 28,
                                  ),
                                );
                              },
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              }),

              const Spacer(),

              // Feedback text
              if (_showFeedback)
                AnimatedBuilder(
                  animation: _scaleAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Text(
                        _isCorrect ? '✅ Correct!' : '❌ Try again!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: _isCorrect ? Colors.green : Colors.red,
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
