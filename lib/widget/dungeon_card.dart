import 'package:flutter/material.dart';
import 'package:randomdungeongenerator/common_style.dart';


class DungeonCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function press;

  const DungeonCard({
    Key key,
    this.name,
    this.icon,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.bottomCenter,
      width: size.width * .65,
      height: size.height * .60,
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(offset: Offset(0, 8), blurRadius: 20, color: kShadowColor)
          ]),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: double.infinity,
                height: size.height * .60,
                child: IconButton(
                    icon: Icon(
                      icon,
                      size: 80,
                      color: Colors.black87,
                    ),
                    onPressed: press),
              ),
              Positioned(
                bottom: 80,
                width: size.width * .65,
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
