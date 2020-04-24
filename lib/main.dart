import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:randomdungeongenerator/dungeon.dart';
import 'package:randomdungeongenerator/widget/dungeon_card.dart';
import 'package:randomdungeongenerator/new_dungeon.dart';
import 'common_style.dart';

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
      home: TopPage(),
    );
  }
}

class TopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.3, 0.6, 0.9],
            colors: kGradient),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              SizedBox(width: 25),
              DungeonCard(
                icon: Icons.add_circle_outline,
                name: 'New Dungeon',
                press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewDungeon();
                  }));
                },
              ),
              DungeonCard(
                icon: Icons.landscape,
                name: 'Large cave',
                press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(null);
                }));},
              ),
              DungeonCard(
                icon: Icons.style,
                name: 'Forest',
                press: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(null);
                }));},
              )
            ],
          ),
        ),
      ),
    );
  }
}
