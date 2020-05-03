import 'dart:math';
import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/screen/dungeon_create.dart';
import '../common_style.dart';
import '../widget/icon_list_row.dart';

class DungeonPage extends StatelessWidget {
  //final dungeonData;
  final String stage;

  DungeonPage(this.stage);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.3, 0.6, 0.9],
          colors: kGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(this.stage),
          backgroundColor: Color(0xFFB388FF),
          //elevation: 0.0,
        ),
        body: Container(
            color: Colors.white,
//          ),
          child: ListView(padding: EdgeInsets.all(20),
              children: <Widget>[
                Column(
                  verticalDirection: VerticalDirection.down,
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 20),
                      height: 400,
                      child: myGridViewBuilder(),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shuffle),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ),
                    LabelContainer(labelText: 'Monsters'),
                    IconNameRow(
                      icon: Icons.star,
                      text: 'Star',
                    ),
                    IconNameRow(
                      icon: Icons.train,
                      text: 'Train',
                    ),
                    IconNameRow(
                      icon: Icons.person,
                      text: 'Person',
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    LabelContainer(labelText: 'Objects'),
                    IconNameRow(
                      icon: Icons.style,
                      text: 'Camping',
                    ),
                    IconNameRow(
                      icon: Icons.audiotrack,
                      text: 'Sound',
                    ),
                    IconNameRow(
                      icon: Icons.lock,
                      text: 'Lock',
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Button(
                      buttonText: 'EDIT',
                      pushPage: NewDungeon(),
                    ),
                  ],
                ),
              ]),
          //myGridViewBuilder(dungeonController); //Text('aa');
        ),
      ),
    );
  }

  myGridViewBuilder() {
    // Disables scrolling in GridView.
    return IgnorePointer(
      child: GridView.builder(
          itemCount: 81,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45),
              ),
              child: putTile(20, index, 9, getStagePreset(stage)),
            );
          }),
    );
  }

  /// get stage presets from common_style.
  getStagePreset(String stagePreset) {
    switch (stagePreset) {
      case stageCorners:
        return [0, 1, 7, 8, 9, 10, 16, 17, 63, 64, 70, 71, 72, 73, 79, 80];
        break;

      case stageSingleCorners:
        return [0, 8, 72, 80];
        break;

      case stageCircle:
        return [0, 1, 7, 8, 9, 17, 63, 71, 72, 73, 79, 80];
        break;

      case stageFlat:
        return List<int>();
        break;

      case stageX:
        return [3, 4, 5, 13, 27, 35, 36, 37, 43, 44, 45, 53, 67, 75, 76, 77];
        break;

      case stageArena:
        return [0, 8, 9, 17, 18, 19, 25, 26, 28, 34, 46, 52, 54, 55, 61, 62, 63, 71, 72, 80];
        break;

      default:
        return List<int>();
        break;
    }
  }

  /// put walls, objects and monsters tiles on the stage.
  putTile(int rate, int count, int rowLength, List<int> wallTiles) {
    int monsterSpawnedArea = rowLength * (rowLength - 3);
    var objectRate = Random().nextInt(100);
    var monsterRate = Random().nextInt(100);

    // get rid of wall tiles.
    if (wallTiles.contains(count)) {
      return Container(color: Colors.black54);
    }

    // return random objects if the rate is greater than object rate.
    if (objectRate < rate) {
      return Icon(Icons.star);
    }
    // return random monsters if the rate is greater than monster rate.
    else if (monsterRate < rate && count < monsterSpawnedArea) {
      return Icon(Icons.person);
    }
    // return empty.
    else {
      return null;
    }
  }
}

class GridItem {
  final String itemName;
  final Icon itemIcon;

  GridItem(this.itemName, this.itemIcon);
}
