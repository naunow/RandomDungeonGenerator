import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:randomdungeongenerator/model/model_stage.dart';
import 'package:randomdungeongenerator/screen/top_page_tile.dart';

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
  var dbHelper;
  bool isUpdating;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbProvider();
    isUpdating = false;
    refreshList();
  }

  refreshList() {
    setState(() {
      stages = dbHelper.getStage();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ModelStage> a = dbHelper.getStage();
    return Container(child: Text(a[0].name),);
  }
}
