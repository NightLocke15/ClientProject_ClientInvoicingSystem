import 'package:customer_timesheet_and_invoicing/features/homepage/home_page.dart';
import 'package:flutter/material.dart';

class CTIApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CTI App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(43, 43, 43, 100),
        primaryColorDark: Color.fromRGBO(26, 26, 26, 100),
      ),
      home: HomePage(),
    );
  }
}