import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_management/screens/about_screen.dart';
import 'package:portfolio_management/screens/bottom_navigation_bar.dart';
import 'package:portfolio_management/screens/dashboard_scren.dart';
import 'package:portfolio_management/screens/login_screen.dart';
import 'package:portfolio_management/screens/my_information_screen.dart';
import 'package:portfolio_management/screens/profile_screen.dart';
import 'package:portfolio_management/screens/register_screen.dart';
import 'package:shake/shake.dart';

import 'screens/Display_screen.dart';

void main() {
  AwesomeNotifications().initialize('resorce://drawable/launcher', [
    NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notification',
        channelDescription: 'Notification channel for basic tests',
        defaultColor: const Color(0xFF9D50DD),
        importance: NotificationImportance.Max,
        ledColor: Colors.white,
        channelShowBadge: true)
  ]);
  // @override
  // void initState() {
  //   super.initState();
  //   ShakeDetector.autoStart(onPhoneShake: () {
  //     Navigator.pushNamed(context, '/blog');
  //   });
  // }

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
        '/aboutus': (contex) => const AboutGoogleMapScreen(),
      },
    ),
  );
}
