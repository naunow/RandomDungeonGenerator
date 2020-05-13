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
    var stages = List<Stage>()
    //region Test Stage Data
    ..add(Stage()
      ..name = 'Arena 1'
      ..value = '10'
      ..column = 9
      ..row = 9
      ..wallTiles = [0, 1, 7, 8, 9, 10, 16, 17, 63, 64, 70, 71, 72, 73, 79, 80]
      ..monsters = ([
//        Monster('Troll', Icon(Icons.add), true),
//        Monster('Goblin', Icon(Icons.star), false),
//        Monster('Slime', Icon(Icons.opacity), true)
          ])
      ..objects = ([
//        Object('Object 1', Icon(Icons.style), true),
//        Object('Object 2', Icon(Icons.track_changes), true),
//        Object('Object 3', Icon(Icons.zoom_out_map), false)
      ])
    )
    ..add(Stage()
      ..name = 'Arena 2'
      ..value = '20'
      ..column = 9
      ..row = 9
      ..wallTiles = [0, 8, 72, 80]
      ..monsters = ([
        Monster('Troll', MonstersDemo.goblin_head, true),
        Monster('Golem', MonstersDemo.ice_golem, true),
        Monster('Orge', MonstersDemo.ogre, true)])
      ..objects = ([
        Object('Barrel', ObjectsDemo.barrel, true),
        Object('Brick Wall', ObjectsDemo.brick_wall, true),
        Object('Brick Wall', ObjectsDemo.lava, true),
        Object('Chest', ObjectsDemo.chest, true)
      ])
    )
    ..add(Stage()
      ..name = 'Arena 3'
      ..value = '30'
      ..column = 9
      ..row = 9
      ..wallTiles = [0, 1, 7, 8, 9, 17, 63, 71, 72, 73, 79, 80]
      ..monsters = ([
//        Monster('Troll', Icon(Icons.add_box), false),
//        Monster('Goblin', Icon(Icons.star), true),
//        Monster('Slime', Icon(Icons.opacity), false)
        ])
      ..objects = ([
//        Object('Object 1', Icon(Icons.style), false),
//        Object('Object 2', Icon(Icons.track_changes), false),
//        Object('Object 3', Icon(Icons.zoom_out_map), true)
        ])
      )
    ..add(Stage()
      ..name = 'Arena 4'
      ..value = '30'
      ..column = 9
      ..row = 9
      ..wallTiles = [3, 4, 5, 13, 27, 35, 36, 37, 43, 44, 45, 53, 67, 75, 76, 77]
      ..monsters = ([
//        Monster('Troll', Icon(Icons.add_box), false),
//        Monster('Goblin', Icon(Icons.star), true),
//        Monster('Slime', Icon(Icons.opacity), false)
        ])
      ..objects = ([
//        Object('Object 1', Icon(Icons.style), false),
//        Object('Object 2', Icon(Icons.track_changes), false),
//        Object('Object 3', Icon(Icons.zoom_out_map), true)
      ])
    )
    ..add(Stage()
      ..name = 'Arena 5'
      ..value = '30'
      ..column = 9
      ..row = 9
      ..wallTiles = List<int>()
      ..monsters = ([
//        Monster('Troll', Icon(Icons.add_box), false),
//        Monster('Goblin', Icon(Icons.star), true),
//        Monster('Slime', Icon(Icons.opacity), false)
        ])
      ..objects = ([
//        Object('Object 1', Icon(Icons.style), false),
//        Object('Object 2', Icon(Icons.track_changes), false),
//        Object('Object 3', Icon(Icons.zoom_out_map), true)
      ])
    )
    ..add(Stage()
      ..name = 'Arena 6'
      ..value = '30'
      ..column = 9
      ..row = 9
      ..wallTiles = [0, 8, 9, 17, 18, 19, 25, 26, 28, 34, 46, 52, 54, 55, 61, 62, 63, 71, 72, 80]
      ..monsters = ([
//        Monster('Troll', Icon(Icons.add_box), false),
//        Monster('Goblin', Icon(Icons.star), true),
//        Monster('Slime', Icon(Icons.opacity), false)
        ])
      ..objects = ([
//        Object('Object 1', Icon(Icons.style), false),
//        Object('Object 2', Icon(Icons.track_changes), false),
//        Object('Object 3', Icon(Icons.zoom_out_map), true)
      ])
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
