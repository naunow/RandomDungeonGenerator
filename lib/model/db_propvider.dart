import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:randomdungeongenerator/model/model_stage.dart';
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
