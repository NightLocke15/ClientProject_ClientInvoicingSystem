import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:customer_timesheet_and_invoicing/features/CTI app/cti_app.dart';
import 'data/app_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  final db = await AppDatabase.instance.database;

  final isSetupComplete = await _isProfileCreated(db);

  runApp(CTIApp(isSetupComplete: isSetupComplete));
} 

Future<bool> _isProfileCreated(Database db) async {
  final result = await db.query(
    'meta',
    where: 'key = ?',
    whereArgs: ['profile_created'],
  );
  return result.isNotEmpty;
}