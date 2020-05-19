import 'dart:ffi';
import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:randomdungeongenerator/model/model_stage.dart';
import 'package:randomdungeongenerator/viewmodel/Stage.dart';
import 'package:sqflite/sqflite.dart';

class DbProvider {
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String COLUMN = 'column';
  static const String ROW = 'row';
  static const String WALLTILES = 'wallTiles';
  static const String MONSTERRATE = 'monsterRate';
  static const String OBJECTRATE = 'objectRate';
  static const String TABLE = 'Stage';
  static const String DB_NAME = 'stage.db';

  //Database db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await init();
    return _db;
  }

  init() async {
    var documentDir = await getDatabasesPath();
    final path = join(documentDir, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute("""
    CREATE TABLE $TABLE 
      (
        $ID INTEGER PRIMARY KEY,
        $NAME TEXT,
        $COLUMN INTEGER,
        $ROW INTEGER,
        $WALLTILES TEXT,
        $MONSTERRATE INTEGER,
        $OBJECTRATE INTEGER
      )
    """);
  }

  Future<ModelStage> save(ModelStage stage) async {
    var dbClient = await db;
    stage.id = await dbClient.insert(TABLE, stage.toMap());
    return stage;
  }

  Future<List<ModelStage>> getStages() async {
    var dbClient = await db;
    //List<Map> maps = await dbClient.query(TABLE, columns: [ID, TABLE]);
    var countSql = await dbClient.rawQuery("SELECT COUNT(*) FROM $TABLE");
//    if (countSql[0]['COUNT(*)'] == 2) {
//
////    var newStage = ModelStage(null, 'TEST ARENA', 11, 11, '[12,20,100,108]', 13, 16);
////      var newStage = ModelStage(null, 'Arena Corner', 11, 11, '[12,20,100,108]', 4, 10);
////      save(newStage);
//      save(ModelStage(null, 'Arena Corner', 11, 11, '[12,20,100,108]', 4, 10));
//      save(ModelStage(null, 'Arena Circle', 11, 11, '[12,13,19,20,23,31,89,97,100,101,107,108]', 6, 10));
//      save(ModelStage(null, 'Arena X', 11, 11, '[15,16,17,27,45,53,56,57,63,64,67,75,93,103,104,105]', 10, 12));
//      save(ModelStage(null, 'Arena Flat', 11, 11, '[]', 12, 12));
//      save(ModelStage(null, 'Arena Labyrinth', 11, 11, '[12,20,23,31,34,35,41,42,46,52,68,74,78,79,85,86,89,97,100,108]', 14, 14));
//    }

    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<ModelStage> stages = [];
    if (maps.length > 0) {
      for (var i = 0; i < maps.length; i++) {
        stages.add(ModelStage.fromMap(maps[i]));
      }
    }
    return stages;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }

  Future<int> update(ModelStage stage) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, stage.toMap(),
        where: '$ID = ?', whereArgs: [stage.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

}
