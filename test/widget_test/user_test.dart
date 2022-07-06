import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_management/screens/bottom_navigation_bar.dart';
import 'package:portfolio_management/screens/login_screen.dart';
import 'package:portfolio_management/screens/register_screen.dart';

void main() {
  testWidgets('Login Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      routes: {'/nav': (context) => const BottomNavigationBarScreen()},
      home: const LoginScreen(),
    ));

    Finder txtEmail = find.byKey(const ValueKey('txtEmail'));
    await tester.enterText(txtEmail, 'a');

    Finder txtPassword = find.byKey(const ValueKey('txtPassword'));
    await tester.enterText(txtPassword, 'a');

    Finder btnLogin = find.byKey(const ValueKey('btnLogin'));
    await tester.tap(btnLogin);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.home), findsNothing);
  });

  testWidgets(
    "Registering",
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        routes: {
          "/login": (context) => const LoginScreen(),
        },
        home: const RegisterScreen(),
      ));
      Finder firstName = find.byKey(const ValueKey("txtFirstname"));
      await tester.enterText(firstName, 't');
      Finder lastName = find.byKey(const ValueKey("txtLastName"));
      await tester.enterText(lastName, "t");
      Finder age = find.byKey(const ValueKey("txtAge"));
      await tester.enterText(age, "3");
      Finder userName = find.byKey(const ValueKey("txtUsername"));
      await tester.enterText(userName, "t");
      Finder email = find.byKey(const ValueKey("txtEmail"));
      await tester.enterText(email, "t");
      Finder password = find.byKey(const ValueKey("txtPassword"));
      await tester.enterText(password, "t");
      Finder btnSignUp = find.byKey(const ValueKey("btnRegister"));
      await tester.tap(btnSignUp);
      await tester.pumpAndSettle();
      expect(find.text('Register Success'), findsOneWidget);
    },
  );
}
