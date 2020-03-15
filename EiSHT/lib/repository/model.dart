

import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
Database db;

class DatabaseCreator{
  static const journalTable = 'journal';
  static const id = 'id';
  static const body = 'body';
  static const date = 'date';
  static const isDeleted = 'isDeleted';

  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult, int insertAndUpdateQueryResult, List<dynamic> params]) {
    print(functionName);
    print(sql);
    if (selectQueryResult != null) {
      print(selectQueryResult);
    } else if (insertAndUpdateQueryResult != null) {
      print(insertAndUpdateQueryResult);
    }
    }

  Future<void> createJournalTable(Database db) async {
    final journalSql = '''CREATE TABLE $journalTable
    (
      $id INTEGER PRIMARY KEY,
      $body TEXT,
      $date TEXT,
      $isDeleted BIT NOT NULL
    )''';

    await db.execute(journalSql);
  }

  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path);
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath('journal_db');
    db = await openDatabase(path, version: 1, onCreate: onCreate);
    print(db);
  }

  Future<void> onCreate(Database db, int version) async {
    await createJournalTable(db);
  }
}