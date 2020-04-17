import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:EiSHT/models/goalModel.dart';

class GoalDatabase {
  static final GoalDatabase _instance = GoalDatabase._();
  static Database _database;

  GoalDatabase._();

  factory GoalDatabase() {
    return _instance;
  }

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }

    _database = await init();

    return _database;
  }

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dbPath = join(directory.path, 'journal_db');
    var database = openDatabase(dbPath,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);

    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE goals (
        id INTEGER PRIMARY KEY,
        name TEXT,
        mini TEXT,
        description TEXT,
        percentageComplete FLOAT,
        endDay TEXT,
        dateNow TEXT)
    ''');
    print("Goals was created!");
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    // Run migration according database versions
  }

  Future<int> addGoal(Goal goal) async {
    var client = await db;
    return client.insert('goals', goal.toMapForDb(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Goal> fetchGoal(int id) async {
    var client = await db;
    final Future<List<Map<String, dynamic>>> futureMaps =
        client.query('goals', where: 'id = ?', whereArgs: [id]);
    var maps = await futureMaps;

    if (maps.length != 0) {
      return Goal.fromDb(maps.first);
    }

    return null;
  }

  Future<List<Goal>> fetchAll() async {
    var client = await db;
    var res = await client.query('goals');

    if (res.isNotEmpty) {
      var goals = res.map((goalMap) => Goal.fromDb(goalMap)).toList();
      return goals;
    }
    return [];
  }

  Future<int> updateGoal(Goal newGoal) async {
    var client = await db;
    return client.update('goals', newGoal.toMapForDb(),
        where: 'id = ?',
        whereArgs: [newGoal.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeGoal(int id) async {
    var client = await db;
    return client.delete('goals', where: 'id = ?', whereArgs: [id]);
  }

  Future closeDb() async {
    var client = await db;
    client.close();
  }
}
