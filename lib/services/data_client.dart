import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quran/model/adkar_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataClient {
  final String _databaseName = "tadabrApp.db";

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    print('db == null => ${_database == null}');
    // lazily instantiate the db the first time it is accessed
    await initDatabase();
    _database = await _openDatabase(_databaseName);
    print('db == null => ${_database == null}');
    return _database;
  }

  Future _openDatabase(String fileName) async {
    String databasePath = await getDatabasesPath();
    var path = join(databasePath, fileName);
    return openDatabase(path, version: 1);
  }

  Future initDatabase() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, _databaseName);
    bool exists = await databaseExists(path);
    if (!exists) {
      print("Creating new copy from asset");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets/data", _databaseName));
      List<int> bytes =
          data.buffer.asInt8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
  }

  Future<List<Adkar>> query(
      {required String tableName, String? where, List? whereArgs}) async {
    debugPrint('query function called');
    Database? db = await database;
    var data = await db!.query(tableName, where: where, whereArgs: whereArgs);
    return data.map((e) => Adkar.fromJson(e)).toList();
  }

  Future<int> insert(String tableName, Map<String, dynamic> values) async {
    debugPrint('insert function called');
    Database? db = await database;

    return await db!.insert(tableName, values);
  }

  Future<int> delete(String tableName, int whereId) async {
    debugPrint('delete function called');
    Database? db = await database;
    return await db!.delete(tableName, where: 'id = ?', whereArgs: [whereId]);
  }

  Future<int> update(
      {required String tableName,
      required Map<String, dynamic> values,
      required int whereId}) async {
    debugPrint('delete function called');
    Database? db = await database;
    return await db!
        .update(tableName, values, where: 'id = ?', whereArgs: [whereId]);
  }

  // static Future<int> deleteAll() async {
  //   debugPrint('delete function called');
  //   return await _db!.delete(_tableName);
  // }

  // static Future<int> updateIsCompleted(
  //     {required int isCompleted, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET isCompleted = ?
  //   WHERE id = ?
  //   ''', [isCompleted, id]);
  // }

  // static Future<int> updateTitle(
  //     {required String title, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET title = ?
  //   WHERE id = ?
  //   ''', [title, id]);
  // }

  // static Future<int> updateColor({required int color, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET color = ?
  //   WHERE id = ?
  //   ''', [color, id]);
  // }

  // static Future<int> updateRepeat(
  //     {required String repeat, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET repeat = ?
  //   WHERE id = ?
  //   ''', [repeat, id]);
  // }

  // static Future<int> updateTime(
  //     {required String? time, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET startTime = ?
  //   WHERE id = ?
  //   ''', [time, id]);
  // }

  // static Future<int> updateDate({required String date, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET date = ?
  //   WHERE id = ?
  //   ''', [date, id]);
  // }

  // static Future<int> updateNote({required String note, required int id}) async {
  //   return await _db!.rawUpdate('''
  //   UPDATE $_tableName
  //   SET note = ?
  //   WHERE id = ?
  //   ''', [note, id]);
  // }
}
