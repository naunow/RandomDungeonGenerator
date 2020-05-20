import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:randomdungeongenerator/model/model_stage.dart';
import 'package:randomdungeongenerator/screen/top_page_tile.dart';
import 'dart:async';
import 'model/db_propvider.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Top Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand',
      ),
      home: DatabaseTest(),//TopPageTile(),
    );
  }
}

class DatabaseTest extends StatefulWidget {
  @override
  _DatabaseTestState createState() => _DatabaseTestState();
}

class _DatabaseTestState extends State<DatabaseTest> {
  Future<List<ModelStage>> stages;
  DbProvider dbHelper;
  bool isUpdating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbProvider();
    dbHelper.init();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      stages = dbHelper.getStages();
    });
  }

  @override
  Widget build(BuildContext context) {
    var stages = dbHelper.getStages();
//    var test = a.then((item)=>item[0].name);
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(future: stages, builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _getList(snapshot.data);
          } else {
            return Text('mada');
          }
        },),
      ),
    );
  }
}

_getList(List<ModelStage> stages) {
  return ListView.builder(itemBuilder: (BuildContext context, int index) {
    return Card(child: Column(children: <Widget>[
      Text("ID:${stages[index].id.toString()}"),
      Text("NAME:${stages[index].name}"),
      Text("WALL TILES:${stages[index].wallTiles}"),
      Text("MONSTER RATE:${stages[index].monsterRate.toString()}"),
      Text("OBJECT RATE:${stages[index].objectRate.toString()}"),
      Text("MONSTER ARRAY:${stages[index].monsterIdArray}"),
      Text("OBJECT ARRAY:${stages[index].objectIdArray}"),

    ],));
  }, itemCount: stages.length,);
}
