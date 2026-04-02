import 'package:customer_timesheet_and_invoicing/features/timesheet/timesheet_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  String pageTitle = "Timesheet";

  void changePage(int pageNum, String pageName) {
    setState(() {
      pageIndex = pageNum;
      pageTitle = pageName;
    });    
    Navigator.pop(context); 
  }

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (pageIndex) {
      case 0:
        page = Timesheet();        
        break;
      case 1:
        page = Timesheet();
        break;
      case 2: 
        page = Timesheet();        
        break;
      default:
        throw UnimplementedError('No page for selected index.');
    }
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(pageTitle),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: TextStyle(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 30,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        automaticallyImplyLeading: false,
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
              onTap: () => changePage(0, "Timesheet"),
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              hoverColor: Theme.of(context).primaryColorDark,
            ),
            ListTile(
              title: const Text('Clients'),
              onTap: () => changePage(1, "Clients"),
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              hoverColor: Theme.of(context).primaryColorDark,
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () => changePage(2, "Settings"),
              textColor: Theme.of(context).textTheme.bodySmall?.color,
              hoverColor: Theme.of(context).primaryColorDark,
            ),              
          ]
        ),
      ),
      body: page,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}