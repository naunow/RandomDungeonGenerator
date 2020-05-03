import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/screen/dungeon_detail.dart';
import 'package:randomdungeongenerator/widget/stage_tile.dart';
import '../common_style.dart';

class TopPageTile extends StatefulWidget {
  @override
  _TopPageTileState createState() => _TopPageTileState();
}

class _TopPageTileState extends State<TopPageTile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.3, 0.6, 0.9],
              colors: kGradient),
        ),
        child: GridView(
          scrollDirection: Axis.vertical,
          //controller: _controller,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          children: <Widget>[
            StageTile(
              text: 'Small corner stage',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(stageSingleCorners);
                }));
              },
            ),
            StageTile(
              text: 'Large corner stage',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(stageCorners);
                }));
              },
            ),
            StageTile(
              text: 'Circle stage',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(stageCircle);
                }));
              },
            ),
            StageTile(
              text: 'Flat stage',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(stageFlat);
                }));
              },
            ),
            StageTile(
              text: 'X',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(stageX);
                }));
              },
            ),
            StageTile(
              text: 'Stage arena',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DungeonPage(stageArena);
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
