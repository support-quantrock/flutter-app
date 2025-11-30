import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';
import '../components/questionnaire/single_choice_card.dart';
import '../components/questionnaire/single_choice_grid.dart';
import '../components/questionnaire/multi_select_chips.dart';

const int totalQuestions = 20;

// Question categories for milestone rewards
enum QuestionCategory { profile, experience, goals, risk, behavior, interests }

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
  // Section 1: Personal & Financial Profile
  1: const QuestionData(title: 'Gender', category: QuestionCategory.profile),
  2: const QuestionData(title: 'Age', category: QuestionCategory.profile),
  3: const QuestionData(title: 'Education', category: QuestionCategory.profile),
  4: const QuestionData(title: 'Income Source', category: QuestionCategory.profile, xpReward: 50),
  // Section 2: Investment Experience
  5: const QuestionData(title: 'Investment Account', category: QuestionCategory.experience, xpReward: 50),
  6: const QuestionData(title: 'Knowledge', category: QuestionCategory.experience, xpReward: 50),
  7: const QuestionData(title: 'Asset Classes', category: QuestionCategory.experience, xpReward: 60),
  // Section 3: Investment Goals & Risk Profile
  8: const QuestionData(title: 'Investment Goal', category: QuestionCategory.goals, xpReward: 50),
  9: const QuestionData(title: 'Drop Response', category: QuestionCategory.risk, xpReward: 60),
  10: const QuestionData(title: 'Fluctuations', category: QuestionCategory.risk, xpReward: 60),
  11: const QuestionData(title: 'Risk Tolerance', category: QuestionCategory.risk, xpReward: 60),
  12: const QuestionData(title: 'Risk Attitude', category: QuestionCategory.risk, xpReward: 60),
  // Section 4: Behavior & Financial Habits
  13: const QuestionData(title: 'Financial Stress', category: QuestionCategory.behavior, xpReward: 50),
  14: const QuestionData(title: 'Retirement', category: QuestionCategory.behavior, xpReward: 50),
  15: const QuestionData(title: 'Saving Habit', category: QuestionCategory.behavior, xpReward: 50),
  // Section 5: Investment Interests & Motivation
  16: const QuestionData(title: 'Industries', category: QuestionCategory.interests, xpReward: 60),
  17: const QuestionData(title: 'Quantrock Goal', category: QuestionCategory.interests, xpReward: 50),
  18: const QuestionData(title: 'Portfolio Size', category: QuestionCategory.interests, xpReward: 50),
  19: const QuestionData(title: 'Readiness', category: QuestionCategory.interests, xpReward: 70),
  20: const QuestionData(title: 'Passive Income', category: QuestionCategory.interests, xpReward: 80),
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
  int _lastXPGain = 0;
  bool _showLevelUp = false;
  bool _showMilestone = false;
  String _milestoneTitle = '';

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
    if (_step == 4) {
      _showMilestonePopup('Profile Complete!', 'Section 1 done!');
    } else if (_step == 7) {
      _showMilestonePopup('Experience Unlocked!', 'Section 2 complete!');
    } else if (_step == 12) {
      _showMilestonePopup('Risk Master!', 'Section 3 conquered!');
    } else if (_step == 15) {
      _showMilestonePopup('Almost There!', 'Just one section left!');
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

  Widget _buildQuestion(QuestionnaireAnswers answers) {
    switch (_step) {
      // SECTION 1 — Personal & Financial Profile
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
            ChoiceOption(label: '30-39', value: '30-39', icon: '👨'),
            ChoiceOption(label: '40-49', value: '40-49', icon: '👨‍💼'),
            ChoiceOption(label: '50-59', value: '50-59', icon: '👴'),
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
        return SingleChoiceGrid(
          title: 'What is your current income source?',
          options: const [
            ChoiceOption(label: 'Employee', value: 'employee', icon: '💼'),
            ChoiceOption(label: 'Business owner / self-employed', value: 'business_owner', icon: '🏢'),
            ChoiceOption(label: 'Retired', value: 'retired', icon: '🌴'),
            ChoiceOption(label: 'Student', value: 'student', icon: '🎓'),
          ],
          selectedValue: answers.incomeSource,
          onSelect: (v) => _handleSingleSelect('incomeSource', v),
        );

      // SECTION 2 — Investment Experience
      case 5:
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

      case 6:
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

      case 7:
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

      // SECTION 3 — Investment Goals & Risk Profile
      case 8:
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

      case 9:
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

      case 10:
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

      case 11:
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

      case 12:
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

      // SECTION 4 — Behavior & Financial Habits
      case 13:
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

      case 14:
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

      case 15:
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

      // SECTION 5 — Investment Interests & Motivation
      case 16:
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

      case 17:
        return SingleChoiceGrid(
          title: 'What is your main goal in trying Quantrock App?',
          options: const [
            ChoiceOption(label: 'Join the challenge', value: 'challenge', icon: '🏆'),
            ChoiceOption(label: 'Prepare for real trading', value: 'prepare_trading', icon: '📊'),
            ChoiceOption(label: 'Test my own strategy', value: 'test_strategy', icon: '🎯'),
            ChoiceOption(label: 'Learn and build skills', value: 'learn', icon: '📚'),
          ],
          selectedValue: answers.quantrockGoal,
          onSelect: (v) => _handleSingleSelect('quantrockGoal', v),
        );

      case 18:
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

      case 19:
        return SingleChoiceCard(
          title: 'Rate your readiness to invest',
          options: const [
            ChoiceOption(label: 'Totally prepared', value: 'totally_prepared', icon: '🎯'),
            ChoiceOption(label: 'Somewhat prepared', value: 'somewhat_prepared', icon: '📊'),
            ChoiceOption(label: 'Neutral', value: 'neutral', icon: '😐'),
            ChoiceOption(label: 'I need more information', value: 'need_info', icon: '📚'),
          ],
          selectedValue: answers.investmentReadinessText,
          onSelect: (v) => _handleSingleSelect('investmentReadinessText', v),
        );

      case 20:
        return SingleChoiceCard(
          title: 'Rate your knowledge about passive income',
          options: const [
            ChoiceOption(label: 'Totally prepared', value: 'totally_prepared', icon: '🎯'),
            ChoiceOption(label: 'Somewhat prepared', value: 'somewhat_prepared', icon: '📊'),
            ChoiceOption(label: 'Neutral', value: 'neutral', icon: '😐'),
            ChoiceOption(label: 'I need more information', value: 'need_info', icon: '📚'),
          ],
          selectedValue: answers.passiveIncomeKnowledgeText,
          onSelect: (v) => _handleSingleSelect('passiveIncomeKnowledgeText', v),
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
                // Logo
                const Text(
                  'Quantrock',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF22C55E),
                  ),
                ),
                const SizedBox(height: 20),
                // Top Badges
                Row(
                  children: [
                    Expanded(
                      child: _buildIntroBadge(
                        Icons.verified,
                        'OECD, MIT & CFA',
                        'Trusted Standards',
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
                // Candlestick Chart with Character
                _buildChartIllustration(),
                const SizedBox(height: 32),
                // Title
                const Text(
                  'QUANTROCK INVESTOR',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  'QUALIFICATION TEST',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '⭐ ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Text(
                      'QIQT',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF22C55E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Description
                _buildQIQTDescription(),
                const SizedBox(height: 32),
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
          Icon(icon, color: const Color(0xFF22C55E), size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF9CA3AF),
                    fontSize: 9,
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

  Widget _buildChartIllustration() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Candlestick chart background
          Positioned.fill(
            child: CustomPaint(
              painter: CandlestickChartPainter(),
            ),
          ),
          // Price overlay
          Positioned(
            top: 16,
            left: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '130.81',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '↑ 13.6%',
                        style: TextStyle(
                          color: Color(0xFF22C55E),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '+9.00',
                      style: TextStyle(
                        color: Color(0xFF22C55E),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Y-axis labels
          Positioned(
            left: 8,
            top: 70,
            bottom: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('61.8', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 10)),
                Text('38.6', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 10)),
                Text('23.6', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 10)),
                Text('0', style: TextStyle(color: Colors.white.withValues(alpha: 0.5), fontSize: 10)),
              ],
            ),
          ),
          // Character mascot
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    'assets/images/mascot.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                          ),
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
        children: [
          _buildDescriptionItem(
            Icons.psychology,
            'Measures investment experience, literacy & readiness',
          ),
          const SizedBox(height: 12),
          _buildDescriptionItem(
            Icons.school,
            'Built on OECD, MIT, and CFA standards',
          ),
          const SizedBox(height: 12),
          _buildDescriptionItem(
            Icons.trending_up,
            'Classifies: Beginner / Intermediate / Advanced',
          ),
          const SizedBox(height: 12),
          _buildDescriptionItem(
            Icons.route,
            'Determines your ideal path in Quantrock',
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFF22C55E), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
            ),
          ),
        ),
      ],
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
                    'QIQT Qualification Test',
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

class CandlestickChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final greenPaint = Paint()..color = const Color(0xFF22C55E);
    final redPaint = Paint()..color = const Color(0xFFEF4444);
    final wickPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.5)
      ..strokeWidth = 1;

    // Sample candlestick data (x position, isGreen, height ratio)
    final candles = [
      {'x': 0.1, 'green': true, 'h': 0.3, 'wickH': 0.15},
      {'x': 0.18, 'green': false, 'h': 0.25, 'wickH': 0.1},
      {'x': 0.26, 'green': true, 'h': 0.4, 'wickH': 0.2},
      {'x': 0.34, 'green': true, 'h': 0.35, 'wickH': 0.15},
      {'x': 0.42, 'green': false, 'h': 0.2, 'wickH': 0.1},
      {'x': 0.50, 'green': true, 'h': 0.5, 'wickH': 0.2},
      {'x': 0.58, 'green': true, 'h': 0.45, 'wickH': 0.18},
      {'x': 0.66, 'green': false, 'h': 0.3, 'wickH': 0.12},
      {'x': 0.74, 'green': true, 'h': 0.55, 'wickH': 0.25},
      {'x': 0.82, 'green': true, 'h': 0.6, 'wickH': 0.2},
      {'x': 0.90, 'green': false, 'h': 0.35, 'wickH': 0.15},
    ];

    final candleWidth = size.width * 0.04;

    for (final candle in candles) {
      final x = size.width * (candle['x'] as double);
      final isGreen = candle['green'] as bool;
      final heightRatio = candle['h'] as double;
      final wickRatio = candle['wickH'] as double;

      final bodyHeight = size.height * heightRatio;
      final baseY = size.height * (0.3 + (1 - heightRatio) * 0.5);

      // Draw wick
      final wickHeight = size.height * wickRatio;
      canvas.drawLine(
        Offset(x, baseY - wickHeight),
        Offset(x, baseY + bodyHeight + wickHeight * 0.5),
        wickPaint,
      );

      // Draw body
      final bodyRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(x - candleWidth / 2, baseY, candleWidth, bodyHeight),
        const Radius.circular(2),
      );
      canvas.drawRRect(bodyRect, isGreen ? greenPaint : redPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
