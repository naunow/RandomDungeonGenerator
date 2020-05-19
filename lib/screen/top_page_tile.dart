import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/customicon/monsters_demo_icons_icons.dart';
import 'package:randomdungeongenerator/customicon/objects_demo_icons.dart';
import 'package:randomdungeongenerator/viewmodel/Monster.dart';
import 'package:randomdungeongenerator/viewmodel/Object.dart';
import 'package:randomdungeongenerator/viewmodel/Stage.dart';
import 'package:randomdungeongenerator/widget/stage_tile.dart';
import '../common_style.dart';
import 'dungeon_detail.dart';

class TopPageTile extends StatefulWidget {
  @override
  _TopPageTileState createState() => _TopPageTileState();
}

class _TopPageTileState extends State<TopPageTile> {
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
        child: GridView(
          scrollDirection: Axis.vertical,
          //controller: _controller,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: stageTiles(),
        ),
      ),
    );
  }

  stageTiles() {
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

    var stages = List<Stage>()
    //region Test Stage Data
    ..add(Stage()
      ..name = 'Arena Corner'
      ..column = 11
      ..row = 11
      ..wallTiles = arenaCorner
      ..monsters = allMonsters
      ..objects = allObjects
      ..monsterRate = 4
      ..objectRate = 10
    )
    ..add(Stage()
      ..name = 'Arena Circle'
      ..column = 11
      ..row = 11
      ..wallTiles = arenaCircle
      ..monsters = allMonsters
      ..objects = allObjects
      ..monsterRate = 6
      ..objectRate = 10
      )
    ..add(Stage()
      ..name = 'Arena X'
      ..column = 11
      ..row = 11
      ..wallTiles = arenaX
      ..monsters = allMonsters
      ..objects = allObjects
      ..monsterRate = 10
      ..objectRate = 12
    )
    ..add(Stage()
      ..name = 'Arena Flat'
      ..column = 11
      ..row = 11
      ..wallTiles = []
      ..monsters = allMonsters
      ..objects = allObjects
      ..monsterRate = 12
      ..objectRate = 12
    )
    ..add(Stage()
      ..name = 'Arena Labyrinth'
      ..column = 11
      ..row = 11
      ..wallTiles = arenaLabyrinth
      ..monsters = allMonsters
      ..objects = allObjects
      ..monsterRate = 14
      ..objectRate = 14
      //endregion
    );

    var widget = List<Widget>();

    for (var stage in stages) {
      widget.add(StageTile(
        text: stage.name,
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DungeonPage(stage);
          }));
        },
      ));
    }

    return widget;
  }
}
