import 'dart:math';
import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/customicon/objects_demo_icons.dart';
import 'package:randomdungeongenerator/screen/dungeon_create.dart';
import 'package:randomdungeongenerator/viewmodel/Stage.dart';
import '../common_style.dart';
import '../widget/icon_list_row.dart';

class DungeonPage extends StatelessWidget {
  //final dungeonData;
  final Stage stage;

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
          title: Text(this.stage.name),
          backgroundColor: Color(0xFFB388FF),
          //elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
//          ),
          child: ListView(padding: EdgeInsets.all(20), children: <Widget>[
            Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.only(top: 20),
                  height: 400,
                  child: myGridViewBuilder(stage),
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

  myGridViewBuilder(Stage stage) {
    // Disables scrolling in GridView.
    return IgnorePointer(
      child: GridView.builder(
          itemCount: stage.column * stage.row,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: stage.row),
          itemBuilder: (context, index) {
            var thisWidth = double.infinity;
            return
//              Container(
//              alignment: Alignment.topLeft,
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.black45),
//              ),
//              child: putTile(20, index, stage),
//            );
//              Flex(direction: Axis.vertical,
//                children: <Widget>[
//                  Expanded(child: FittedBox(
//                      fit: BoxFit.fill, child: Icon(putTile(20, index, stage))))
//                ],);
              Flex(direction: Axis.vertical,
                children: <Widget>[
                  Expanded(child: FittedBox(
                      fit: BoxFit.fill, child: putTile(20, index, stage)))
                ],);

          }),
    );
  }

  /// put walls, objects and monsters tiles on the stage.
  putTile(int rate, int count, Stage stage) {
    int monsterSpawnedArea = stage.row * (stage.row - 3);
    var objectRate = Random().nextInt(100);
    var monsterRate = Random().nextInt(100);

    // get rid of wall tiles.
    if (stage.wallTiles.contains(count)) {
      return Container(constraints: BoxConstraints.loose(Size(8, 8)), color: Colors.black54);
    }

    // return random objects if the rate is greater than object rate.
    if (objectRate < rate) {
      var activeObj = stage.objects.where((obj) => obj.checked == true).toList();
      return Icon(activeObj[Random().nextInt(activeObj.length)].icon);
    }
    // return random monsters if the rate is greater than monster rate.
    else if (monsterRate < rate && count < monsterSpawnedArea) {
      var activeMonsters =
          stage.monsters.where((monster) => monster.checked == true).toList();
      return Icon(activeMonsters[Random().nextInt(activeMonsters.length)].icon);
    }
    // return empty.
    else {
      return Icon(null);
    }
  }
}