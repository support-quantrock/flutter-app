import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';

// Scoring Models
class ScoreResult {
  final int score;
  final int maxScore;
  final String label;
  final Color color;
  final String emoji;

  ScoreResult({
    required this.score,
    required this.maxScore,
    required this.label,
    required this.color,
    required this.emoji,
  });
}

class PortfolioSuggestion {
  final String size;
  final Color color;

  PortfolioSuggestion({required this.size, required this.color});
}

// Scoring Calculations
class InvestorScoring {
  static ScoreResult calculatePersonality(QuestionnaireAnswers answers) {
    int score = 0;

    // Portfolio drop response
    switch (answers.portfolioDropResponse) {
      case 'sell':
        score += 0;
        break;
      case 'reduce':
        score += 3;
        break;
      case 'nothing':
        score += 5;
        break;
      case 'buy_more':
        score += 10;
        break;
    }

    // Market fluctuation impact
    switch (answers.marketFluctuationImpact) {
      case 'worry_too_much':
        score += 0;
        break;
      case 'worry_sometimes':
        score += 5;
        break;
      case 'no_worry':
        score += 10;
        break;
    }

    // Risk tolerance
    switch (answers.riskTolerance) {
      case 'low':
        score += 0;
        break;
      case 'medium':
        score += 5;
        break;
      case 'high':
        score += 10;
        break;
    }

    // Risk attitude
    switch (answers.riskAttitude) {
      case 'prefer_safety':
        score += 0;
        break;
      case 'accept_moderate':
        score += 5;
        break;
      case 'seek_highest':
        score += 10;
        break;
    }

    String label;
    Color color;
    String emoji;

    if (score <= 10) {
      label = 'Conservative Investor';
      color = const Color(0xFF22C55E);
      emoji = '🏦';
    } else if (score <= 20) {
      label = 'Balanced Investor';
      color = const Color(0xFF3B82F6);
      emoji = '⚖️';
    } else if (score <= 30) {
      label = 'Growth Investor';
      color = const Color(0xFF8B5CF6);
      emoji = '🌱';
    } else {
      label = 'Aggressive Trader';
      color = const Color(0xFFEF4444);
      emoji = '⚡';
    }

    return ScoreResult(
      score: score,
      maxScore: 40,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  static ScoreResult calculateLiteracy(QuestionnaireAnswers answers) {
    int score = 0;

    // Investment knowledge (max 12)
    switch (answers.investmentKnowledge) {
      case 'nothing':
        score += 0;
        break;
      case 'little':
        score += 4;
        break;
      case 'good':
        score += 8;
        break;
      case 'expert':
        score += 12;
        break;
    }

    // Asset classes (max 10)
    final assetClasses = answers.assetClasses;
    if (!assetClasses.contains('none')) {
      score += math.min(assetClasses.length * 2, 10);
    }

    // Passive income knowledge (max 4)
    final passiveKnowledge = answers.passiveIncomeKnowledge ?? 5;
    score += (5 - passiveKnowledge).clamp(0, 4);

    // Investment readiness (max 4)
    final readiness = answers.investmentReadiness ?? 5;
    score += (5 - readiness).clamp(0, 4);

    String label;
    Color color;
    String emoji;

    if (score <= 10) {
      label = 'Beginner';
      color = const Color(0xFFF59E0B);
      emoji = '🌱';
    } else if (score <= 20) {
      label = 'Intermediate';
      color = const Color(0xFF3B82F6);
      emoji = '📚';
    } else {
      label = 'Advanced';
      color = const Color(0xFF22C55E);
      emoji = '🎓';
    }

    return ScoreResult(
      score: score,
      maxScore: 30,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  static ScoreResult calculateStrength(QuestionnaireAnswers answers) {
    int score = 0;

    // Monthly income (max 6)
    switch (answers.monthlyIncome) {
      case '<5k':
        score += 0;
        break;
      case '5k-10k':
        score += 2;
        break;
      case '10k-25k':
        score += 4;
        break;
      case '>25k':
        score += 6;
        break;
    }

    // Income stability (max 4)
    switch (answers.incomeStability) {
      case 'not_stable':
        score += 0;
        break;
      case 'stable':
        score += 2;
        break;
      case 'very_stable':
        score += 4;
        break;
    }

    // Debts (max 5)
    final debts = answers.currentDebts;
    if (debts.contains('no_debts')) {
      score += 5;
    } else if (debts.contains('credit_card')) {
      score += 0;
    } else if (debts.contains('student_loan') || debts.contains('auto_loan')) {
      score += 2;
    } else if (debts.contains('mortgage')) {
      score += 3;
    }

    String label;
    Color color;
    String emoji;

    if (score <= 5) {
      label = 'Weak';
      color = const Color(0xFFEF4444);
      emoji = '⚠️';
    } else if (score <= 10) {
      label = 'Moderate';
      color = const Color(0xFFF59E0B);
      emoji = '💪';
    } else {
      label = 'Strong';
      color = const Color(0xFF22C55E);
      emoji = '💎';
    }

    return ScoreResult(
      score: score,
      maxScore: 15,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  static ScoreResult calculateReadiness(QuestionnaireAnswers answers) {
    int score = 0;

    // Quantrock goal (max 4)
    switch (answers.quantrockGoal) {
      case 'challenge':
        score += 4;
        break;
      case 'prepare_trading':
        score += 3;
        break;
      case 'test_strategy':
        score += 2;
        break;
      case 'learn':
        score += 1;
        break;
    }

    // Preferred portfolio size (max 7)
    switch (answers.preferredPortfolioSize) {
      case '1k':
        score += 0;
        break;
      case '10k':
        score += 2;
        break;
      case '25k':
        score += 4;
        break;
      case '50k':
        score += 5;
        break;
      case '100k':
        score += 7;
        break;
    }

    // Investment readiness (max 4)
    final readiness = answers.investmentReadiness ?? 5;
    score += (5 - readiness).clamp(0, 4);

    String label;
    Color color;
    String emoji;

    if (score <= 5) {
      label = 'Needs Learning';
      color = const Color(0xFFF59E0B);
      emoji = '📚';
    } else if (score <= 10) {
      label = 'Investment Ready';
      color = const Color(0xFF3B82F6);
      emoji = '🎯';
    } else {
      label = 'Full Challenge Ready';
      color = const Color(0xFF22C55E);
      emoji = '🏆';
    }

    return ScoreResult(
      score: score,
      maxScore: 15,
      label: label,
      color: color,
      emoji: emoji,
    );
  }

  static PortfolioSuggestion getSuggestedPortfolio(
    ScoreResult strength,
    ScoreResult personality,
    ScoreResult readiness,
  ) {
    if (strength.label == 'Weak' || personality.label == 'Conservative Investor') {
      return PortfolioSuggestion(size: '\$1k – \$10k', color: const Color(0xFFF59E0B));
    } else if (strength.label == 'Moderate' || personality.label == 'Balanced Investor') {
      return PortfolioSuggestion(size: '\$10k – \$25k', color: const Color(0xFF3B82F6));
    } else if (strength.label == 'Strong' && personality.label == 'Growth Investor') {
      return PortfolioSuggestion(size: '\$25k – \$50k', color: const Color(0xFF8B5CF6));
    } else if (strength.label == 'Strong' &&
        personality.label == 'Aggressive Trader' &&
        readiness.label == 'Full Challenge Ready') {
      return PortfolioSuggestion(size: '\$50k – \$100k', color: const Color(0xFF22C55E));
    }
    return PortfolioSuggestion(size: '\$10k – \$25k', color: const Color(0xFF3B82F6));
  }
}

// Info Content
class InfoCategory {
  final String title;
  final List<InfoItem> items;

  InfoCategory({required this.title, required this.items});
}

class InfoItem {
  final String emoji;
  final String label;
  final Color color;
  final String description;

  InfoItem({
    required this.emoji,
    required this.label,
    required this.color,
    required this.description,
  });
}

final Map<String, InfoCategory> infoContent = {
  'personality': InfoCategory(
    title: 'Investment Personality Types',
    items: [
      InfoItem(
        emoji: '🏦',
        label: 'Conservative Investor',
        color: const Color(0xFF22C55E),
        description: 'Prefers stability and capital preservation over high returns. Avoids volatile investments.',
      ),
      InfoItem(
        emoji: '⚖️',
        label: 'Balanced Investor',
        color: const Color(0xFF3B82F6),
        description: 'Seeks a mix of growth and stability. Accepts moderate risk for better returns.',
      ),
      InfoItem(
        emoji: '🌱',
        label: 'Growth Investor',
        color: const Color(0xFF8B5CF6),
        description: 'Focuses on capital appreciation. Comfortable with market volatility for higher potential gains.',
      ),
      InfoItem(
        emoji: '⚡',
        label: 'Aggressive Trader',
        color: const Color(0xFFEF4444),
        description: 'Seeks maximum returns. Willing to take significant risks and actively trade positions.',
      ),
    ],
  ),
  'literacy': InfoCategory(
    title: 'Financial Literacy Levels',
    items: [
      InfoItem(
        emoji: '🌱',
        label: 'Beginner',
        color: const Color(0xFFF59E0B),
        description: 'New to investing. Learning the basics of financial markets and investment concepts.',
      ),
      InfoItem(
        emoji: '📚',
        label: 'Intermediate',
        color: const Color(0xFF3B82F6),
        description: 'Understands core investment principles. Familiar with different asset classes and strategies.',
      ),
      InfoItem(
        emoji: '🎓',
        label: 'Advanced',
        color: const Color(0xFF22C55E),
        description: 'Expert knowledge of markets. Can analyze investments and build diversified portfolios.',
      ),
    ],
  ),
  'strength': InfoCategory(
    title: 'Financial Strength Levels',
    items: [
      InfoItem(
        emoji: '⚠️',
        label: 'Weak',
        color: const Color(0xFFEF4444),
        description: 'Limited financial buffer. Should focus on building emergency savings before investing.',
      ),
      InfoItem(
        emoji: '💪',
        label: 'Moderate',
        color: const Color(0xFFF59E0B),
        description: 'Stable income with manageable debts. Can start investing with caution.',
      ),
      InfoItem(
        emoji: '💎',
        label: 'Strong',
        color: const Color(0xFF22C55E),
        description: 'Solid financial foundation. Well-positioned to invest and take calculated risks.',
      ),
    ],
  ),
  'readiness': InfoCategory(
    title: 'Challenge Readiness Levels',
    items: [
      InfoItem(
        emoji: '📚',
        label: 'Needs Learning',
        color: const Color(0xFFF59E0B),
        description: 'Should start with educational resources and small demo portfolios to build skills.',
      ),
      InfoItem(
        emoji: '🎯',
        label: 'Investment Ready',
        color: const Color(0xFF3B82F6),
        description: 'Has the knowledge and mindset to start investing with moderate portfolio sizes.',
      ),
      InfoItem(
        emoji: '🏆',
        label: 'Full Challenge Ready',
        color: const Color(0xFF22C55E),
        description: 'Prepared for advanced trading challenges with larger portfolio sizes.',
      ),
    ],
  ),
};

class InvestorResultsPage extends StatefulWidget {
  const InvestorResultsPage({super.key});

  @override
  State<InvestorResultsPage> createState() => _InvestorResultsPageState();
}

class _InvestorResultsPageState extends State<InvestorResultsPage>
    with TickerProviderStateMixin {
  late AnimationController _mainController;
  late AnimationController _pulseController;
  late AnimationController _confettiController;
  late Animation<double> _pulseAnimation;

  final List<_ConfettiParticle> _confetti = [];
  bool _showContent = false;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _confettiController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _generateConfetti();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) setState(() => _showContent = true);
    });
  }

  void _generateConfetti() {
    final random = math.Random();
    for (int i = 0; i < 60; i++) {
      _confetti.add(_ConfettiParticle(
        color: [
          const Color(0xFF8B5CF6),
          const Color(0xFF3B82F6),
          const Color(0xFF22C55E),
          const Color(0xFFF59E0B),
          const Color(0xFFEC4899),
          const Color(0xFF6366F1),
        ][random.nextInt(6)],
        x: random.nextDouble(),
        delay: random.nextDouble() * 0.5,
        speed: 0.3 + random.nextDouble() * 0.7,
        size: 4 + random.nextDouble() * 8,
        rotation: random.nextDouble() * math.pi * 2,
      ));
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    _pulseController.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  void _showInfoModal(String category) {
    final info = infoContent[category];
    if (info == null) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _InfoModal(category: info),
    );
  }

  @override
  Widget build(BuildContext context) {
    final answers = context.watch<QuestionnaireProvider>().answers;

    final personality = InvestorScoring.calculatePersonality(answers);
    final literacy = InvestorScoring.calculateLiteracy(answers);
    final strength = InvestorScoring.calculateStrength(answers);
    final readiness = InvestorScoring.calculateReadiness(answers);
    final portfolio = InvestorScoring.getSuggestedPortfolio(strength, personality, readiness);

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1A1A2E),
                  Color(0xFF16213E),
                  Color(0xFF0F3460),
                ],
              ),
            ),
          ),

          // Confetti
          AnimatedBuilder(
            animation: _confettiController,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: _ConfettiPainter(
                  confetti: _confetti,
                  progress: _confettiController.value,
                ),
              );
            },
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Column(
                children: [
                  // Header
                  _AnimatedSlideIn(
                    controller: _mainController,
                    delay: 0.0,
                    child: Column(
                      children: [
                        Text(
                          'Congratulations!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.purple.shade300,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Your Investor Profile',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Main Personality Card
                  _AnimatedSlideIn(
                    controller: _mainController,
                    delay: 0.1,
                    child: _MainPersonalityCard(
                      result: personality,
                      pulseAnimation: _pulseAnimation,
                      onInfoTap: () => _showInfoModal('personality'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Score Cards
                  if (_showContent) ...[
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.2,
                      child: _ScoreCard(
                        title: 'Financial Literacy (QLS)',
                        result: literacy,
                        onInfoTap: () => _showInfoModal('literacy'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.3,
                      child: _ScoreCard(
                        title: 'Financial Strength',
                        result: strength,
                        onInfoTap: () => _showInfoModal('strength'),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.4,
                      child: _ScoreCard(
                        title: 'Challenge Readiness',
                        result: readiness,
                        onInfoTap: () => _showInfoModal('readiness'),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Portfolio Suggestion
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.5,
                      child: _PortfolioCard(suggestion: portfolio),
                    ),

                    const SizedBox(height: 20),

                    // Action Buttons
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.6,
                      child: Row(
                        children: [
                          Expanded(
                            child: _ActionButton(
                              label: 'Share Results',
                              icon: Icons.share_rounded,
                              isPrimary: false,
                              onTap: () => _shareResults(personality, literacy, strength, readiness, portfolio),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _ActionButton(
                              label: 'Start Trading',
                              icon: Icons.arrow_forward_rounded,
                              isPrimary: true,
                              onTap: () => Navigator.pushReplacementNamed(context, '/dashboard'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Score Breakdown
                    _AnimatedSlideIn(
                      controller: _mainController,
                      delay: 0.7,
                      child: _ScoreBreakdown(
                        personality: personality,
                        literacy: literacy,
                        strength: strength,
                        readiness: readiness,
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _shareResults(
    ScoreResult personality,
    ScoreResult literacy,
    ScoreResult strength,
    ScoreResult readiness,
    PortfolioSuggestion portfolio,
  ) {
    final message = '''
🎯 My Quantrock Investor Profile

${personality.emoji} Investor Type: ${personality.label}
${literacy.emoji} Financial Literacy: ${literacy.label}
${strength.emoji} Financial Strength: ${strength.label}
${readiness.emoji} Challenge Readiness: ${readiness.label}

💼 Suggested Portfolio: ${portfolio.size}

Start your investment journey with Quantrock!
#Quantrock #Investing #Trading
''';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Share: $message'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

// Animated Slide In Widget
class _AnimatedSlideIn extends StatelessWidget {
  final AnimationController controller;
  final double delay;
  final Widget child;

  const _AnimatedSlideIn({
    required this.controller,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final progress = ((controller.value - delay) / (1 - delay)).clamp(0.0, 1.0);
        final curved = Curves.easeOutCubic.transform(progress);

        return Opacity(
          opacity: curved,
          child: Transform.translate(
            offset: Offset(0, 30 * (1 - curved)),
            child: child,
          ),
        );
      },
    );
  }
}

// Main Personality Card
class _MainPersonalityCard extends StatelessWidget {
  final ScoreResult result;
  final Animation<double> pulseAnimation;
  final VoidCallback onInfoTap;

  const _MainPersonalityCard({
    required this.result,
    required this.pulseAnimation,
    required this.onInfoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            result.color.withValues(alpha: 0.4),
            result.color.withValues(alpha: 0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          // Info Button
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: onInfoTap,
              child: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white.withValues(alpha: 0.7),
                  size: 20,
                ),
              ),
            ),
          ),

          Column(
            children: [
              // Animated Emoji
              AnimatedBuilder(
                animation: pulseAnimation,
                builder: (context, child) {
                  return Transform.scale(
                    scale: pulseAnimation.value,
                    child: Text(
                      result.emoji,
                      style: const TextStyle(fontSize: 64),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),

              // Label
              Text(
                result.label,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: result.color,
                ),
              ),
              const SizedBox(height: 8),

              // Score
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${result.score}',
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '/${result.maxScore}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              Text(
                'Investment Personality',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Score Card
class _ScoreCard extends StatefulWidget {
  final String title;
  final ScoreResult result;
  final VoidCallback onInfoTap;

  const _ScoreCard({
    required this.title,
    required this.result,
    required this.onInfoTap,
  });

  @override
  State<_ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<_ScoreCard> with SingleTickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(
      begin: 0,
      end: widget.result.score / widget.result.maxScore,
    ).animate(CurvedAnimation(
      parent: _progressController,
      curve: Curves.easeOutCubic,
    ));

    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _progressController.forward();
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Stack(
        children: [
          // Info Button
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: widget.onInfoTap,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.white.withValues(alpha: 0.5),
                  size: 16,
                ),
              ),
            ),
          ),

          Row(
            children: [
              // Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: widget.result.color.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(widget.result.emoji, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: 16),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withValues(alpha: 0.6),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.result.label,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: widget.result.color,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Progress Bar
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: AnimatedBuilder(
                              animation: _progressAnimation,
                              builder: (context, child) {
                                return FractionallySizedBox(
                                  alignment: Alignment.centerLeft,
                                  widthFactor: _progressAnimation.value,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: widget.result.color,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          '${widget.result.score}/${widget.result.maxScore}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: widget.result.color,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Portfolio Card
class _PortfolioCard extends StatelessWidget {
  final PortfolioSuggestion suggestion;

  const _PortfolioCard({required this.suggestion});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.emoji_events_rounded, color: Colors.white, size: 32),
              const SizedBox(width: 12),
              const Text(
                'Suggested Portfolio',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            suggestion.size,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Based on your profile, this portfolio size is recommended to start your investment journey.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.8),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

// Action Button
class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.isPrimary,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: isPrimary ? const Color(0xFF6366F1) : Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isPrimary) Icon(icon, color: const Color(0xFF6366F1), size: 20),
            if (!isPrimary) const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isPrimary ? Colors.white : const Color(0xFF6366F1),
              ),
            ),
            if (isPrimary) const SizedBox(width: 8),
            if (isPrimary) Icon(icon, color: Colors.white, size: 20),
          ],
        ),
      ),
    );
  }
}

// Score Breakdown
class _ScoreBreakdown extends StatelessWidget {
  final ScoreResult personality;
  final ScoreResult literacy;
  final ScoreResult strength;
  final ScoreResult readiness;

  const _ScoreBreakdown({
    required this.personality,
    required this.literacy,
    required this.strength,
    required this.readiness,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Score Breakdown',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          _buildBreakdownItem('Investment Personality', personality),
          _buildBreakdownItem('Financial Literacy (QLS)', literacy),
          _buildBreakdownItem('Financial Strength', strength),
          _buildBreakdownItem('Challenge Readiness', readiness, isLast: true),
        ],
      ),
    );
  }

  Widget _buildBreakdownItem(String label, ScoreResult result, {bool isLast = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          Text(
            '${result.score}/${result.maxScore} • ${result.label}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: result.color,
            ),
          ),
        ],
      ),
    );
  }
}

// Info Modal
class _InfoModal extends StatelessWidget {
  final InfoCategory category;

  const _InfoModal({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.7,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    category.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, color: Colors.grey.shade600, size: 24),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: category.items.length,
              itemBuilder: (context, index) {
                final item = category.items[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: item.color.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(item.emoji, style: const TextStyle(fontSize: 24)),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.label,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: item.color,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              item.description,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade600,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Confetti
class _ConfettiParticle {
  final Color color;
  final double x;
  final double delay;
  final double speed;
  final double size;
  final double rotation;

  _ConfettiParticle({
    required this.color,
    required this.x,
    required this.delay,
    required this.speed,
    required this.size,
    required this.rotation,
  });
}

class _ConfettiPainter extends CustomPainter {
  final List<_ConfettiParticle> confetti;
  final double progress;

  _ConfettiPainter({required this.confetti, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    for (final particle in confetti) {
      final adjustedProgress = ((progress - particle.delay) / (1 - particle.delay)).clamp(0.0, 1.0);
      if (adjustedProgress <= 0) continue;

      final paint = Paint()
        ..color = particle.color.withValues(alpha: (1 - adjustedProgress) * 0.8)
        ..style = PaintingStyle.fill;

      final x = particle.x * size.width;
      final y = adjustedProgress * size.height * particle.speed;
      final wobble = math.sin(adjustedProgress * math.pi * 4) * 20;

      canvas.save();
      canvas.translate(x + wobble, y);
      canvas.rotate(particle.rotation + adjustedProgress * math.pi * 2);

      final rect = RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset.zero, width: particle.size, height: particle.size * 0.6),
        const Radius.circular(2),
      );
      canvas.drawRRect(rect, paint);

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
