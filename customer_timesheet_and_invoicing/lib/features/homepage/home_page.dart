import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var pageIndex = 0;

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
      appBar: AppBar(),
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
            Container(
              child: ListTile(
                title: const Text('Home'),
                onTap: () {
              
                },
                textColor: Colors.white,
                hoverColor: Theme.of(context).primaryColorDark,
              ),
            ),
            Container(
              child: ListTile(
                title: const Text('Clients'),
                onTap: () {
              
                },
                textColor: Colors.white,
                hoverColor: Theme.of(context).primaryColorDark,
              ),
            ),
            Container(
              child: ListTile(
                title: const Text('Settings'),
                onTap: () {
              
                },
                textColor: Colors.white,
                hoverColor: Theme.of(context).primaryColorDark,
              ),
            ),
          ]
        ),
      ),
    );
  }
}