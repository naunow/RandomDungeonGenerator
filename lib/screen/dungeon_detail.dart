import 'dart:math';

import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/screen/dungeon_create.dart';
import '../common_style.dart';
import 'package:randomdungeongenerator/main.dart';
import '../widget/icon_list_row.dart';

class DungeonPage extends StatelessWidget {
  final dungeonData;

  DungeonPage(this.dungeonData);

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
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.9,
            maxChildSize: 1.0,
            builder: (BuildContext context, dungeonController) {
              return Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 4,
                      blurRadius: 10,
                    )
                  ],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: ListView(
                    padding: EdgeInsets.all(20),
                    controller: dungeonController,
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
              );
            }),
      ),
    );
  }

  // ベースのマップを作成
  // 確率を設定
  // オブジェクトのリストから、確率に合わせてランダムで置く
  // モンスターのリストから、オブジェクトがない部分のタイルに確率に合わせてランダムで置く

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
              child:
                  putTile(20, index, 9, getStagePreset(stageCorners)), //Icon(Icons.star),
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

  Container createGrid() {
    List<List<String>> gridState = [
      ['', 'T', '', '', '', '', 'B', '', 'P2'],
      ['', '', '', 'T', '', '', '', '', ''],
      ['', 'T', '', '', '', 'T', '', '', ''],
      ['B', '', 'T', '', '', 'B', '', '', ''],
      ['', 'T', '', '', 'B', 'T', '', 'T', ''],
      ['', '', '', '', '', 'T', '', '', ''],
      ['', 'T', '', '', '', '', 'B', '', ''],
      ['', 'T', '', '', '', 'T', '', '', ''],
      ['P1', '', '', '', '', '', '', 'T', ''],
    ];

    int horizontalLength = gridState[0].length;
    int verticalLength = gridState.length;
    int allLength = horizontalLength * verticalLength;

    items(index, horizontal) {
      int y = index % horizontal;
      int x = (index / horizontal).floor();

      switch (gridState[x][y]) {
        case '':
          return Text('');
          break;

        case 'T':
          return Icon(Icons.map);
          break;

        case 'B':
          return Icon(Icons.battery_alert);
          break;

        case 'P1':
          return Icon(Icons.person_outline);
          break;

        case 'P2':
          return Icon(Icons.person);
          break;

        default:
          return Text('');
      }
    }

    return Container(
      child: Column(
        children: <Widget>[
          Text('aaa'),
          GridView.builder(
              itemCount: allLength,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: horizontalLength),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  child: items(index, horizontalLength),
                );
              }),
        ],
      ),
    );
  }
}

class GridItem {
  final String itemName;
  final Icon itemIcon;

  GridItem(this.itemName, this.itemIcon);
}

/// for test
//_gridItemList(DungeonData dungeonData) {
//  // create empty grid list
//  var emptyList;
//  for (var i = 0; i > dungeonData.horizontal * dungeonData.vertical; i++) {
//    //emptyList.Add()
//  }
//}
