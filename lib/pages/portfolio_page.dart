import 'package:flutter/material.dart';
import 'investor_profile.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Portfolio tab directly shows the QIPA questionnaire flow
    return const InvestorProfilePage();
  }
}
