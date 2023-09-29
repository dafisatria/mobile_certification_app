import 'dart:io';

import 'package:mobile_certification_app/model/income_model.dart';
import 'package:mobile_certification_app/model/outcome_model.dart';
import 'package:mobile_certification_app/model/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseInstance {
  final _databaseName = 'my_databases.db';
  final int _databaseVersion = 1;

  final String table = 'user';
  final String idUser = 'id';
  final String userName = 'username';
  final String password = 'password';

  //income table
  final String tableIncome = 'income';
  final String idIncome = 'id';
  final String date = 'date';
  final String nominal = 'nominal';
  final String desc = 'desc';

  //outcome table
  final String tableOutcome = 'outcome';
  final String idOutcome = 'id';
  final String dateOut = 'date';
  final String nominalOut = 'nominal';
  final String descOut = 'desc';

  Database? _database;
  Future<Database> database() async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableIncome ($idIncome INTEGER PRIMARY KEY, $date TEXT, $nominal INTEGER, $desc TEXT)');
    await db.execute(
        'CREATE TABLE $tableOutcome ($idOutcome INTEGER PRIMARY KEY, $dateOut TEXT, $nominalOut INTEGER, $descOut TEXT)');
  }

  Future<List<IncomeModel>> all() async {
    final data = await _database!.query(tableIncome);
    List<IncomeModel> result =
        data.map((e) => IncomeModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableIncome, row);
    print(query);
    return query;
  }

  Future<List<OutcomeModel>> allOut() async {
    final data = await _database!.query(tableOutcome);
    List<OutcomeModel> result =
        data.map((e) => OutcomeModel.fromJson(e)).toList();
    print(result);
    return result;
  }

  Future<int> insertOut(Map<String, dynamic> row) async {
    final query = await _database!.insert(tableOutcome, row);
    print(query);
    return query;
  }

  Future getTotalIncome() async {
    var result = await _database!.rawQuery("SELECT SUM(nominal) FROM income");
    var value = result[0]["SUM(nominal)"];
    return value.toString();
  }

  Future getTotalOutcome() async {
    var result = await _database!.rawQuery("SELECT SUM(nominal) FROM outcome");
    var value = result[0]["SUM(nominal)"];
    return value.toString();
  }
}
