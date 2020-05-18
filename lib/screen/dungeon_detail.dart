import 'dart:math';
import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/screen/dungeon_create.dart';
import 'package:randomdungeongenerator/viewmodel/GridItem.dart';
import 'package:randomdungeongenerator/viewmodel/Stage.dart';
import '../common_style.dart';
import '../widget/icon_list_row.dart';

class DungeonPage extends StatefulWidget {
  //final dungeonData;
  final Stage stage;

  DungeonPage(this.stage);

  @override
  _DungeonPageState createState() => _DungeonPageState();
}

class _DungeonPageState extends State<DungeonPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var padding = 20.0;
    var width = size.width - (padding * 2);
    var stageAspect = widget.stage.row.toDouble() / widget.stage.column.toDouble();

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
          title: Text(this.widget.stage.name),
          backgroundColor: Color(0xFFB388FF),
          //elevation: 0.0,
        ),
        body: Container(
          color: Colors.white,
//          ),
          child: ListView(padding: EdgeInsets.all(padding), children: [
            Column(
              verticalDirection: VerticalDirection.down,
              children: [
                Container(
                  color: Colors.black,
                  margin: EdgeInsets.only(top: 20),
                  height: width * stageAspect,
                  child: myGridViewBuilder(widget.stage),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {setState(() {
                      // shuffle Tiles
                    });},
                    icon: Icon(Icons.shuffle),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down),
                  ),
                ),
                Divider(),
                LabelContainer(labelText: 'Monsters'),
                iconLabel(widget.stage.monsters),
                SizedBox(
                  height: 24,
                ),
                Divider(),
                LabelContainer(labelText: 'Objects'),
                iconLabel(widget.stage.objects),
                SizedBox(
                  height: 50,
                ),
                Visibility(
                  visible: false,
                  child: Button(
                    buttonText: 'EDIT',
                    pushPage: NewDungeon(),
                  ),
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
              crossAxisCount: stage.column),
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
//                border: Border.all(color: Colors.black,),
                color: Colors.black
              ),
              child: Flex(direction: Axis.vertical,
                children: <Widget>[
                  Expanded(child: FittedBox(
                      fit: BoxFit.fill, child: putTile(index, stage)))
                ],),
            );
          }),
    );
  }

  /// put walls, objects and monsters tiles on the stage.
  putTile(int count, Stage stage) {
    int heroSpawnedArea = stage.column * (stage.row - 2) + 1;
    int monsterSpawnedArea = stage.column * (stage.row - 4);
    var objectRate = Random().nextInt(100);
    var monsterRate = Random().nextInt(100);

    // get rid of wall tiles.
    if (stage.wallTiles.contains(count) || stage.defaultWallTiles.contains(count)) {
      return Container(
          constraints: BoxConstraints.tight(Size(200, 200)),
//          color: Colors.black,
      );
    }

    if(count > heroSpawnedArea){
      return Container(margin: EdgeInsets.all(1),color: Colors.white, child: Icon(null));
    }

    // return random objects if the rate is greater than object rate.
    if (objectRate < stage.objectRate) {
      var activeObj = stage.objects.where((obj) => obj.checked == true)
          .toList();
      return Container(margin: EdgeInsets.all(1),color: Colors.white,child: Icon(activeObj[Random().nextInt(activeObj.length)].icon));
    }
    // return random monsters if the rate is greater than monster rate.
    else if (monsterRate < stage.monsterRate && count < monsterSpawnedArea) {
      var activeMonsters =
      stage.monsters.where((monster) => monster.checked == true).toList();
      return Container(margin: EdgeInsets.all(1),color: Colors.white,child: Icon(activeMonsters[Random().nextInt(activeMonsters.length)].icon));
    }
    // return empty.
    else {
      return Container(margin: EdgeInsets.all(1),color: Colors.white, child: Icon(null));
    }
  }

  iconLabel(List<GridItem> gridItems) {
    var iconNameRows = List<Widget>();
    for (var value in gridItems.where((item) => item.checked)) {
      iconNameRows.add(IconNameRow(
        icon: value.icon,
        text: value.name,
      ));
    }
    return Column(children: iconNameRows);
  }
}