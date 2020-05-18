import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/viewmodel/Object.dart';
import 'package:randomdungeongenerator/viewmodel/Monster.dart';
import 'package:randomdungeongenerator/common_style.dart';
import 'package:randomdungeongenerator/screen/top_page.dart';

/// New Dungeon Page
class NewDungeon extends StatefulWidget {
  NewDungeon({this.title});

  final String title;

  @override
  _NewDungeonState createState() => _NewDungeonState();
}

class _NewDungeonState extends State<NewDungeon> {
  var dungeonData = DungeonData('Test Cave', 8, 6, [
//    Monster('goblin', Icon(Icons.golf_course), false),
//    Monster('troll', Icon(Icons.control_point), false)
  ], [
//    Object('barrel', Icon(Icons.battery_alert), false),
//    Object('brick wall', Icon(Icons.broken_image), false),
//    Object('trap', Icon(Icons.track_changes), false)
  ]);

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
                  return dungeonContainer(context);
                },
              ),
            );
          },
        ),
      ),
    );
  }

  /// Dungeon Container
  Container dungeonContainer(context) {
    return Container(
      child: Column(
        children: <Widget>[
          LabelContainer(labelText: 'Dungeon Name'),
          dungeonNameTextBox(dungeonData.dungeonName),
          SizedBox(height: 24.0),
          LabelContainer(labelText: 'Grid'),
          gridBox(vertical(), 'Vertical'),
          gridBox(horizontal(), 'Horizontal'),
          SizedBox(height: 24.0),
          LabelContainer(labelText: 'Monsters'),
          monsterCheckList(),
          SizedBox(height: 24.0),
          LabelContainer(labelText: 'Objects'),
          objectsCheckList(),
          SizedBox(height: 50.0),
          Button(
            pushPage: TopPage(),
            buttonText: 'CREATE',
          ),
        ],
      ),
    );
  }

//*****************************
// Components
//*****************************

  /// Dungeon Name Text Box
  ///
  /// [dungeonName] is the text in text box.
  Padding dungeonNameTextBox(String dungeonName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: new TextEditingController(text: dungeonName),
        style: Quicksand(),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(15.0),
            fillColor: Colors.grey[200],
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple[100],
                )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }

  /// Grid Box
  Padding gridBox(Row row, String labelText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              color: Colors.grey[200],
            ),
            child: row,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(labelText, style: Quicksand(size: 18.0)),
          ),
        ],
      ),
    );
  }

  /// Monster Check List
  Container monsterCheckList() {
    createMonsterCheckBoxList() {
      var list = List<Widget>();
      for (var monster in dungeonData.monsterList) {
        var tile = CheckboxListTile(
          value: monster.checked,
          activeColor: kMainColor,
          title: Text(
            monster.name,
            style: Quicksand(),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool value) {
            setState(() {
              monster.checked = value;
            });
          },
        );
        list.add(tile);
      }
      return list;
    }

    return Container(
      child: Column(
        children: createMonsterCheckBoxList(),
      ),
    );
  }

  Container objectsCheckList() {
    createObjectCheckBoxList() {
      var list = List<Widget>();
      for (var object in dungeonData.objectList) {
        var tile = CheckboxListTile(
          value: object.checked,
          activeColor: kMainColor,
          title: Text(
            object.name,
            style: Quicksand(),
          ),
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool value) {
            setState(() {
              object.checked = value;
            });
          },
        );
        list.add(tile);
      }
      return list;
    }

    return Container(
      child: Column(
        children: createObjectCheckBoxList(),
      ),
    );
  }

//*****************************
// Functions
//*****************************

  Row vertical() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              if (dungeonData.vertical > 0) dungeonData.vertical--;
            });
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.remove,
            ),
          ),
        ),
        Text(
          dungeonData.vertical.toString(),
          style: Quicksand(),
        ),
        InkWell(
          onTap: () {
            setState(() {
              dungeonData.vertical++;
            });
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ],
    );
  }

  Row horizontal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              if (dungeonData.horizontal > 0) dungeonData.horizontal--;
            });
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.remove,
            ),
          ),
        ),
        Text(
          dungeonData.horizontal.toString(),
          style: Quicksand(),
        ),
        InkWell(
          onTap: () {
            setState(() {
              dungeonData.horizontal++;
            });
          },
          child: Container(
            width: 30.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
            ),
            child: Icon(
              Icons.add,
            ),
          ),
        ),
      ],
    );
  }
}

//*****************************
// Classes
//*****************************

class DungeonData {
  final String dungeonName;
  int horizontal;
  int vertical;
  final List<Monster> monsterList;
  final List<Object> objectList;

  DungeonData(this.dungeonName, this.horizontal, this.vertical,
      this.monsterList, this.objectList);
}
