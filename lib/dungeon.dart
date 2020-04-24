import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/new_dungeon.dart';
import 'common_style.dart';
import 'package:randomdungeongenerator/main.dart';
import 'widget/icon_list_row.dart';

class DungeonPage extends StatelessWidget {
  final dungeonData;

  DungeonPage(this.dungeonData);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Show Dungeon',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(
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
          )),
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
              child: Icon(Icons.star),
            );
          }),
    );
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
