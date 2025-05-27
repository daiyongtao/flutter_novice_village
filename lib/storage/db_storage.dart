
import 'package:flutter_novice_village/storage/dao/merit_record_dao.dart';
import 'package:sqflite/sqflite.dart';

class DbStorage {
  DbStorage._();

  static DbStorage? _storage;

  static DbStorage get instance {
    _storage = _storage ?? DbStorage._();
    return _storage!;
  }

  /// 数据库
  late Database _db;

  late MeritRecordDao _meritRecordDao;

  MeritRecordDao get meritRecordDao => _meritRecordDao;

  /// 开启数据库
  Future<void> open() async {
    String path = await getDatabasesPath();
    String dbPath = '$path/first_station.db';
    _db = await openDatabase(dbPath, version: 1, onCreate: _onCreate);
    _meritRecordDao = MeritRecordDao(_db);
  }

  // /// 开启数据库
  // void open() async {
  //
  // }

  void _onCreate(Database db, int version) async {
    await MeritRecordDao.createTable(db);
  }
}