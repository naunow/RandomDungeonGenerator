class ModelStage {
  int id;
  String name;
  int column;
  int row;
  String wallTiles;
  int monsterRate;
  int objectRate;
  String monsterIdArray;
  String objectIdArray;

  ModelStage(this.id, this.name, this.column, this.row, this.wallTiles,
      this.monsterRate, this.objectRate, this.monsterIdArray, this.objectIdArray);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'column': column,
      'row': row,
      'wallTiles': wallTiles,
      'monsterRate': monsterRate,
      'objectRate': objectRate,
      'monsterIdArray':monsterIdArray,
      'objectIdArray':objectIdArray,
    };

    return map;
  }

  ModelStage.fromMap(Map<String, dynamic> map){
    id = map['id'];
    name = map['name'];
    column = map['column'];
    row = map['row'];
    wallTiles = map['wallTiles'];
    monsterRate = map['monsterRate'];
    objectRate = map['objectRate'];
    monsterIdArray = map['monsterIdArray'];
    objectIdArray = map['objectIdArray'];
  }
}
