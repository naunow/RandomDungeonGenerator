import 'package:flutter/material.dart';

/// Colors
const kGradient = [Color(0xFFFFCCBC), Color(0xFFFFAB91), Color(0xFFF48FB1), Color(0xFFB388FF)];
const kMainColor = Color(0xFFB388FF);
const kBodyTextColor = Color(0xFF303030);
final kShadowColor = Color(0xFF000000).withOpacity(.12);

/// Stages
//const String stageCorners = '00';
//const String stageSingleCorners = "10";
//const String stageCircle = "20";
//const String stageFlat = "30";
//const String stageX = "40";
//const String stageArena = "50";

// Wall Tiles
const defaultWall = [0,1,2,3,4,5,6,7,8,9,10,11,21,22,32,33,43,44,54,55,65,66,76,77,87,88,98,99,109,110,111,112,113,114,115,116,117,118,119,120,121];
const arenaCorner = [12,20,100,108];
const arenaCircle = [12,13,19,20,23,31,89,97,100,101,107,108];
const arenaX = [15,16,17,27,45,53,56,57,63,64,67,75,93,103,104,105];
const arenaLabyrinth = [12,20,23,31,34,35,41,42,46,52,68,74,78,79,85,86,89,97,100,108];

/// Label Text
class LabelContainer extends StatelessWidget {
  final String labelText;

  const LabelContainer({Key key, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          labelText,
          style: Quicksand(size: 24.0),
          textAlign: TextAlign.left,
        ));
  }
}

class Quicksand extends TextStyle {
  final double size;
  @override
  final fontFamily = 'Quicksand';

  Quicksand({this.size = 14}) : super(fontSize: size);
}

/// Bottom button
class Button extends StatefulWidget {
  final pushPage;
  final buttonText;

  const Button({
    Key key,
    @required this.buttonText,
    this.pushPage,
  }) : super(key: key);

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 200,
      height: 56,
      child: RaisedButton(
        child: Text(
          widget.buttonText,
          style: Quicksand(size: 18.0),
        ),
        color: Colors.white,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        onPressed: () {
          Navigator.push(this.context,
              MaterialPageRoute(builder: (context) => widget.pushPage));
        },
        splashColor: kMainColor,
      ),
    );
  }
}
