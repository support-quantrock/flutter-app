import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';

class InvestorResultsPage extends StatefulWidget {
  const InvestorResultsPage({super.key});

  @override
  State<InvestorResultsPage> createState() => _InvestorResultsPageState();
}

class _InvestorResultsPageState extends State<InvestorResultsPage>
    with TickerProviderStateMixin {
  late AnimationController _celebrationController;
  late AnimationController _contentController;
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _pulseAnimation;

  final List<_ConfettiParticle> _confetti = [];

  @override
  void initState() {
    super.initState();

    _celebrationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _contentController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _celebrationController,
        curve: Curves.elasticOut,
      ),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _pulseController,
        curve: Curves.easeInOut,
      ),
    );

    _generateConfetti();
    _celebrationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      _contentController.forward();
    });
  }

  void _generateConfetti() {
    final random = math.Random();
    for (int i = 0; i < 50; i++) {
      _confetti.add(_ConfettiParticle(
        color: [
          Colors.purple,
          Colors.blue,
          Colors.pink,
          Colors.orange,
          Colors.green,
          Colors.yellow,
        ][random.nextInt(6)],
        x: random.nextDouble(),
        delay: random.nextDouble() * 0.5,
        speed: 0.5 + random.nextDouble() * 0.5,
        size: 6 + random.nextDouble() * 6,
      ));
    }
  }

  @override
  void dispose() {
    _celebrationController.dispose();
    _contentController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  String _getInvestorType(QuestionnaireAnswers answers) {
    final risk = answers.riskTolerance;
    final goal = answers.investingGoal;

    if (risk == 'high' || answers.riskAttitude == 'seek_highest') {
      return 'Aggressive Growth Investor';
    } else if (risk == 'low' || answers.riskAttitude == 'prefer_safety') {
      return 'Conservative Investor';
    } else if (goal == 'income') {
      return 'Income-Focused Investor';
    } else {
      return 'Balanced Investor';
    }
  }

  Color _getInvestorColor(String type) {
    switch (type) {
      case 'Aggressive Growth Investor':
        return Colors.red;
      case 'Conservative Investor':
        return Colors.green;
      case 'Income-Focused Investor':
        return Colors.blue;
      default:
        return Colors.purple;
    }
  }

  IconData _getInvestorIcon(String type) {
    switch (type) {
      case 'Aggressive Growth Investor':
        return Icons.rocket_launch;
      case 'Conservative Investor':
        return Icons.shield;
      case 'Income-Focused Investor':
        return Icons.account_balance;
      default:
        return Icons.balance;
    }
  }

  int _calculateRiskScore(QuestionnaireAnswers answers) {
    int score = 50;

    if (answers.riskTolerance == 'high') score += 20;
    if (answers.riskTolerance == 'low') score -= 20;

    if (answers.portfolioDropResponse == 'buy_more') score += 15;
    if (answers.portfolioDropResponse == 'sell') score -= 15;

    if (answers.investmentTimeline == '>5y') score += 10;
    if (answers.investmentTimeline == '<3y') score -= 10;

    return score.clamp(0, 100);
  }

  @override
  Widget build(BuildContext context) {
    final answers = context.watch<QuestionnaireProvider>().answers;
    final investorType = _getInvestorType(answers);
    final investorColor = _getInvestorColor(investorType);
    final riskScore = _calculateRiskScore(answers);

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  investorColor.withValues(alpha: 0.1),
                  Colors.white,
                  investorColor.withValues(alpha: 0.05),
                ],
              ),
            ),
          ),

          // Confetti
          AnimatedBuilder(
            animation: _celebrationController,
            builder: (context, child) {
              return CustomPaint(
                size: Size.infinite,
                painter: _ConfettiPainter(
                  confetti: _confetti,
                  progress: _celebrationController.value,
                ),
              );
            },
          ),

          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Celebration badge
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  investorColor,
                                  investorColor.withValues(alpha: 0.7),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: investorColor.withValues(alpha: 0.4),
                                  blurRadius: 30,
                                  spreadRadius: 5,
                                ),
                              ],
                            ),
                            child: Icon(
                              _getInvestorIcon(investorType),
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Title
                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.0,
                    child: const Text(
                      'Profile Complete!',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.1,
                    child: Text(
                      'You are a',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),

                  const SizedBox(height: 8),

                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.15,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: investorColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: investorColor, width: 2),
                      ),
                      child: Text(
                        investorType,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: investorColor,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Risk meter
                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.2,
                    child: _RiskMeter(score: riskScore, color: investorColor),
                  ),

                  const SizedBox(height: 32),

                  // Stats grid
                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.3,
                    child: _buildStatsGrid(answers, investorColor),
                  ),

                  const SizedBox(height: 24),

                  // Detail cards
                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.4,
                    child: _buildDetailCard(
                      'Investment Goal',
                      _formatGoal(answers.investingGoal),
                      Icons.flag_rounded,
                      Colors.blue,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.5,
                    child: _buildDetailCard(
                      'Time Horizon',
                      _formatTimeline(answers.investmentTimeline),
                      Icons.schedule_rounded,
                      Colors.orange,
                    ),
                  ),

                  const SizedBox(height: 12),

                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.6,
                    child: _buildDetailCard(
                      'Demo Portfolio',
                      _formatPortfolio(answers.preferredPortfolioSize),
                      Icons.account_balance_wallet_rounded,
                      Colors.green,
                    ),
                  ),

                  const SizedBox(height: 12),

                  if (answers.industriesInterested.isNotEmpty)
                    _AnimatedSlideIn(
                      animation: _contentController,
                      delay: 0.7,
                      child: _buildIndustriesCard(answers.industriesInterested),
                    ),

                  const SizedBox(height: 32),

                  // CTA Button
                  _AnimatedSlideIn(
                    animation: _contentController,
                    delay: 0.8,
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [investorColor, investorColor.withValues(alpha: 0.8)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: investorColor.withValues(alpha: 0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/dashboard');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start Investing',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward_rounded, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(QuestionnaireAnswers answers, Color color) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.psychology_rounded,
            label: 'Knowledge',
            value: _formatKnowledge(answers.investmentKnowledge),
            color: Colors.purple,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.trending_up_rounded,
            label: 'Risk Level',
            value: _formatRisk(answers.riskTolerance),
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.savings_rounded,
            label: 'Saving',
            value: _formatSaving(answers.savingHabit),
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailCard(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right_rounded, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildIndustriesCard(List<String> industries) {
    final industryIcons = {
      'tech': '💻',
      'ev': '🚗',
      'energy': '⚡',
      'healthcare': '💊',
      'retail': '🛒',
      'crypto': '₿',
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.amber.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.category_rounded, color: Colors.amber, size: 24),
              ),
              const SizedBox(width: 16),
              const Text(
                'Interested Industries',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: industries.map((industry) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${industryIcons[industry] ?? '📊'} ${_formatIndustry(industry)}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _formatGoal(String? goal) {
    switch (goal) {
      case 'growth':
        return 'Capital Growth';
      case 'income':
        return 'Passive Income';
      case 'protection':
        return 'Capital Protection';
      default:
        return 'Not specified';
    }
  }

  String _formatTimeline(String? timeline) {
    switch (timeline) {
      case '<3y':
        return 'Short-term (< 3 years)';
      case '3-5y':
        return 'Medium-term (3-5 years)';
      case '>5y':
        return 'Long-term (5+ years)';
      default:
        return 'Not specified';
    }
  }

  String _formatPortfolio(String? size) {
    switch (size) {
      case '1k':
        return '\$1,000';
      case '10k':
        return '\$10,000';
      case '25k':
        return '\$25,000';
      case '50k':
        return '\$50,000';
      case '100k':
        return '\$100,000';
      default:
        return 'Not specified';
    }
  }

  String _formatKnowledge(String? knowledge) {
    switch (knowledge) {
      case 'nothing':
        return 'Beginner';
      case 'little':
        return 'Basic';
      case 'good':
        return 'Good';
      case 'expert':
        return 'Expert';
      default:
        return 'N/A';
    }
  }

  String _formatRisk(String? risk) {
    switch (risk) {
      case 'low':
        return 'Low';
      case 'medium':
        return 'Medium';
      case 'high':
        return 'High';
      default:
        return 'N/A';
    }
  }

  String _formatSaving(String? habit) {
    switch (habit) {
      case 'save_regularly':
        return 'Regular';
      case 'save_sometimes':
        return 'Sometimes';
      case 'want_but_cant':
        return 'Trying';
      case 'dont_save':
        return 'None';
      default:
        return 'N/A';
    }
  }

  String _formatIndustry(String industry) {
    switch (industry) {
      case 'tech':
        return 'Technology';
      case 'ev':
        return 'Electric Vehicles';
      case 'energy':
        return 'Energy';
      case 'healthcare':
        return 'Healthcare';
      case 'retail':
        return 'Retail';
      case 'crypto':
        return 'Crypto';
      default:
        return industry;
    }
  }
}

class _AnimatedSlideIn extends StatelessWidget {
  final Animation<double> animation;
  final double delay;
  final Widget child;

  const _AnimatedSlideIn({
    required this.animation,
    required this.delay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        final progress = ((animation.value - delay) / (1 - delay)).clamp(0.0, 1.0);
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

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

class _RiskMeter extends StatefulWidget {
  final int score;
  final Color color;

  const _RiskMeter({required this.score, required this.color});

  @override
  State<_RiskMeter> createState() => _RiskMeterState();
}

class _RiskMeterState extends State<_RiskMeter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: widget.score / 100).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Risk Profile',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return Text(
                    '${(_animation.value * 100).toInt()}%',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: widget.color,
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, _) {
              return Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: _animation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.green,
                          Colors.yellow,
                          Colors.orange,
                          Colors.red,
                        ],
                        stops: const [0.0, 0.33, 0.66, 1.0],
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Conservative', style: TextStyle(fontSize: 10, color: Colors.grey[500])),
              Text('Balanced', style: TextStyle(fontSize: 10, color: Colors.grey[500])),
              Text('Aggressive', style: TextStyle(fontSize: 10, color: Colors.grey[500])),
            ],
          ),
        ],
      ),
    );
  }
}

class _ConfettiParticle {
  final Color color;
  final double x;
  final double delay;
  final double speed;
  final double size;

  _ConfettiParticle({
    required this.color,
    required this.x,
    required this.delay,
    required this.speed,
    required this.size,
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
        ..color = particle.color.withValues(alpha: 1 - adjustedProgress)
        ..style = PaintingStyle.fill;

      final x = particle.x * size.width;
      final y = adjustedProgress * size.height * particle.speed;

      canvas.drawCircle(Offset(x, y), particle.size * (1 - adjustedProgress * 0.5), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ConfettiPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
