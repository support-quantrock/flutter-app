import 'package:flutter/material.dart';
import '../../models/lesson_models.dart';
import 'image_placeholder.dart';

class MissionScreen extends StatefulWidget {
  final LessonScreen screen;
  final VoidCallback onContinue;

  const MissionScreen({
    super.key,
    required this.screen,
    required this.onContinue,
  });

  @override
  State<MissionScreen> createState() => _MissionScreenState();
}

class _MissionScreenState extends State<MissionScreen>
    with SingleTickerProviderStateMixin {
  int? _selectedIndex;
  bool _submitted = false;
  bool _isCorrect = false;
  late AnimationController _feedbackController;

  @override
  void initState() {
    super.initState();
    _feedbackController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_selectedIndex == null || _submitted) return;

    final missionData = widget.screen.missionData;
    if (missionData == null) return;

    setState(() {
      _submitted = true;
      _isCorrect = _selectedIndex == missionData.correctIndex;
    });

    _feedbackController.forward();

    if (_isCorrect) {
      Future.delayed(const Duration(milliseconds: 1500), () {
        widget.onContinue();
      });
    } else {
      Future.delayed(const Duration(milliseconds: 1200), () {
        setState(() {
          _submitted = false;
          _selectedIndex = null;
        });
        _feedbackController.reset();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final missionData = widget.screen.missionData;
    if (missionData == null) {
      return const Center(child: Text('No mission data'));
    }

    final labels = ['A', 'B', 'C', 'D', 'E', 'F'];

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF2D1B69),
            Color(0xFF1A1A2E),
          ],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Mission header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF7C3AED), Color(0xFF6366F1)],
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF7C3AED).withValues(alpha: 0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('⭐', style: TextStyle(fontSize: 24)),
                    SizedBox(width: 12),
                    Text(
                      'Mission',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Image placeholder
              if (widget.screen.imagePrompt != null)
                ImagePlaceholder(
                  prompt: widget.screen.imagePrompt!,
                  imagePath: widget.screen.imagePath,
                  height: 140,
                  gradientColors: const [
                    Color(0xFF2D1B69),
                    Color(0xFF4C1D95),
                    Color(0xFF2D1B69),
                  ],
                ),

              const SizedBox(height: 24),

              // Mission text
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFF7C3AED).withValues(alpha: 0.3),
                  ),
                ),
                child: Text(
                  missionData.mission,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Options
              Expanded(
                child: ListView.builder(
                  itemCount: missionData.options.length,
                  itemBuilder: (context, index) {
                    final isSelected = _selectedIndex == index;
                    final isCorrectOption = index == missionData.correctIndex;

                    Color backgroundColor = Colors.white.withValues(alpha: 0.08);
                    Color borderColor = Colors.white.withValues(alpha: 0.15);
                    Color labelBg = const Color(0xFF7C3AED).withValues(alpha: 0.3);

                    if (isSelected && !_submitted) {
                      backgroundColor = const Color(0xFF7C3AED).withValues(alpha: 0.3);
                      borderColor = const Color(0xFF7C3AED);
                      labelBg = const Color(0xFF7C3AED);
                    }

                    if (_submitted && isSelected) {
                      if (_isCorrect) {
                        backgroundColor = Colors.green.withValues(alpha: 0.3);
                        borderColor = Colors.green;
                        labelBg = Colors.green;
                      } else {
                        backgroundColor = Colors.red.withValues(alpha: 0.3);
                        borderColor = Colors.red;
                        labelBg = Colors.red;
                      }
                    }

                    if (_submitted && !_isCorrect && isCorrectOption) {
                      borderColor = Colors.green.withValues(alpha: 0.5);
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: GestureDetector(
                        onTap: _submitted
                            ? null
                            : () => setState(() => _selectedIndex = index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: borderColor,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            children: [
                              // Label circle
                              Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: labelBg,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Text(
                                    labels[index],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              // Option text
                              Expanded(
                                child: Text(
                                  missionData.options[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    height: 1.3,
                                  ),
                                ),
                              ),
                              // Checkmark for selected
                              if (isSelected)
                                Icon(
                                  _submitted
                                      ? (_isCorrect
                                          ? Icons.check_circle
                                          : Icons.cancel)
                                      : Icons.radio_button_checked,
                                  color: _submitted
                                      ? (_isCorrect ? Colors.green : Colors.red)
                                      : const Color(0xFF7C3AED),
                                  size: 24,
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _selectedIndex != null && !_submitted
                      ? _onSubmit
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF7C3AED),
                    disabledBackgroundColor: Colors.grey.withValues(alpha: 0.3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                  ),
                  child: Text(
                    _submitted
                        ? (_isCorrect ? '✅ Correct!' : '❌ Try again')
                        : 'Submit Answer',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
