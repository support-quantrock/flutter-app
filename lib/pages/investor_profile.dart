import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';
import '../components/questionnaire/single_choice_card.dart';
import '../components/questionnaire/single_choice_grid.dart';
import '../components/questionnaire/multi_select_chips.dart';
import '../components/questionnaire/knowledge_rating_card.dart';

const int totalQuestions = 20;

// Question categories for milestone rewards
enum QuestionCategory { profile, literacy, goals, readiness }

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
  // SECTION 1 — Personal Information & Investment Background
  1: const QuestionData(title: 'Gender', category: QuestionCategory.profile),
  2: const QuestionData(title: 'Age Group', category: QuestionCategory.profile),
  3: const QuestionData(title: 'Investment Account', category: QuestionCategory.profile, xpReward: 50),
  4: const QuestionData(title: 'Active Portfolio', category: QuestionCategory.profile, xpReward: 50),
  5: const QuestionData(title: 'Portfolio Size', category: QuestionCategory.profile, xpReward: 50),
  6: const QuestionData(title: 'Knowledge Rating', category: QuestionCategory.profile, xpReward: 80),
  7: const QuestionData(title: 'Asset Classes', category: QuestionCategory.profile, xpReward: 60),
  8: const QuestionData(title: 'Chart Reading', category: QuestionCategory.profile, xpReward: 50),
  9: const QuestionData(title: 'Time Horizon', category: QuestionCategory.profile, xpReward: 50),
  // SECTION 2 — Financial Literacy & Personal Readiness
  10: const QuestionData(title: 'Market Risk', category: QuestionCategory.literacy, xpReward: 50),
  11: const QuestionData(title: 'Saving Discipline', category: QuestionCategory.literacy, xpReward: 50),
  12: const QuestionData(title: 'Emergency Savings', category: QuestionCategory.literacy, xpReward: 50),
  13: const QuestionData(title: 'Retirement', category: QuestionCategory.literacy, xpReward: 50),
  14: const QuestionData(title: 'Risk Tolerance', category: QuestionCategory.literacy, xpReward: 60),
  // SECTION 3 — Investment Objectives & User Motivation
  15: const QuestionData(title: 'Investment Goal', category: QuestionCategory.goals, xpReward: 50),
  16: const QuestionData(title: 'Quantrock Goal', category: QuestionCategory.goals, xpReward: 50),
  17: const QuestionData(title: 'Industries', category: QuestionCategory.goals, xpReward: 60),
  // SECTION 4 — Learning Readiness & Portfolio Preferences
  18: const QuestionData(title: 'Readiness', category: QuestionCategory.readiness, xpReward: 60),
  19: const QuestionData(title: 'Passive Income', category: QuestionCategory.readiness, xpReward: 60),
  20: const QuestionData(title: 'Demo Portfolio', category: QuestionCategory.readiness, xpReward: 80),
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
  bool _showIntro = true;
  int _step = 1;
  bool _goingForward = true;
  int _totalXP = 0;
  int _currentLevel = 1;
  bool _showXPGain = false;
  bool _showLevelUp = false;
  bool _showMilestone = false;
  String _milestoneTitle = '';

  List<String> _selectedAssets = [];
  List<String> _selectedIndustries = [];
  final Map<String, int> _knowledgeRatings = {};

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
    if (_step == 9) {
      _showMilestonePopup('Background Complete!', 'Section 1 done!');
    } else if (_step == 14) {
      _showMilestonePopup('Literacy Assessed!', 'Section 2 complete!');
    } else if (_step == 17) {
      _showMilestonePopup('Goals Defined!', 'Section 3 conquered!');
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

  String _getSectionProgress() {
    // Section 1: Questions 1-9 (9 questions)
    // Section 2: Questions 10-14 (5 questions)
    // Section 3: Questions 15-17 (3 questions)
    // Section 4: Questions 18-20 (3 questions)

    int sectionStart;
    int sectionEnd;
    String sectionName;

    if (_step <= 9) {
      sectionStart = 1;
      sectionEnd = 9;
      sectionName = 'Section 1';
    } else if (_step <= 14) {
      sectionStart = 10;
      sectionEnd = 14;
      sectionName = 'Section 2';
    } else if (_step <= 17) {
      sectionStart = 15;
      sectionEnd = 17;
      sectionName = 'Section 3';
    } else {
      sectionStart = 18;
      sectionEnd = 20;
      sectionName = 'Section 4';
    }

    final questionInSection = _step - sectionStart + 1;
    final totalInSection = sectionEnd - sectionStart + 1;

    return '$sectionName: $questionInSection/$totalInSection';
  }

  Widget _buildQuestion(QuestionnaireAnswers answers) {
    switch (_step) {
      // SECTION 1 — Personal Information & Investment Background
      case 1:
        return SingleChoiceCard(
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
          title: 'What is your age group?',
          options: const [
            ChoiceOption(label: 'Under 18', value: 'under_18', icon: '🧒'),
            ChoiceOption(label: '18–24', value: '18-24', icon: '🧑'),
            ChoiceOption(label: '25–34', value: '25-34', icon: '👨'),
            ChoiceOption(label: '35–44', value: '35-44', icon: '👨‍💼'),
            ChoiceOption(label: '45–54', value: '45-54', icon: '👴'),
            ChoiceOption(label: '55–64', value: '55-64', icon: '🧓'),
            ChoiceOption(label: '65+', value: '65+', icon: '👵'),
          ],
          selectedValue: answers.ageRange,
          onSelect: (v) => _handleSingleSelect('ageRange', v),
        );

      case 3:
        return SingleChoiceCard(
          title: 'Do you currently have an investment account?',
          options: const [
            ChoiceOption(label: 'Yes', value: 'yes', icon: '✅'),
            ChoiceOption(label: 'No', value: 'no', icon: '❌'),
            ChoiceOption(label: 'Planning to open one soon', value: 'planning', icon: '📋'),
          ],
          selectedValue: answers.hasInvestmentAccount,
          onSelect: (v) => _handleSingleSelect('hasInvestmentAccount', v),
        );

      case 4:
        return SingleChoiceCard(
          title: 'Do you have an active investment portfolio?',
          options: const [
            ChoiceOption(label: 'Yes', value: 'yes', icon: '✅'),
            ChoiceOption(label: 'No', value: 'no', icon: '❌'),
            ChoiceOption(label: 'I used to have one but not anymore', value: 'used_to', icon: '📉'),
          ],
          selectedValue: answers.hasActivePortfolio,
          onSelect: (v) => _handleSingleSelect('hasActivePortfolio', v),
        );

      case 5:
        return SingleChoiceCard(
          title: 'What is the approximate size of your current or latest portfolio?',
          options: const [
            ChoiceOption(label: 'Less than \$1,000', value: 'less_1k', icon: '💵'),
            ChoiceOption(label: '\$1,000–\$10,000', value: '1k-10k', icon: '💰'),
            ChoiceOption(label: '\$10,000–\$25,000', value: '10k-25k', icon: '💎'),
            ChoiceOption(label: '\$25,000–\$100,000', value: '25k-100k', icon: '🏆'),
            ChoiceOption(label: '\$100,000–\$500,000', value: '100k-500k', icon: '👑'),
            ChoiceOption(label: 'More than \$500,000', value: 'more_500k', icon: '🚀'),
          ],
          selectedValue: answers.portfolioSize,
          onSelect: (v) => _handleSingleSelect('portfolioSize', v),
        );

      case 6:
        return KnowledgeRatingCard(
          title: 'Rate your knowledge in the following areas',
          areas: const ['Stocks', 'Risk management', 'Technical analysis', 'Portfolio diversification'],
          ratings: _knowledgeRatings,
          onRatingChanged: (area, rating) {
            setState(() {
              _knowledgeRatings[area] = rating;
            });
            final provider = context.read<QuestionnaireProvider>();
            if (area == 'Stocks') provider.setAnswer('stocksKnowledge', rating);
            if (area == 'Risk management') provider.setAnswer('riskManagementKnowledge', rating);
            if (area == 'Technical analysis') provider.setAnswer('technicalAnalysisKnowledge', rating);
            if (area == 'Portfolio diversification') provider.setAnswer('portfolioDiversificationKnowledge', rating);
          },
          onContinue: _handleNext,
        );

      case 7:
        return MultiSelectChips(
          title: 'Which asset classes have you invested in before?',
          options: const [
            ChoiceOption(label: 'Stocks', value: 'stocks', icon: '📈'),
            ChoiceOption(label: 'ETFs', value: 'etfs', icon: '📊'),
            ChoiceOption(label: 'Crypto', value: 'crypto', icon: '₿'),
            ChoiceOption(label: 'Bonds', value: 'bonds', icon: '📜'),
            ChoiceOption(label: 'Real Estate', value: 'real_estate', icon: '🏠'),
            ChoiceOption(label: 'Commodities', value: 'commodities', icon: '🛢️'),
            ChoiceOption(label: 'None', value: 'none', icon: '🚫'),
          ],
          selectedValues: _selectedAssets,
          onToggle: _toggleAsset,
          onContinue: _handleNext,
        );

      case 8:
        return SingleChoiceCard(
          title: 'How comfortable are you reading financial charts?',
          options: const [
            ChoiceOption(label: 'Not comfortable', value: 'not_comfortable', icon: '😰'),
            ChoiceOption(label: 'Slightly comfortable', value: 'slightly_comfortable', icon: '🤔'),
            ChoiceOption(label: 'Comfortable', value: 'comfortable', icon: '😊'),
            ChoiceOption(label: 'Very comfortable', value: 'very_comfortable', icon: '😎'),
          ],
          selectedValue: answers.chartReadingComfort,
          onSelect: (v) => _handleSingleSelect('chartReadingComfort', v),
        );

      case 9:
        return SingleChoiceCard(
          title: 'What is your investment time horizon?',
          options: const [
            ChoiceOption(label: 'Less than 1 year', value: 'less_1_year', icon: '⏱️'),
            ChoiceOption(label: '1–3 years', value: '1-3_years', icon: '📅'),
            ChoiceOption(label: '3–7 years', value: '3-7_years', icon: '📆'),
            ChoiceOption(label: '7+ years', value: '7+_years', icon: '🗓️'),
          ],
          selectedValue: answers.investmentTimeHorizon,
          onSelect: (v) => _handleSingleSelect('investmentTimeHorizon', v),
        );

      // SECTION 2 — Financial Literacy & Personal Readiness
      case 10:
        return SingleChoiceCard(
          title: 'How well do you understand market risk?',
          options: const [
            ChoiceOption(label: 'Poor', value: 'poor', icon: '😟'),
            ChoiceOption(label: 'Basic', value: 'basic', icon: '🤔'),
            ChoiceOption(label: 'Good', value: 'good', icon: '😊'),
            ChoiceOption(label: 'Excellent', value: 'excellent', icon: '🌟'),
          ],
          selectedValue: answers.marketRiskUnderstanding,
          onSelect: (v) => _handleSingleSelect('marketRiskUnderstanding', v),
        );

      case 11:
        return SingleChoiceCard(
          title: 'How disciplined are you with saving money?',
          options: const [
            ChoiceOption(label: "I don't save", value: 'dont_save', icon: '🙈'),
            ChoiceOption(label: 'I save sometimes', value: 'save_sometimes', icon: '🤷'),
            ChoiceOption(label: 'I save regularly', value: 'save_regularly', icon: '💪'),
            ChoiceOption(label: 'I save a fixed percentage every month', value: 'save_fixed', icon: '🎯'),
          ],
          selectedValue: answers.savingHabit,
          onSelect: (v) => _handleSingleSelect('savingHabit', v),
        );

      case 12:
        return SingleChoiceGrid(
          title: 'Do you have emergency savings (3–6 months of expenses)?',
          options: const [
            ChoiceOption(label: 'Yes', value: 'yes', icon: '✅'),
            ChoiceOption(label: 'No', value: 'no', icon: '❌'),
          ],
          selectedValue: answers.hasEmergencySavings,
          onSelect: (v) => _handleSingleSelect('hasEmergencySavings', v),
        );

      case 13:
        return SingleChoiceCard(
          title: 'Do you plan for your retirement?',
          options: const [
            ChoiceOption(label: 'Not yet', value: 'not_yet', icon: '🤔'),
            ChoiceOption(label: 'I save regularly', value: 'save_regularly', icon: '🐷'),
            ChoiceOption(label: 'I rely on a pension fund', value: 'rely_pension', icon: '🏦'),
          ],
          selectedValue: answers.retirementPlanning,
          onSelect: (v) => _handleSingleSelect('retirementPlanning', v),
        );

      case 14:
        return SingleChoiceGrid(
          title: 'What is your risk tolerance?',
          options: const [
            ChoiceOption(label: 'Very low', value: 'very_low', icon: '🛡️'),
            ChoiceOption(label: 'Low', value: 'low', icon: '🟢'),
            ChoiceOption(label: 'Medium', value: 'medium', icon: '🟡'),
            ChoiceOption(label: 'High', value: 'high', icon: '🔴'),
          ],
          selectedValue: answers.riskTolerance,
          onSelect: (v) => _handleSingleSelect('riskTolerance', v),
        );

      // SECTION 3 — Investment Objectives & User Motivation
      case 15:
        return SingleChoiceCard(
          title: 'What is your main goal from investing?',
          options: const [
            ChoiceOption(label: 'Capital growth', value: 'growth', icon: '📈'),
            ChoiceOption(label: 'Extra income', value: 'income', icon: '💰'),
            ChoiceOption(label: 'Capital protection', value: 'protection', icon: '🛡️'),
            ChoiceOption(label: 'Short-term speculation', value: 'speculation', icon: '⚡'),
            ChoiceOption(label: 'Long-term wealth building', value: 'wealth_building', icon: '🏰'),
          ],
          selectedValue: answers.investingGoal,
          onSelect: (v) => _handleSingleSelect('investingGoal', v),
        );

      case 16:
        return SingleChoiceCard(
          title: 'What is your main goal in trying Quantrock App?',
          options: const [
            ChoiceOption(label: 'Join the challenge', value: 'challenge', icon: '🏆'),
            ChoiceOption(label: 'Prepare for real trading', value: 'prepare_trading', icon: '📊'),
            ChoiceOption(label: 'Test my own strategy', value: 'test_strategy', icon: '🎯'),
            ChoiceOption(label: 'Learn and build skills', value: 'learn', icon: '📚'),
            ChoiceOption(label: 'Explore automated investing concepts', value: 'explore_auto', icon: '🤖'),
          ],
          selectedValue: answers.quantrockGoal,
          onSelect: (v) => _handleSingleSelect('quantrockGoal', v),
        );

      case 17:
        return MultiSelectChips(
          title: 'Which industries or sectors are you interested in?',
          options: const [
            ChoiceOption(label: 'Technology', value: 'tech', icon: '💻'),
            ChoiceOption(label: 'Electric Vehicles', value: 'ev', icon: '🚗'),
            ChoiceOption(label: 'Energy', value: 'energy', icon: '⚡'),
            ChoiceOption(label: 'Healthcare', value: 'healthcare', icon: '💊'),
            ChoiceOption(label: 'Retail', value: 'retail', icon: '🛒'),
            ChoiceOption(label: 'Crypto', value: 'crypto', icon: '₿'),
            ChoiceOption(label: 'AI & Robotics', value: 'ai_robotics', icon: '🤖'),
            ChoiceOption(label: 'Finance', value: 'finance', icon: '🏦'),
          ],
          selectedValues: _selectedIndustries,
          onToggle: _toggleIndustry,
          onContinue: _handleNext,
        );

      // SECTION 4 — Learning Readiness & Portfolio Preferences
      case 18:
        return SingleChoiceCard(
          title: 'How prepared do you feel to start investing?',
          options: const [
            ChoiceOption(label: 'I need a lot of help', value: 'need_help', icon: '🆘'),
            ChoiceOption(label: 'Somewhat prepared', value: 'somewhat_prepared', icon: '🤔'),
            ChoiceOption(label: 'Fully prepared', value: 'fully_prepared', icon: '💪'),
            ChoiceOption(label: 'Very confident', value: 'very_confident', icon: '🌟'),
          ],
          selectedValue: answers.investmentReadinessText,
          onSelect: (v) => _handleSingleSelect('investmentReadinessText', v),
        );

      case 19:
        return SingleChoiceCard(
          title: 'How would you rate your understanding of passive income?',
          options: const [
            ChoiceOption(label: "I don't understand it", value: 'dont_understand', icon: '🤷'),
            ChoiceOption(label: 'Basic understanding', value: 'basic', icon: '📖'),
            ChoiceOption(label: 'Good understanding', value: 'good', icon: '🧠'),
            ChoiceOption(label: 'Excellent understanding', value: 'excellent', icon: '🎯'),
          ],
          selectedValue: answers.passiveIncomeKnowledgeText,
          onSelect: (v) => _handleSingleSelect('passiveIncomeKnowledgeText', v),
        );

      case 20:
        return SingleChoiceCard(
          title: 'What is your preferred demo portfolio size inside Quantrock?',
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

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildIntroScreen() {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 16),
                // Top Badges
                Row(
                  children: [
                    Expanded(
                      child: _buildIntroBadgeWithInfo(
                        Icons.verified,
                        'OECD, MIT & CFA',
                        'Global Trusted Standards',
                        () => _showStandardsInfoPopup(context),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildIntroBadge(
                        Icons.star,
                        'SMART CLASSIFICATION',
                        'Beginner to Advanced',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // QIQT Badge (large)
                ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF22C55E), Color(0xFF3B82F6), Color(0xFFA855F7)],
                  ).createShader(bounds),
                  child: const Text(
                    'QIQT',
                    style: TextStyle(
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      letterSpacing: 4,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Subtitle (smaller, one line)
                const Text(
                  'Quantrock Investor Qualification Test',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF9CA3AF),
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Hero Image
                _buildChartIllustration(),
                const SizedBox(height: 24),
                // Description
                _buildQIQTDescription(),
                const SizedBox(height: 24),
                // Privacy Notice
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.03),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.1),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outline,
                        color: const Color(0xFF22C55E),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Your answers are anonymized, and we do not sell your data.',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Start Test Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showIntro = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22C55E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'START TEST',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Footer
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'By proceeding, you agree with ',
                      style: TextStyle(
                        color: Color(0xFF9CA3AF),
                        fontSize: 12,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: Color(0xFF22C55E),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    const Text(
                      ', ',
                      style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 12),
                    ),
                  ],
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Color(0xFF22C55E),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'QUANTROCK LTD, Dubai, United Arab Emirates',
                  style: TextStyle(
                    color: Color(0xFF6B7280),
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIntroBadge(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF22C55E),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF22C55E), size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroBadgeWithInfo(IconData icon, String title, String subtitle, VoidCallback onInfoTap) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFF22C55E),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF22C55E), size: 22),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 10,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onInfoTap,
            child: const Icon(
              Icons.info_outline,
              color: Color(0xFF22C55E),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  void _showStandardsInfoPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'OECD, MIT & CFA',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'The test is based on globally recognized standards:',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              _buildStandardItem(
                '🔹',
                'OECD',
                'The Organization for Economic Co-operation and Development\nThe international standard for measuring financial literacy and financial behavior.',
              ),
              const SizedBox(height: 12),
              _buildStandardItem(
                '🔹',
                'MIT Learning Readiness Model',
                'Used to measure educational readiness and motivation.',
              ),
              const SizedBox(height: 12),
              _buildStandardItem(
                '🔹',
                'CFA Investment Knowledge Framework',
                'Used to measure the level of financial and investment knowledge and experience.',
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Got it',
              style: TextStyle(color: Color(0xFF22C55E)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStandardItem(String emoji, String title, String description) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(emoji, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showQIQTInfoPopup() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Quantrock Investor Qualification Test (QIQT)',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QIQT is an intelligent qualification test built on OECD, MIT, and CFA standards, designed to measure your investment experience, financial literacy, motivations, and readiness to learn.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'QIQT helps you assess your financial knowledge, investment background, and determine your ideal path inside Quantrock whether in challenges, daily lessons, or selecting the appropriate demo portfolio size.',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Got it',
              style: TextStyle(color: Color(0xFF22C55E)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartIllustration() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final imageHeight = screenWidth < 400 ? 180.0 : (screenWidth < 600 ? 220.0 : 280.0);

        return Container(
          height: imageHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Background green bull vs red bear stock market image
                Image.network(
                  'https://cdn.pixabay.com/photo/2016/11/27/21/42/stock-1863880_1280.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback gradient if network image fails
                    return Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1A1A2E), Color(0xFF16213E), Color(0xFF0F172A)],
                        ),
                      ),
                    );
                  },
                ),
                // Dark overlay for better contrast
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.3),
                        Colors.black.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
                // Main hero image on top
                Image.asset(
                  'assets/images/qiqt_hero.png',
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback to mascot image if hero image fails
                    return Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(70),
                          child: Image.asset(
                            'assets/images/mascot.png',
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, err, stack) {
                              return Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                                  ),
                                ),
                                child: const Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildQIQTDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Main intro text
          Text(
            'QIQT is an intelligent qualification test built on OECD, MIT, and CFA standards, designed to measure your investment experience, financial literacy, motivations, and readiness to learn.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'QIQT helps you assess your financial knowledge, investment background, and determine your ideal path inside Quantrock whether in challenges, daily lessons, or selecting the appropriate demo portfolio size.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
          // Purpose section header
          Row(
            children: [
              const Text(
                '🎯',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'What is the purpose of QIQT?',
                  style: TextStyle(
                    color: Color(0xFF22C55E),
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'The test aims to accurately classify the user into one of the following levels:',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 8),
          // Classification levels
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF22C55E).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFF22C55E).withValues(alpha: 0.3),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Beginner',
                  style: TextStyle(
                    color: Color(0xFF22C55E),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '/',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                ),
                Text(
                  'Intermediate',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  '/',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                ),
                Text(
                  'Advanced',
                  style: TextStyle(
                    color: Color(0xFFA855F7),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'It works on identifying:',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          // Identification items
          _buildIdentificationItem('Actual investment experience'),
          _buildIdentificationItem('Financial background and basic financial knowledge'),
          _buildIdentificationItem('Investment objectives and personal motivations'),
          _buildIdentificationItem('Level of readiness and willingness to learn'),
          _buildIdentificationItem('The most suitable learning path for the user'),
          _buildIdentificationItem('The appropriate challenge level within Quantrock'),
          _buildIdentificationItem('The recommended demo portfolio size'),
          _buildIdentificationItem('Understanding the user\'s motivations for using Quantrock'),
        ],
      ),
    );
  }

  Widget _buildIdentificationItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 7),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF22C55E),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.75),
                fontSize: 14,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_showIntro) {
      return _buildIntroScreen();
    }

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
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'LVL $_currentLevel',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
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
                          fontSize: 12,
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
                        _getSectionProgress(),
                        style: TextStyle(
                          color: Colors.amber.withValues(alpha: 0.8),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
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
            children: [
              const Icon(
                Icons.map,
                color: Colors.cyan,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                'QIQT Qualification Test',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () => _showQIQTInfoPopup(),
                child: Icon(
                  Icons.info_outline,
                  color: Colors.cyan.withValues(alpha: 0.7),
                  size: 14,
                ),
              ),
              const Spacer(),
              Text(
                '$_step/$totalQuestions',
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

