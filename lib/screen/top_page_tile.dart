import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/customicon/monsters_demo_icons_icons.dart';
import 'package:randomdungeongenerator/customicon/objects_demo_icons.dart';
import 'package:randomdungeongenerator/model/db_propvider.dart';
import 'package:randomdungeongenerator/model/model_stage.dart';
import 'package:randomdungeongenerator/viewmodel/Monster.dart';
import 'package:randomdungeongenerator/viewmodel/Object.dart';
import 'package:randomdungeongenerator/viewmodel/Stage.dart';
import 'package:randomdungeongenerator/widget/stage_tile.dart';
import '../common_style.dart';
import 'dungeon_detail.dart';
import 'package:flutter/services.dart' show rootBundle;

class TopPageTile extends StatefulWidget {
  @override
  _TopPageTileState createState() => _TopPageTileState();
}

class _TopPageTileState extends State<TopPageTile> {
var stages = DbProvider().getModelStages();

  var allMonsters = [
    Monster('Goblin', MonstersDemo.goblin_head, true),
    Monster('Golem', MonstersDemo.ice_golem, true),
    Monster('Orge', MonstersDemo.ogre, true),
    Monster('Orc', MonstersDemo.orc_head, true)];

  var allObjects = [
    Object('Barrel', ObjectsDemo.barrel, true),
    Object('Brick Wall', ObjectsDemo.brick_wall, true),
    Object('Lava', ObjectsDemo.lava, true),
    Object('Chest', ObjectsDemo.chest, true),
    Object('Spiky pit', ObjectsDemo.spiky_pit, true),
    Object('Spill', ObjectsDemo.spill, true)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.3, 0.6, 0.9],
              colors: kGradient),
        ),
        child: FutureBuilder(future: stages,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Stage> stages = _convertToStage(snapshot.data);

              var widgets = List<Widget>();

              for (var stage in stages) {
                widgets.add(StageTile(
                  text: stage.name,
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return DungeonPage(stage);
                    }));
                  },
                ));
              }
              return GridView(
                scrollDirection: Axis.vertical,
                //controller: _controller,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                children: widgets,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },),
    ),);
  }

  /// Convert ModelStage class to Stage class.
  List<Stage> _convertToStage(List<ModelStage> modelStages) {
    List<Stage> stages =[];
    for (var modelStage in modelStages) {
      // Get wall tile list.
      var wallList = modelStage.wallTiles.split(',');
      List<int> intWallList= [];
      wallList.forEach((wall) =>
      wall == "" ? null : intWallList.add(int.parse(wall)));

      stages.add(Stage()
        ..id = modelStage.id
        ..name = modelStage.name
        ..column = modelStage.column
        ..row = modelStage.row
        ..wallTiles = intWallList
        ..monsterRate = modelStage.monsterRate
        ..objectRate = modelStage.objectRate
//        ..monsters = allMonsters
//        ..objects = allObjects
        ..monsters = _getMonsterList(modelStage.monsterIdArray)
        ..objects = allObjects
      );
    }
    return stages;
  }

List<int> _getArray(String array) {
  var stringArray = array.split(',');
  List<int> intArray = [];
  stringArray.forEach((s) => s == "" ? null : intArray.add(int.parse(s)));
  return intArray;
}

List<Monster> _getMonsterList(String array) {
  var monsterIDs = _getArray(array);

  var stageMonsters = List<Monster>();
  var stringData = _loadAVaultAsset('source/monster.json').then((json) =>
  stageMonsters = _getStageMonsters(json, monsterIDs));
  return stageMonsters;
}

_getStageMonsters(String json, List<int> intArray) {
  var stageMonsters = List<Monster>();
  var monsterJson = jsonDecode(json);
  for (var i = 0; i < monsterJson['monster'].length; i++) {
    var m = monsterJson['monster'][i];
    if (intArray.contains(int.parse(m['id']))) {
      var monster = Monster(m['name'], IconData(
          int.parse(m['icon']), fontFamily: m['iconFileName'],
          fontPackage: null),
          true);
      stageMonsters.add(monster);
    }
  }
  return stageMonsters;
}

Future<String> _loadAVaultAsset(String url) async {
  return await rootBundle.loadString(url);
}

List<Object> _getObjectList(String array) {
  var intArray = _getArray(array);
  var stringData = rootBundle.loadString('source/object.json').toString();
  var objectJson = jsonDecode(stringData);
  var stageObjects = List<Object>();

  for (var m in objectJson) {
    if (intArray.contains(m.id)) {
      var obj = Object(m.name, IconData(
          int.parse(m.icon), fontFamily: m.iconFileName, fontPackage: null),
          true);
      stageObjects.add(obj);
    }
  }
  return stageObjects;
}
}
