import 'dart:ffi';

import 'package:flutter_novice_village/muyu/history/merit_record.dart';
import 'package:sqflite/sqflite.dart';

class MeritRecordDao {
  final Database database;

  MeritRecordDao(this.database);

  static String tableName = 'merit_record';

  // 执行的SQL语句
  static String tableSql = """
  
  CREATE TABLE $tableName (
    id VARCHAR(64) PRIMARY KEY,
    value INTEGER, 
    image TEXT,
    voice TEXT,
    timestamp INTEGER
  )""";

  /// 创建db
  static Future<void> createTable(Database db) async {
    return db.execute(tableSql);
  }

  /// 插入数据
  Future<int> insert(MeritRecord record) {
    return database.insert(
        tableName,
        record.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// 读取记录列表
  Future<List<MeritRecord>> query() async {
    List<Map<String, Object?>> data = await database.query(
      tableName,
    );
    return data.map((e) => MeritRecord(
        e['id'].toString(),
        e['timestamp'] as int,
        e['value'] as int,
        e['image'].toString(),
        e['voice'].toString(),
    )).toList();
  }
}