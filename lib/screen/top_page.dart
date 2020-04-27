import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/widget/dungeon_card.dart';

import '../common_style.dart';
import 'dungeon_detail.dart';
import 'dungeon_create.dart';

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
          child: Center(
            child: Row(
              children: <Widget>[
                SizedBox(width: (size.width * .35) / 2 - 20),
                DungeonCard(
                  icon: Icons.add_circle_outline,
                  name: 'New Dungeon',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return NewDungeon();
                        }));
                  },
                ),
                DungeonCard(
                  icon: Icons.landscape,
                  name: 'Large cave',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DungeonPage(null);
                        }));
                  },
                ),
                DungeonCard(
                  icon: Icons.style,
                  name: 'Forest',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return DungeonPage(null);
                        }));
                  },
                ),
                SizedBox(width: (size.width * .35) / 2 - 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
