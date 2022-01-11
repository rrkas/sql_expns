import 'dart:io';
//import 'dart:math';

import 'package:first_page/models/details.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = 'DetailsData.db';
  static const _databaseVersion = 1;

  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  Database? _database;

  Database? get database {
    if (_database != null) return _database;
    _database = _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    return await openDatabase(
        dbPath, version: _databaseVersion, onCreate: _onCreateDB);
  }

  _onCreateDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE ${Details.tblDetails}(
    ${Details.tblId} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${Details.tblItemslist} TEXT NOT NULL,
    ${Details.tblItems} TEXT NOT NULL,
    ${Details.tblAmount} TEXT NOT NULL,
    ${Details.tblDate} TEXT NOT NULL
    )
    ''');
  }

  Future<int> insertDetails(Details details) async {
    Database? db = await database;
    return await db!.insert(Details.tblDetails, details.toMap());
  }

  Future<int> updateDetails(Details details) async {
    Database? db = await database;
    return await db!.update(Details.tblDetails, details.toMap(),
    where: '${Details.tblId}=?' , whereArgs: [details.id]);
  }

  Future<int> deleteDetails(id) async {
    Database? db = await database;
    return await db!.delete(Details.tblDetails,
        where: '${Details.tblId}=?' , whereArgs: [id]);
  }

  Future<List<Details>> fetchDetail() async {
    Database? db = await database;
    List<Map<String,dynamic>> detail = await db!.query(Details.tblDetails);
    return detail.isEmpty
        ? []
        : detail.map((e) => Details.fromMap(e)).toList();
  }
}