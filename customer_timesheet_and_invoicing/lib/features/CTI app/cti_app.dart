import 'package:customer_timesheet_and_invoicing/features/auth/login_page.dart';
import 'package:customer_timesheet_and_invoicing/features/setup/setup_page.dart';
import 'package:flutter/material.dart';

class CTIApp extends StatelessWidget {
  final bool isSetupComplete;

  const CTIApp({super.key, required this.isSetupComplete});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTI App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(43, 43, 43, 100),
        primaryColorDark: Color.fromRGBO(26, 26, 26, 100),
        primaryColorLight: Color.fromRGBO(74, 74, 74, 100),
        highlightColor: Color.fromRGBO(187, 187, 187, 1),
        hintColor: Color.fromRGBO(255, 0, 0, 1),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          )
        )
      ),
      home: isSetupComplete ? LoginPage() : SetupPage(),
    );
  }
}