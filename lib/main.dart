import 'package:flutter/material.dart';

import 'screens/Display_screen.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const DisplayScreen(),
      },
    ),
  );
}
