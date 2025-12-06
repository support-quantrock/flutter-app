import 'package:flutter/material.dart';
import 'ai_picks_page.dart';
import 'forecast_page.dart';
import 'tracker_page.dart';
import 'skill_challenge_page.dart';
import 'portfolio_page.dart';
import '../state/index.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  final List<Widget> _pages = [
    const AiPicksPage(),
    const ForecastPage(),
    const TrackerPage(),
    const SkillChallengePage(),
    const PortfolioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return NavigationBuilder(
      builder: (context, navState) {
        return Scaffold(
          body: IndexedStack(
            index: navState.currentTabIndex,
            children: _pages,
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0A0A0A),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, Icons.auto_awesome, 'AI Picks', navState.currentTabIndex),
                    _buildNavItem(1, Icons.insights, 'Forecast', navState.currentTabIndex),
                    _buildNavItem(2, Icons.track_changes, 'Tracker', navState.currentTabIndex),
                    _buildNavItem(3, Icons.emoji_events, 'Challenge', navState.currentTabIndex),
                    _buildNavItem(4, Icons.account_balance_wallet, 'Portfolio', navState.currentTabIndex),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, int currentIndex) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => appStore.setCurrentTab(index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color(0xFF3B82F6).withValues(alpha: 0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected
                  ? const Color(0xFF3B82F6)
                  : Colors.white.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xFF3B82F6)
                    : Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
