import 'package:customer_timesheet_and_invoicing/data/app_database.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class TimesheetTaskCreationServices {
  Future<void> createTimesheetTask(Map<String, dynamic> values) async {
    final db = await AppDatabase.instance.database;
    await db.insert(
      'tasks_completed',
      values,
      conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<List<Map<String, dynamic>>> getTimesheetTasks() async {
    final db = await AppDatabase.instance.database;
    final result = await db.query('tasks_completed');
    return result;
  }

  Future<int> deleteTimehseetTask(int? id) async {
    final db = await AppDatabase.instance.database;
    return await db.delete(
      'tasks_completed',
      where: 'id = ?',
      whereArgs: [id],  
    );
  }

  Future<int> updateTimesheetTask(int? id, Map<String, dynamic> values) async {
    final db = await AppDatabase.instance.database;
    return await db.update(
      'tasks_completed',
      values,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}