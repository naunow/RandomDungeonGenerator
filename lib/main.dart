import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NewDungeon(title: 'New Dungeon Page'),
    );
  }
}

/// New Dungeon Page
class NewDungeon extends StatefulWidget {
  NewDungeon({this.title});

  final String title;

  @override
  _NewDungeonState createState() => _NewDungeonState();
}

class _NewDungeonState extends State<NewDungeon> {
  var dungeonData = DungeonData(
      'Test Cave',
      8,
      6,
      [Monster('goblin'), Monster('troll')],
      [Object('barrel'), Object('brick wall'), Object('trap')]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
          color: Colors.white,
        ),
        child: ListView(
          padding: EdgeInsets.all(45.0),
          children: <Widget>[
            dungeonContainer(context),
          ],
        ),
      ),
    );
  }

  /// Dungeon Container
  Container dungeonContainer(context) {
    return Container(
      child: Column(
        children: <Widget>[
          labelContainer(labelText: 'Dungeon Name'),
          dungeonNameTextBox(dungeonData.dungeonName),
          SizedBox(height: 24.0),
          labelContainer(labelText: 'Grid'),
          gridBox(vertical(), 'Vertical'),
          gridBox(horizontal(), 'Horizontal'),
          SizedBox(height: 24.0),
          labelContainer(labelText: 'Monsters'),
          monsterCheckList(),
          SizedBox(height: 24.0),
          labelContainer(labelText: 'Objects'),
          objectsCheckList(),
          SizedBox(height: 50.0),
          ButtonTheme(
            minWidth: 200,
            height: 56,
            child: RaisedButton(
              child: Text(
                "CREATE",
                style: TextStyle(fontFamily: 'Quicksand', fontSize: 18),
              ),
              color: Colors.white,
              shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurpleAccent),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              onPressed: () {},
              splashColor: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }

//*****************************
// Components
//*****************************

  /// Label Container
  Container labelContainer({String labelText}) {
    return Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          labelText,
          style: TextStyle(fontSize: 24, fontFamily: 'Quicksand'),
          textAlign: TextAlign.left,
        ));
  }

  /// Dungeon Name Text Box
  ///
  /// [dungeonName] is the text in text box.
  Padding dungeonNameTextBox(String dungeonName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: new TextEditingController(text: dungeonName),
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
            child: Text(
              labelText,
              style: TextStyle(fontFamily: 'Quicksand', fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  /// Monster Check List
  Container monsterCheckList() {
    return Container(
      child: Column(
        children: createMonsterCheckBoxList(dungeonData.monsterList),
      ),
    );
  }

  Container objectsCheckList() {
    return Container(
      child: Column(
        children: createObjectCheckBoxList(dungeonData.objectList),
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
        Text(dungeonData.vertical.toString()),
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
        Text(dungeonData.horizontal.toString()),
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

  /// Monster List
  createMonsterCheckBoxList(List<Monster> monsterList) {
    var list = List<Widget>();
    for (var monster in monsterList) {
      var tile = CheckboxListTile(
        value: monster.checked,
        activeColor: Colors.deepPurpleAccent,
        title: Text(
          monster.monsterName,
          style: TextStyle(fontFamily: 'Quicksand'),
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

  createObjectCheckBoxList(List<Object> objectList) {
    var list = List<Widget>();
    for (var object in objectList) {
      var tile = CheckboxListTile(
        value: object.checked,
        activeColor: Colors.deepPurpleAccent,
        title: Text(
          object.objectName,
          style: TextStyle(fontFamily: 'Quicksand'),
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

class Monster {
  final String monsterName;
  bool checked = false;

  Monster(this.monsterName);
}

class Object {
  final String objectName;
  bool checked = false;

  Object(this.objectName);
}
