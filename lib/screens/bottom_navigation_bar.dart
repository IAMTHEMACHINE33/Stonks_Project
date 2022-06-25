import 'package:flutter/material.dart';
import 'package:portfolio_management/screens/Stats_screen.dart';
import 'package:portfolio_management/screens/profile_screen.dart';

import 'Trend_screen.dart';
import 'dashboard_scren.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _selectedIndex = 0;

  List<Widget> lstWidget = [
    const DashboardScreen(),
    const TrendScreen(),
    const StatsScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: lstWidget[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.fireplace_outlined), label: 'Trends'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_chart_outlined), label: 'Stats'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account')
        ],
        backgroundColor: Colors.amber[100],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        elevation: 10,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
