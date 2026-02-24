import 'package:customer_timesheet_and_invoicing/features/homepage/home_page.dart';
import 'package:customer_timesheet_and_invoicing/features/setup/setup_one.dart';
import 'package:customer_timesheet_and_invoicing/features/setup/setup_three.dart';
import 'package:customer_timesheet_and_invoicing/features/setup/setup_two.dart';
import 'package:flutter/material.dart';

class SetupPage extends StatefulWidget {
  const SetupPage({super.key});

  @override
  _SetupPageState createState() => _SetupPageState();
}

class _SetupPageState extends State<SetupPage> {
  int setupIndex = 0;

  //Bussiness data
  String name = '';
  String bussinessName = '';
  int phoneNumber = 0;
  String email = '';
  int mostRecentInv = 0;
  bool vatRegistered = false;
  int vatNumber = 0;
  int currentVatPerc = 0;

  //Address data
  String streetAddress = '';
  String city = '';
  String suburb = '';
  int postalCode = 0;

  //Bank account data
  String accountHolder = '';
  String bankName = '';
  int branchCode = 0;
  String bicCode = '';
  int accountNumber = 0;

  void updateIndex() {
    setState(() {
      setupIndex ++;
    });
    checkIndex();
  }

  void isVatRegistered(bool? value) {
    setState(() {
      vatRegistered = value ?? false;
    });
  }

  void checkIndex() {
    if (setupIndex > 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      );
    }
  }  

  @override
  Widget build(BuildContext context) {
    Widget setuppage;
    switch (setupIndex) {
      case 0:
        setuppage = SetupOne( 
          onPressed: updateIndex, 
          onChecked: isVatRegistered, 
          vatRegistered: vatRegistered
        );
        break;
      case 1:
        setuppage = SetupTwo( onPressed: updateIndex );
        break;
      case 2: 
        setuppage = SetupThree( onPressed: updateIndex );
        break;
      default:
        throw UnimplementedError('No page for selected index.');
    }
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Setup")
        ),
        backgroundColor: Theme.of(context).primaryColor,
        titleTextStyle: TextStyle(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 500,
            child: Text(
              "All information collected for the sole purpose of generating invoices and statements. Information is only saved locally.",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodySmall?.color,
                fontSize: 16,
              ),
              softWrap: true,
            ),
          ),
          SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Fields marked with * are required",
                  style: TextStyle(
                    color: Theme.of(context).hintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          setuppage,
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}