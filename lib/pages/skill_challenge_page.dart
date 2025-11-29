import 'package:flutter/material.dart';

class SkillChallengePage extends StatefulWidget {
  const SkillChallengePage({super.key});

  @override
  State<SkillChallengePage> createState() => _SkillChallengePageState();
}

class _SkillChallengePageState extends State<SkillChallengePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentQuestion = 0;
  int _score = 0;
  int? _selectedAnswer;
  bool _answered = false;

  final List<ChallengeQuestion> _questions = [
    ChallengeQuestion(
      question: 'What does "Bull Market" mean?',
      options: [
        'Market prices are falling',
        'Market prices are rising',
        'Market is closed',
        'Market is volatile',
      ],
      correctIndex: 1,
      explanation: 'A bull market refers to a market condition where prices are rising or expected to rise.',
    ),
    ChallengeQuestion(
      question: 'What is diversification in investing?',
      options: [
        'Putting all money in one stock',
        'Only investing in bonds',
        'Spreading investments across different assets',
        'Investing only in your country',
      ],
      correctIndex: 2,
      explanation: 'Diversification means spreading your investments across various assets to reduce risk.',
    ),
    ChallengeQuestion(
      question: 'What does P/E ratio stand for?',
      options: [
        'Profit/Expense ratio',
        'Price/Earnings ratio',
        'Performance/Efficiency ratio',
        'Portfolio/Equity ratio',
      ],
      correctIndex: 1,
      explanation: 'P/E ratio (Price-to-Earnings) measures a company\'s share price relative to its earnings per share.',
    ),
    ChallengeQuestion(
      question: 'What is a dividend?',
      options: [
        'A type of stock',
        'A fee charged by brokers',
        'A portion of profit paid to shareholders',
        'A government tax on investments',
      ],
      correctIndex: 2,
      explanation: 'A dividend is a distribution of a company\'s profits to its shareholders.',
    ),
    ChallengeQuestion(
      question: 'What does ETF stand for?',
      options: [
        'Electronic Transfer Fund',
        'Exchange-Traded Fund',
        'Equity Trading Framework',
        'Estimated Total Funds',
      ],
      correctIndex: 1,
      explanation: 'ETF stands for Exchange-Traded Fund, a type of investment fund traded on stock exchanges.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    if (_answered) return;

    setState(() {
      _selectedAnswer = index;
      _answered = true;
      if (index == _questions[_currentQuestion].correctIndex) {
        _score += 20;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestion < _questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedAnswer = null;
        _answered = false;
      });
      _controller.reset();
      _controller.forward();
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      builder: (context) => _buildResultsSheet(),
    );
  }

  void _restartChallenge() {
    Navigator.pop(context);
    setState(() {
      _currentQuestion = 0;
      _score = 0;
      _selectedAnswer = null;
      _answered = false;
    });
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestion];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange.shade800,
              Colors.deepOrange.shade600,
              Colors.red.shade400,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 20),
                          const SizedBox(width: 8),
                          Text(
                            '$_score pts',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${_currentQuestion + 1}/${_questions.length}',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.8),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              // Progress bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  height: 6,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Row(
                    children: List.generate(_questions.length, (index) {
                      return Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: index < _questions.length - 1 ? 4 : 0),
                          decoration: BoxDecoration(
                            color: index <= _currentQuestion
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Question Card
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      final progress = Curves.easeOutCubic.transform(_controller.value);
                      return Opacity(
                        opacity: progress,
                        child: Transform.translate(
                          offset: Offset(0, 30 * (1 - progress)),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Question icon
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: Colors.orange.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.lightbulb_outline,
                              color: Colors.orange,
                              size: 28,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Question text
                          Text(
                            question.question,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Options
                          Expanded(
                            child: ListView.separated(
                              itemCount: question.options.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                return _buildOptionTile(
                                  index: index,
                                  text: question.options[index],
                                  isCorrect: index == question.correctIndex,
                                );
                              },
                            ),
                          ),

                          // Explanation (shown after answering)
                          if (_answered) ...[
                            const SizedBox(height: 16),
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.blue.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.blue.withValues(alpha: 0.3),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.info_outline, color: Colors.blue, size: 20),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      question.explanation,
                                      style: TextStyle(
                                        color: Colors.blue.shade800,
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Next button
              Padding(
                padding: const EdgeInsets.all(24),
                child: AnimatedOpacity(
                  opacity: _answered ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 300),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _answered ? _nextQuestion : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentQuestion < _questions.length - 1
                            ? 'Next Question'
                            : 'See Results',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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

  Widget _buildOptionTile({
    required int index,
    required String text,
    required bool isCorrect,
  }) {
    final isSelected = _selectedAnswer == index;
    Color backgroundColor;
    Color borderColor;
    Color textColor;
    IconData? trailingIcon;

    if (!_answered) {
      backgroundColor = Colors.grey.shade50;
      borderColor = Colors.grey.shade200;
      textColor = Colors.black87;
    } else if (isCorrect) {
      backgroundColor = Colors.green.withValues(alpha: 0.1);
      borderColor = Colors.green;
      textColor = Colors.green.shade800;
      trailingIcon = Icons.check_circle;
    } else if (isSelected && !isCorrect) {
      backgroundColor = Colors.red.withValues(alpha: 0.1);
      borderColor = Colors.red;
      textColor = Colors.red.shade800;
      trailingIcon = Icons.cancel;
    } else {
      backgroundColor = Colors.grey.shade50;
      borderColor = Colors.grey.shade200;
      textColor = Colors.grey;
    }

    return GestureDetector(
      onTap: () => _selectAnswer(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: _answered && isCorrect
                    ? Colors.green
                    : (_answered && isSelected && !isCorrect)
                        ? Colors.red
                        : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _answered && (isCorrect || (isSelected && !isCorrect))
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: textColor,
                  fontWeight: isSelected || (_answered && isCorrect)
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ),
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                color: isCorrect ? Colors.green : Colors.red,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsSheet() {
    final percentage = (_score / 100 * 100).round();
    String title;
    String subtitle;
    IconData icon;
    Color color;

    if (percentage >= 80) {
      title = 'Excellent!';
      subtitle = 'You\'re a trading expert!';
      icon = Icons.emoji_events;
      color = Colors.amber;
    } else if (percentage >= 60) {
      title = 'Good Job!';
      subtitle = 'You have solid knowledge!';
      icon = Icons.thumb_up;
      color = Colors.green;
    } else if (percentage >= 40) {
      title = 'Not Bad!';
      subtitle = 'Keep learning and improving!';
      icon = Icons.trending_up;
      color = Colors.blue;
    } else {
      title = 'Keep Learning!';
      subtitle = 'Practice makes perfect!';
      icon = Icons.school;
      color = Colors.orange;
    }

    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Trophy icon
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.elasticOut,
                    builder: (context, value, child) {
                      return Transform.scale(
                        scale: value,
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withValues(alpha: 0.1),
                          ),
                          child: Icon(icon, size: 60, color: color),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Score
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildScoreStat('Score', '$_score pts', Colors.deepPurple),
                        Container(width: 1, height: 40, color: Colors.grey.shade300),
                        _buildScoreStat('Correct', '${_score ~/ 20}/${_questions.length}', Colors.green),
                        Container(width: 1, height: 40, color: Colors.grey.shade300),
                        _buildScoreStat('Accuracy', '$percentage%', Colors.blue),
                      ],
                    ),
                  ),
                  const Spacer(),

                  // Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: _restartChallenge,
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Try Again'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.popUntil(context, (route) => route.isFirst);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Go Home',
                            style: TextStyle(color: Colors.white),
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

  Widget _buildScoreStat(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

class ChallengeQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  ChallengeQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}
