import 'package:flutter/material.dart';
import 'Clients/clients_list.dart';
import 'Clients/clients_page.dart';
import 'Settings/settings_page.dart';
import 'Setup/setup_page.dart';
import 'Timesheet/main_timesheet.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        title: 'Customer Timesheet and Invoicing',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        ),
        home: HomePage(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {

}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (pageIndex) {
      case 0:
        page = MainTimeSheet();
        break;
      case 1: 
        page = ClientList();
        break;
      case 2: 
        page = ClientPage();
        break;
      case 3: 
        page = SettingsPage();
        break;
      default:
        throw UnimplementedError('No page for the selected page.');
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Row(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              )
            ]
          )
        );
      }
    );
  }
}

