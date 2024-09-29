import 'package:flutter/material.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final List<Map<String, dynamic>> menu;
  final Function(int) onChanged;
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.menu,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 4.0,
      selectedFontSize: 12,
      onTap: onChanged,
      currentIndex: currentIndex,
      fixedColor: AppTheme.primaryColor,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFFFFFFFF),
      unselectedLabelStyle: const TextStyle(color: Color(0xFF252525)),
      items: [
        ...menu.map(
          (e) => BottomNavigationBarItem(
            icon: Icon(e['icon'], color: const Color(0xFF252525)),
            activeIcon: Icon(e['icon'], color: AppTheme.primaryColor),
            label: e['title'],
            tooltip: e['title'],
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
