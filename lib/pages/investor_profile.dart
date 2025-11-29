import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';
import '../components/questionnaire/single_choice_card.dart';
import '../components/questionnaire/single_choice_grid.dart';
import '../components/questionnaire/multi_select_chips.dart';
import '../components/questionnaire/rating_scale.dart';

const int totalQuestions = 25;

// Question categories for milestone rewards
enum QuestionCategory { profile, financial, experience, risk, goals }

class QuestionData {
  final String title;
  final QuestionCategory category;
  final int xpReward;

  const QuestionData({
    required this.title,
    required this.category,
    this.xpReward = 40,
  });
}

final Map<int, QuestionData> questionMetadata = {
  1: const QuestionData(title: 'Gender', category: QuestionCategory.profile),
  2: const QuestionData(title: 'Age', category: QuestionCategory.profile),
  3: const QuestionData(title: 'Education', category: QuestionCategory.profile),
  4: const QuestionData(title: 'Income', category: QuestionCategory.financial, xpReward: 50),
  5: const QuestionData(title: 'Stability', category: QuestionCategory.financial, xpReward: 50),
  6: const QuestionData(title: 'Source', category: QuestionCategory.financial, xpReward: 50),
  7: const QuestionData(title: 'Debts', category: QuestionCategory.financial, xpReward: 60),
  8: const QuestionData(title: 'Account', category: QuestionCategory.experience),
  9: const QuestionData(title: 'Portfolio', category: QuestionCategory.experience, xpReward: 50),
  10: const QuestionData(title: 'Knowledge', category: QuestionCategory.experience, xpReward: 50),
  11: const QuestionData(title: 'Assets', category: QuestionCategory.experience, xpReward: 60),
  12: const QuestionData(title: 'Goal', category: QuestionCategory.goals, xpReward: 50),
  13: const QuestionData(title: 'Timeline', category: QuestionCategory.goals, xpReward: 50),
  14: const QuestionData(title: 'Drop Response', category: QuestionCategory.risk, xpReward: 60),
  15: const QuestionData(title: 'Fluctuations', category: QuestionCategory.risk, xpReward: 60),
  16: const QuestionData(title: 'Risk Level', category: QuestionCategory.risk, xpReward: 60),
  17: const QuestionData(title: 'Risk Attitude', category: QuestionCategory.risk, xpReward: 60),
  18: const QuestionData(title: 'Stress', category: QuestionCategory.risk, xpReward: 50),
  19: const QuestionData(title: 'Retirement', category: QuestionCategory.goals, xpReward: 50),
  20: const QuestionData(title: 'Saving', category: QuestionCategory.financial, xpReward: 50),
  21: const QuestionData(title: 'Industries', category: QuestionCategory.goals, xpReward: 60),
  22: const QuestionData(title: 'Quantrock Goal', category: QuestionCategory.goals, xpReward: 50),
  23: const QuestionData(title: 'Portfolio Size', category: QuestionCategory.goals, xpReward: 50),
  24: const QuestionData(title: 'Readiness', category: QuestionCategory.experience, xpReward: 70),
  25: const QuestionData(title: 'Passive Income', category: QuestionCategory.experience, xpReward: 80),
};

class InvestorProfilePage extends StatefulWidget {
  final String? symbol;
  final String? name;

  const InvestorProfilePage({
    super.key,
    this.symbol,
    this.name,
  });

  @override
  State<InvestorProfilePage> createState() => _InvestorProfilePageState();
}

