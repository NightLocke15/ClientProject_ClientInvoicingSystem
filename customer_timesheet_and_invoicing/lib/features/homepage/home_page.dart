import 'package:customer_timesheet_and_invoicing/features/timesheet/timesheet_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;
  var pageTitle = '';

  @override
  Widget build(BuildContext context) {
    // Widget page;
    // switch (pageIndex) {
    //   case 0:
    //     page = Timesheet();
    //     break;
    //   case 1:
    //     page = Clients();
    //     break;
    //   case 2: 
    //     page = Settings();
    //     break;
    //   default:
    //     throw UnimplementedError('No page for selected index.');
    // }
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Timesheet'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: TextStyle(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 30,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Theme.of(context).primaryColor,
        shape: Border(
          top: BorderSide.none,
          left: BorderSide.none,
          right: BorderSide.none,
          bottom: BorderSide.none
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: const Text('Home'),
              onTap: () {
            
              },
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              hoverColor: Theme.of(context).primaryColorDark,
            ),
            ListTile(
              title: const Text('Clients'),
              onTap: () {
            
              },
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              hoverColor: Theme.of(context).primaryColorDark,
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
            
              },
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              hoverColor: Theme.of(context).primaryColorDark,
            ),              
          ]
        ),
      ),
      body: Timesheet(),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}