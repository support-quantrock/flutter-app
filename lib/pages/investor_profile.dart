import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../context/questionnaire_context.dart';
import '../components/questionnaire/question_header.dart';
import '../components/questionnaire/animated_progress_bar.dart';
import '../components/questionnaire/single_choice_card.dart';
import '../components/questionnaire/single_choice_grid.dart';
import '../components/questionnaire/multi_select_chips.dart';
import '../components/questionnaire/rating_scale.dart';

const int totalQuestions = 25;

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

class _InvestorProfilePageState extends State<InvestorProfilePage> {
  int _step = 1;
  bool _goingForward = true;

  List<String> _selectedDebts = [];
  List<String> _selectedAssets = [];
  List<String> _selectedIndustries = [];

  @override
  void initState() {
    super.initState();
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
      setState(() {
        _goingForward = true;
        _step++;
      });
    } else {
      final provider = context.read<QuestionnaireProvider>();
      provider.setAnswer('completedAt', DateTime.now().toIso8601String());
      Navigator.of(context).pushReplacementNamed('/investor-results');
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<QuestionnaireProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              QuestionHeader(
                step: _step,
                total: totalQuestions,
                onBack: _handleBack,
                onSkip: _handleSkip,
                showBack: _step > 1,
              ),
              AnimatedProgressBar(
                step: _step,
                total: totalQuestions,
              ),
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
    );
  }
}
