import 'dart:async';

import 'package:eduasistogrenci/models/BildirimData.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BildirimlerLocalDb {
  final String dbName = "raporlar.db";
  final String tableName = "bildirimler";

  Future<Database> open() async {
    return getDatabasesPath().then((_path) async {
      String path = join(_path, dbName);
      return openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute('''
        create table $tableName (
          id integer primary key autoincrement, 
          title text,
          endpoint text,
          content text,
          done integer not null)
        ''');
      });
    });
  }

  Future<int> insert(Database db, BildirimData bildirimData) async {
    return db.insert(tableName, bildirimData.toMap());
  }

  Future<List<BildirimData>> getAll(Database db) async {
    List<Map> maps = await db.query(tableName);
    return maps.map((b) => BildirimData.fromMap(b)).toList().reversed.toList();
  }

  Future<int> setDoneSuccess(Database db, BildirimData bildirimData) async {
    return await db.update(tableName, bildirimData.toMap(),
        where: 'id = ?', whereArgs: [bildirimData.id]);
  }

  Future<int> clearData(Database db) async {
    return await db.delete(tableName).then((value) {
      return value;
    });
  }
}