class _InvestorProfilePageState extends State<InvestorProfilePage>
    with TickerProviderStateMixin {
  int _step = 1;
  bool _goingForward = true;
  int _totalXP = 0;
  int _currentLevel = 1;
  bool _showXPGain = false;
  int _lastXPGain = 0;
  bool _showLevelUp = false;
  bool _showMilestone = false;
  String _milestoneTitle = '';

  List<String> _selectedDebts = [];
  List<String> _selectedAssets = [];
  List<String> _selectedIndustries = [];

  late AnimationController _xpAnimationController;
  late AnimationController _pulseController;
  late AnimationController _particleController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _xpAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.08).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _particleController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<QuestionnaireProvider>();
      _selectedDebts = List.from(provider.answers.currentDebts);
      _selectedAssets = List.from(provider.answers.assetClasses);
      _selectedIndustries = List.from(provider.answers.industriesInterested);

      if (widget.symbol != null && widget.name != null) {
        provider.setAnswer('selectedAsset', {
          'symbol': widget.symbol,
          'name': widget.name,
        });
      }
    });
  }

  @override
  void dispose() {
    _xpAnimationController.dispose();
    _pulseController.dispose();
    _particleController.dispose();
    super.dispose();
  }

  int _calculateLevel(int xp) {
    return (xp / 200).floor() + 1;
  }

  String _getLevelTitle(int level) {
    if (level <= 2) return 'Novice Investor';
    if (level <= 4) return 'Rising Trader';
    if (level <= 6) return 'Market Explorer';
    if (level <= 8) return 'Portfolio Builder';
    return 'Investment Master';
  }

  void _awardXP(int xp) {
    final newXP = _totalXP + xp;
    final newLevel = _calculateLevel(newXP);

    setState(() {
      _lastXPGain = xp;
      _showXPGain = true;
      _totalXP = newXP;

      if (newLevel > _currentLevel) {
        _currentLevel = newLevel;
        _showLevelUp = true;
      }
    });

    _xpAnimationController.forward(from: 0);
    _checkMilestones();

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _showXPGain = false;
          _showLevelUp = false;
        });
      }
    });
  }

  void _checkMilestones() {
    if (_step == 5) {
      _showMilestonePopup('Profile Complete!', 'You\'ve shared your basics');
    } else if (_step == 10) {
      _showMilestonePopup('Halfway Hero!', '50% complete - keep going!');
    } else if (_step == 15) {
      _showMilestonePopup('Risk Master!', 'Risk assessment unlocked');
    } else if (_step == 20) {
      _showMilestonePopup('Almost There!', 'Final stretch - you got this!');
    }
  }

  void _showMilestonePopup(String title, String subtitle) {
    setState(() {
      _milestoneTitle = title;
      _showMilestone = true;
    });
    _particleController.forward(from: 0);

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        setState(() => _showMilestone = false);
      }
    });
  }

  void _handleBack() {
    if (_step > 1) {
      setState(() {
        _goingForward = false;
        _step--;
      });
    }
  }

  void _handleSkip() {
    Navigator.of(context).pushReplacementNamed('/dashboard');
  }

  void _handleNext() {
    if (_step < totalQuestions) {
      final xpReward = questionMetadata[_step]?.xpReward ?? 40;
      _awardXP(xpReward);

      setState(() {
        _goingForward = true;
        _step++;
      });
    } else {
      _awardXP(100);
      final provider = context.read<QuestionnaireProvider>();
      provider.setAnswer('completedAt', DateTime.now().toIso8601String());

      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/investor-results');
        }
      });
    }
  }

  void _handleSingleSelect(String key, String value) {
    context.read<QuestionnaireProvider>().setAnswer(key, value);
    Future.delayed(const Duration(milliseconds: 300), _handleNext);
  }

  void _toggleDebt(String value) {
    setState(() {
      if (_selectedDebts.contains(value)) {
        _selectedDebts.remove(value);
      } else {
        _selectedDebts.add(value);
      }
    });
    context.read<QuestionnaireProvider>().setAnswer('currentDebts', _selectedDebts);
  }

  void _toggleAsset(String value) {
    setState(() {
      if (_selectedAssets.contains(value)) {
        _selectedAssets.remove(value);
      } else {
        _selectedAssets.add(value);
      }
    });
    context.read<QuestionnaireProvider>().setAnswer('assetClasses', _selectedAssets);
  }

  void _toggleIndustry(String value) {
    setState(() {
      if (_selectedIndustries.contains(value)) {
        _selectedIndustries.remove(value);
      } else {
        _selectedIndustries.add(value);
      }
    });
    context.read<QuestionnaireProvider>().setAnswer('industriesInterested', _selectedIndustries);
  }

  Widget _buildQuestion(QuestionnaireAnswers answers) {
    switch (_step) {
      case 1:
        return SingleChoiceGrid(
          title: 'What is your gender?',
          options: const [
            ChoiceOption(label: 'Male', value: 'male', icon: '👨'),
            ChoiceOption(label: 'Female', value: 'female', icon: '👩'),
          ],
          selectedValue: answers.gender,
          onSelect: (v) => _handleSingleSelect('gender', v),
        );

      case 2:
        return SingleChoiceCard(
          title: 'What is your age?',
          options: const [
            ChoiceOption(label: 'Under 30', value: '<30', icon: '🧑'),
            ChoiceOption(label: '30 - 39', value: '30-39', icon: '👨'),
            ChoiceOption(label: '40 - 49', value: '40-49', icon: '👨‍💼'),
            ChoiceOption(label: '50 - 59', value: '50-59', icon: '👴'),
            ChoiceOption(label: '60+', value: '60+', icon: '🧓'),
          ],
          selectedValue: answers.ageRange,
          onSelect: (v) => _handleSingleSelect('ageRange', v),
        );

      case 3:
        return SingleChoiceCard(
          title: 'What is your education level?',
          options: const [
            ChoiceOption(label: 'High school or below', value: 'high_school', icon: '📚'),
            ChoiceOption(label: 'University degree', value: 'university', icon: '🎓'),
            ChoiceOption(label: 'Postgraduate studies', value: 'postgraduate', icon: '🎯'),
          ],
          selectedValue: answers.educationLevel,
          onSelect: (v) => _handleSingleSelect('educationLevel', v),
        );

      case 4:
        return SingleChoiceCard(
          title: 'What is your monthly income?',
          options: const [
            ChoiceOption(label: 'Less than \$5,000', value: '<5k', icon: '💵'),
            ChoiceOption(label: '\$5,000 – \$10,000', value: '5k-10k', icon: '💰'),
            ChoiceOption(label: '\$10,000 – \$25,000', value: '10k-25k', icon: '💎'),
            ChoiceOption(label: 'More than \$25,000', value: '>25k', icon: '🏆'),
          ],
          selectedValue: answers.monthlyIncome,
          onSelect: (v) => _handleSingleSelect('monthlyIncome', v),
        );

      case 5:
        return SingleChoiceCard(
          title: 'How stable is your income?',
          options: const [
            ChoiceOption(label: 'Not stable', value: 'not_stable', icon: '🔴'),
            ChoiceOption(label: 'Stable', value: 'stable', icon: '🟡'),
            ChoiceOption(label: 'Very stable', value: 'very_stable', icon: '🟢'),
          ],
          selectedValue: answers.incomeStability,
          onSelect: (v) => _handleSingleSelect('incomeStability', v),
        );

      case 6:
        return SingleChoiceGrid(
          title: 'What is your current income source?',
          options: const [
            ChoiceOption(label: 'Employee', value: 'employee', icon: '💼'),
            ChoiceOption(label: 'Business Owner', value: 'business_owner', icon: '🏢'),
            ChoiceOption(label: 'Retired', value: 'retired', icon: '🌴'),
            ChoiceOption(label: 'Student', value: 'student', icon: '🎓'),
          ],
          selectedValue: answers.incomeSource,
          onSelect: (v) => _handleSingleSelect('incomeSource', v),
        );

      case 7:
        return MultiSelectChips(
          title: 'Do you currently have any debts?',
          options: const [
            ChoiceOption(label: 'Mortgage', value: 'mortgage', icon: '🏠'),
            ChoiceOption(label: 'Auto loan', value: 'auto_loan', icon: '🚗'),
            ChoiceOption(label: 'Student loan', value: 'student_loan', icon: '🎓'),
            ChoiceOption(label: 'Credit card debt', value: 'credit_card', icon: '💳'),
            ChoiceOption(label: 'No debts', value: 'no_debts', icon: '✅'),
          ],
          selectedValues: _selectedDebts,
          onToggle: _toggleDebt,
          onContinue: _handleNext,
        );

      case 8:
        return SingleChoiceCard(
          title: 'Do you have an investment account?',
          options: const [
            ChoiceOption(label: 'Yes', value: 'yes', icon: '✅'),
            ChoiceOption(label: 'No', value: 'no', icon: '❌'),
            ChoiceOption(label: 'Planning to open one soon', value: 'planning', icon: '📋'),
          ],
          selectedValue: answers.hasInvestmentAccount,
          onSelect: (v) => _handleSingleSelect('hasInvestmentAccount', v),
        );

      case 9:
        return SingleChoiceCard(
          title: 'What is the size of your current investment portfolio?',
          options: const [
            ChoiceOption(label: 'Less than \$10,000', value: '<10k', icon: '🪙'),
            ChoiceOption(label: '\$10,000 – \$25,000', value: '10k-25k', icon: '💰'),
            ChoiceOption(label: '\$25,000 – \$100,000', value: '25k-100k', icon: '💎'),
            ChoiceOption(label: '\$100,000 – \$1M', value: '100k-1m', icon: '🏆'),
            ChoiceOption(label: 'More than \$1M', value: '>1m', icon: '👑'),
          ],
          selectedValue: answers.portfolioSize,
          onSelect: (v) => _handleSingleSelect('portfolioSize', v),
        );

      case 10:
        return SingleChoiceCard(
          title: 'How much do you know about investing?',
          options: const [
            ChoiceOption(label: 'Nothing at all', value: 'nothing', icon: '🌱'),
            ChoiceOption(label: 'A little knowledge', value: 'little', icon: '📖'),
            ChoiceOption(label: 'Good knowledge', value: 'good', icon: '🧠'),
            ChoiceOption(label: 'Expert level', value: 'expert', icon: '🎯'),
          ],
          selectedValue: answers.investmentKnowledge,
          onSelect: (v) => _handleSingleSelect('investmentKnowledge', v),
        );

      case 11:
        return MultiSelectChips(
          title: 'Which asset classes have you invested in before?',
          options: const [
            ChoiceOption(label: 'Stocks', value: 'stocks', icon: '📈'),
            ChoiceOption(label: 'ETFs', value: 'etfs', icon: '📊'),
            ChoiceOption(label: 'Crypto', value: 'crypto', icon: '₿'),
            ChoiceOption(label: 'Bonds', value: 'bonds', icon: '📜'),
            ChoiceOption(label: 'Real Estate', value: 'real_estate', icon: '🏢'),
            ChoiceOption(label: 'None', value: 'none', icon: '🚫'),
          ],
          selectedValues: _selectedAssets,
          onToggle: _toggleAsset,
          onContinue: _handleNext,
        );

      case 12:
        return SingleChoiceGrid(
          title: 'What is your main goal from investing?',
          options: const [
            ChoiceOption(label: 'Capital growth', value: 'growth', icon: '📈'),
            ChoiceOption(label: 'Extra income', value: 'income', icon: '💰'),
            ChoiceOption(label: 'Capital protection', value: 'protection', icon: '🛡️'),
          ],
          selectedValue: answers.investingGoal,
          onSelect: (v) => _handleSingleSelect('investingGoal', v),
          columns: 3,
        );

      case 13:
        return SingleChoiceCard(
          title: 'When will you need the invested money?',
          options: const [
            ChoiceOption(label: 'Less than 3 years', value: '<3y', icon: '⏰'),
            ChoiceOption(label: '3 – 5 years', value: '3-5y', icon: '📅'),
            ChoiceOption(label: 'More than 5 years', value: '>5y', icon: '🗓️'),
          ],
          selectedValue: answers.investmentTimeline,
          onSelect: (v) => _handleSingleSelect('investmentTimeline', v),
        );

      case 14:
        return SingleChoiceGrid(
          title: 'If your portfolio dropped 20%, what would you do?',
          options: const [
            ChoiceOption(label: 'Sell immediately', value: 'sell', icon: '😰'),
            ChoiceOption(label: 'Reduce and wait', value: 'reduce', icon: '😐'),
            ChoiceOption(label: 'Do nothing', value: 'nothing', icon: '😎'),
            ChoiceOption(label: 'Buy more', value: 'buy_more', icon: '💪'),
          ],
          selectedValue: answers.portfolioDropResponse,
          onSelect: (v) => _handleSingleSelect('portfolioDropResponse', v),
        );

      case 15:
        return SingleChoiceCard(
          title: 'How do market fluctuations affect you?',
          options: const [
            ChoiceOption(label: 'I worry too much', value: 'worry_too_much', icon: '😟'),
            ChoiceOption(label: 'I worry sometimes', value: 'worry_sometimes', icon: '😐'),
            ChoiceOption(label: "I don't worry at all", value: 'no_worry', icon: '😌'),
          ],
          selectedValue: answers.marketFluctuationImpact,
          onSelect: (v) => _handleSingleSelect('marketFluctuationImpact', v),
        );

      case 16:
        return SingleChoiceCard(
          title: 'What is your risk tolerance?',
          options: const [
            ChoiceOption(label: 'Low', value: 'low', icon: '🟢'),
            ChoiceOption(label: 'Medium', value: 'medium', icon: '🟡'),
            ChoiceOption(label: 'High', value: 'high', icon: '🔴'),
          ],
          selectedValue: answers.riskTolerance,
          onSelect: (v) => _handleSingleSelect('riskTolerance', v),
        );

      case 17:
        return SingleChoiceCard(
          title: 'What is your attitude towards investment risk?',
          options: const [
            ChoiceOption(label: 'Seek highest returns even with high risk', value: 'seek_highest', icon: '🚀'),
            ChoiceOption(label: 'Accept moderate risk for better returns', value: 'accept_moderate', icon: '⚖️'),
            ChoiceOption(label: 'Prefer safety even with lower returns', value: 'prefer_safety', icon: '🛡️'),
          ],
          selectedValue: answers.riskAttitude,
          onSelect: (v) => _handleSingleSelect('riskAttitude', v),
        );

      case 18:
        return SingleChoiceGrid(
          title: 'How often do you feel stressed about your financial situation?',
          options: const [
            ChoiceOption(label: 'Most of the time', value: 'most_time', icon: '🤕'),
            ChoiceOption(label: 'Always', value: 'always', icon: '😫'),
            ChoiceOption(label: 'Rarely', value: 'rarely', icon: '😌'),
            ChoiceOption(label: 'Sometimes', value: 'sometimes', icon: '😐'),
          ],
          selectedValue: answers.financialStressFrequency,
          onSelect: (v) => _handleSingleSelect('financialStressFrequency', v),
        );

      case 19:
        return SingleChoiceCard(
          title: 'Do you plan for your retirement?',
          options: const [
            ChoiceOption(label: 'Not yet, but I want to', value: 'not_yet', icon: '🤔'),
            ChoiceOption(label: 'I save regularly for retirement', value: 'save_regularly', icon: '🐷'),
            ChoiceOption(label: 'Relying on pension fund', value: 'rely_pension', icon: '🏦'),
          ],
          selectedValue: answers.retirementPlanning,
          onSelect: (v) => _handleSingleSelect('retirementPlanning', v),
        );

      case 20:
        return SingleChoiceGrid(
          title: 'Do you have a habit of saving money?',
          options: const [
            ChoiceOption(label: "I want to save but I can't", value: 'want_but_cant', icon: '😔'),
            ChoiceOption(label: "I don't save", value: 'dont_save', icon: '🙈'),
            ChoiceOption(label: 'I save regularly', value: 'save_regularly', icon: '💪'),
            ChoiceOption(label: 'I save sometimes', value: 'save_sometimes', icon: '🤷'),
          ],
          selectedValue: answers.savingHabit,
          onSelect: (v) => _handleSingleSelect('savingHabit', v),
        );

      case 21:
        return MultiSelectChips(
          title: 'Choose the industries you are interested in',
          options: const [
            ChoiceOption(label: 'Tech (Apple, Microsoft, Google)', value: 'tech', icon: '💻'),
            ChoiceOption(label: 'Electric Vehicles (Tesla)', value: 'ev', icon: '🚗'),
            ChoiceOption(label: 'Energy (Shell, Exxon)', value: 'energy', icon: '⚡'),
            ChoiceOption(label: 'Healthcare (Pfizer)', value: 'healthcare', icon: '💊'),
            ChoiceOption(label: "Retail (Amazon, McDonald's)", value: 'retail', icon: '🛒'),
            ChoiceOption(label: 'Crypto (Bitcoin)', value: 'crypto', icon: '₿'),
          ],
          selectedValues: _selectedIndustries,
          onToggle: _toggleIndustry,
          onContinue: _handleNext,
        );

      case 22:
        return SingleChoiceGrid(
          title: 'What is your main goal in trying Quantrock?',
          options: const [
            ChoiceOption(label: 'Join the challenge', value: 'challenge', icon: '🏆'),
            ChoiceOption(label: 'Prepare for real trading', value: 'prepare_trading', icon: '📊'),
            ChoiceOption(label: 'Test my own strategy', value: 'test_strategy', icon: '🎯'),
            ChoiceOption(label: 'Learn and build skills', value: 'learn', icon: '📚'),
          ],
          selectedValue: answers.quantrockGoal,
          onSelect: (v) => _handleSingleSelect('quantrockGoal', v),
        );

      case 23:
        return SingleChoiceCard(
          title: 'What is your preferred demo portfolio size?',
          subtitle: 'We recommend choosing a trial amount close to what you plan to invest later',
          options: const [
            ChoiceOption(label: '\$1,000', value: '1k', icon: '💵'),
            ChoiceOption(label: '\$10,000', value: '10k', icon: '💰'),
            ChoiceOption(label: '\$25,000', value: '25k', icon: '💎'),
            ChoiceOption(label: '\$50,000', value: '50k', icon: '🏆'),
            ChoiceOption(label: '\$100,000', value: '100k', icon: '👑'),
          ],
          selectedValue: answers.preferredPortfolioSize,
          onSelect: (v) => _handleSingleSelect('preferredPortfolioSize', v),
        );

      case 24:
        return RatingScale(
          title: 'Rate your readiness to invest',
          leftLabel: 'Totally prepared',
          rightLabel: 'I need more information',
          selectedValue: answers.investmentReadiness,
          onSelect: (v) {
            context.read<QuestionnaireProvider>().setAnswer('investmentReadiness', v);
          },
          onContinue: _handleNext,
        );

      case 25:
        return RatingScale(
          title: 'Rate your knowledge about passive income',
          leftLabel: 'Totally prepared',
          rightLabel: 'I need more information',
          selectedValue: answers.passiveIncomeKnowledge,
          onSelect: (v) {
            context.read<QuestionnaireProvider>().setAnswer('passiveIncomeKnowledge', v);
          },
          onContinue: _handleNext,
        );

      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    final xpForCurrentLevel = (_currentLevel - 1) * 200;
    final xpForNextLevel = _currentLevel * 200;
    final xpProgress = (_totalXP - xpForCurrentLevel) / (xpForNextLevel - xpForCurrentLevel);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Background particles
            ...List.generate(20, (index) => _buildBackgroundParticle(index)),

            // Main content
            Consumer<QuestionnaireProvider>(
              builder: (context, provider, child) {
                return Column(
                  children: [
                    // Game Header with XP and Level
                    _buildGameHeader(xpProgress),

                    // Progress Quest Bar
                    _buildQuestProgress(),

                    // Question Content
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: Offset(_goingForward ? 1.0 : -1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                        child: KeyedSubtree(
                          key: ValueKey(_step),
                          child: _buildQuestion(provider.answers),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),

            // XP Gain Popup
            if (_showXPGain) _buildXPGainPopup(),

            // Level Up Popup
            if (_showLevelUp) _buildLevelUpPopup(),

            // Milestone Popup
            if (_showMilestone) _buildMilestonePopup(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundParticle(int index) {
    final random = Random(index);
    final size = 2.0 + random.nextDouble() * 4;
    final left = random.nextDouble() * MediaQuery.of(context).size.width;
    final top = random.nextDouble() * MediaQuery.of(context).size.height;
    final opacity = 0.1 + random.nextDouble() * 0.3;

    return Positioned(
      left: left,
      top: top,
      child: AnimatedBuilder(
        animation: _pulseController,
        builder: (context, child) {
          return Opacity(
            opacity: opacity * (0.5 + _pulseAnimation.value * 0.5),
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
          );
        },
      ),
    );
  }

  Widget _buildGameHeader(double xpProgress) {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                // Back button
                if (_step > 1)
                  GestureDetector(
                    onTap: _handleBack,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white70,
                        size: 18,
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 40),

                const SizedBox(width: 12),

                // Level Badge
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _showLevelUp ? _pulseAnimation.value : 1.0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.amber, Colors.orange.shade700],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.amber.withValues(alpha: 0.4),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'LVL $_currentLevel',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(width: 12),

                // XP Bar
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getLevelTitle(_currentLevel),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 10,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Stack(
                        children: [
                          Container(
                            height: 8,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 8,
                            width: (MediaQuery.of(context).size.width - 200) *
                                xpProgress.clamp(0.0, 1.0),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Colors.amber, Colors.orange],
                              ),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.amber.withValues(alpha: 0.5),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${_totalXP % 200} / 200 XP',
                        style: TextStyle(
                          color: Colors.amber.withValues(alpha: 0.8),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 12),

                // Total XP Display
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.bolt,
                        color: Colors.amber,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '$_totalXP',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestProgress() {
    final progress = _step / totalQuestions;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.map,
                    color: Colors.cyan,
                    size: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Quest Progress',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.8),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                '$_step / $totalQuestions',
                style: const TextStyle(
                  color: Colors.cyan,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Stack(
            children: [
              Container(
                height: 12,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutCubic,
                height: 12,
                width: (MediaQuery.of(context).size.width - 48) * progress,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.cyan, Colors.blue, Colors.purple],
                  ),
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan.withValues(alpha: 0.5),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
              // Milestone markers
              ...List.generate(4, (index) {
                final position = (index + 1) * 0.2;
                final isReached = progress >= position;
                return Positioned(
                  left: (MediaQuery.of(context).size.width - 48) * position - 8,
                  top: -2,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isReached ? Colors.amber : Colors.grey.shade700,
                      border: Border.all(
                        color: isReached ? Colors.amber : Colors.grey,
                        width: 2,
                      ),
                      boxShadow: isReached
                          ? [
                              BoxShadow(
                                color: Colors.amber.withValues(alpha: 0.5),
                                blurRadius: 6,
                              ),
                            ]
                          : null,
                    ),
                    child: isReached
                        ? const Icon(
                            Icons.star,
                            size: 10,
                            color: Colors.white,
                          )
                        : null,
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildXPGainPopup() {
    return AnimatedBuilder(
      animation: _xpAnimationController,
      builder: (context, child) {
        final progress = Curves.easeOutBack.transform(_xpAnimationController.value);
        return Positioned(
          top: 100,
          left: 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: (1 - _xpAnimationController.value * 0.5).clamp(0.0, 1.0),
              child: Transform.translate(
                offset: Offset(0, -50 * progress),
                child: Transform.scale(
                  scale: 0.5 + progress * 0.5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.amber, Colors.orange],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.amber.withValues(alpha: 0.6),
                          blurRadius: 20,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.bolt,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '+$_lastXPGain XP',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLevelUpPopup() {
    return AnimatedBuilder(
      animation: _xpAnimationController,
      builder: (context, child) {
        final progress = Curves.elasticOut.transform(
          (_xpAnimationController.value * 2).clamp(0.0, 1.0),
        );
        return Positioned.fill(
          child: Container(
            color: Colors.black.withValues(alpha: 0.5 * progress),
            child: Center(
              child: Transform.scale(
                scale: progress,
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.amber.shade700,
                        Colors.orange.shade800,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.amber.withValues(alpha: 0.6),
                        blurRadius: 30,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.emoji_events,
                        color: Colors.white,
                        size: 64,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'LEVEL UP!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Level $_currentLevel',
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _getLevelTitle(_currentLevel),
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.8),
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMilestonePopup() {
    return AnimatedBuilder(
      animation: _particleController,
      builder: (context, child) {
        final progress = Curves.easeOutBack.transform(
          (_particleController.value * 2).clamp(0.0, 1.0),
        );
        final fadeOut = _particleController.value > 0.7
            ? (1 - (_particleController.value - 0.7) / 0.3)
            : 1.0;

        return Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 0,
          right: 0,
          child: Center(
            child: Opacity(
              opacity: fadeOut,
              child: Transform.scale(
                scale: progress,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 24,
                  ),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.purple, Colors.deepPurple],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.purple.withValues(alpha: 0.6),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.celebration,
                        color: Colors.amber,
                        size: 48,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        _milestoneTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
