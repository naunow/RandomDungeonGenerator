import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/main.dart';
import 'Monster.dart';
import 'Object.dart';

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
          colors: [
            Colors.deepOrange[100],
            Colors.deepOrange[200],
            Colors.pink[200],
            Colors.deepPurpleAccent[100],
          ],
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
            initialChildSize: 0.8,
            minChildSize: 0.4,
            maxChildSize: 1.0,
            builder: (BuildContext context, myScrollController) {
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
                child: ListView.builder(
                  controller: myScrollController,
                  itemCount: 1,
                  padding: EdgeInsets.all(45.0),
                  itemBuilder: (BuildContext context, int index) {
                    return createGrid();
                  },
                ),
              );
            },
          )),
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
_gridItemList(DungeonData dungeonData) {
  // create empty grid list
  var emptyList;
  for (var i = 0; i > dungeonData.horizontal * dungeonData.vertical; i++) {
    //emptyList.Add()
  }
}
