import 'package:flutter/material.dart';

class QuestionnaireAnswers {
  String? gender;
  String? ageRange;
  String? educationLevel;
  String? monthlyIncome;
  String? incomeStability;
  String? incomeSource;
  List<String> currentDebts;
  String? hasInvestmentAccount;
  String? portfolioSize;
  String? investmentKnowledge;
  List<String> assetClasses;
  String? investingGoal;
  String? investmentTimeline;
  String? portfolioDropResponse;
  String? marketFluctuationImpact;
  String? riskTolerance;
  String? riskAttitude;
  String? financialStressFrequency;
  String? retirementPlanning;
  String? savingHabit;
  List<String> industriesInterested;
  String? quantrockGoal;
  String? preferredPortfolioSize;
  int? investmentReadiness;
  int? passiveIncomeKnowledge;
  String? completedAt;
  Map<String, dynamic>? selectedAsset;

  QuestionnaireAnswers({
    this.gender,
    this.ageRange,
    this.educationLevel,
    this.monthlyIncome,
    this.incomeStability,
    this.incomeSource,
    List<String>? currentDebts,
    this.hasInvestmentAccount,
    this.portfolioSize,
    this.investmentKnowledge,
    List<String>? assetClasses,
    this.investingGoal,
    this.investmentTimeline,
    this.portfolioDropResponse,
    this.marketFluctuationImpact,
    this.riskTolerance,
    this.riskAttitude,
    this.financialStressFrequency,
    this.retirementPlanning,
    this.savingHabit,
    List<String>? industriesInterested,
    this.quantrockGoal,
    this.preferredPortfolioSize,
    this.investmentReadiness,
    this.passiveIncomeKnowledge,
    this.completedAt,
    this.selectedAsset,
  })  : currentDebts = currentDebts ?? [],
        assetClasses = assetClasses ?? [],
        industriesInterested = industriesInterested ?? [];
}

class QuestionnaireProvider extends ChangeNotifier {
  QuestionnaireAnswers _answers = QuestionnaireAnswers();

  QuestionnaireAnswers get answers => _answers;

  void setAnswer(String key, dynamic value) {
    switch (key) {
      case 'gender':
        _answers.gender = value;
        break;
      case 'ageRange':
        _answers.ageRange = value;
        break;
      case 'educationLevel':
        _answers.educationLevel = value;
        break;
      case 'monthlyIncome':
        _answers.monthlyIncome = value;
        break;
      case 'incomeStability':
        _answers.incomeStability = value;
        break;
      case 'incomeSource':
        _answers.incomeSource = value;
        break;
      case 'currentDebts':
        _answers.currentDebts = List<String>.from(value);
        break;
      case 'hasInvestmentAccount':
        _answers.hasInvestmentAccount = value;
        break;
      case 'portfolioSize':
        _answers.portfolioSize = value;
        break;
      case 'investmentKnowledge':
        _answers.investmentKnowledge = value;
        break;
      case 'assetClasses':
        _answers.assetClasses = List<String>.from(value);
        break;
      case 'investingGoal':
        _answers.investingGoal = value;
        break;
      case 'investmentTimeline':
        _answers.investmentTimeline = value;
        break;
      case 'portfolioDropResponse':
        _answers.portfolioDropResponse = value;
        break;
      case 'marketFluctuationImpact':
        _answers.marketFluctuationImpact = value;
        break;
      case 'riskTolerance':
        _answers.riskTolerance = value;
        break;
      case 'riskAttitude':
        _answers.riskAttitude = value;
        break;
      case 'financialStressFrequency':
        _answers.financialStressFrequency = value;
        break;
      case 'retirementPlanning':
        _answers.retirementPlanning = value;
        break;
      case 'savingHabit':
        _answers.savingHabit = value;
        break;
      case 'industriesInterested':
        _answers.industriesInterested = List<String>.from(value);
        break;
      case 'quantrockGoal':
        _answers.quantrockGoal = value;
        break;
      case 'preferredPortfolioSize':
        _answers.preferredPortfolioSize = value;
        break;
      case 'investmentReadiness':
        _answers.investmentReadiness = value;
        break;
      case 'passiveIncomeKnowledge':
        _answers.passiveIncomeKnowledge = value;
        break;
      case 'completedAt':
        _answers.completedAt = value;
        break;
      case 'selectedAsset':
        _answers.selectedAsset = value;
        break;
    }
    notifyListeners();
  }

  void reset() {
    _answers = QuestionnaireAnswers();
    notifyListeners();
  }
}
