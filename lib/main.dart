import 'package:flutter/material.dart';
import 'package:portfolio_management/screens/bottom_navigation_bar.dart';
import 'package:portfolio_management/screens/dashboard_scren.dart';
import 'package:portfolio_management/screens/login_screen.dart';
import 'package:portfolio_management/screens/my_information_screen.dart';
import 'package:portfolio_management/screens/profile_screen.dart';
import 'package:portfolio_management/screens/register_screen.dart';

import 'screens/Display_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DisplayScreen(),
        '/nav': (context) => const BottomNavigationBarScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/myinformation': (context) => const MyInformationScreen(),
      },
    ),
  );
}
