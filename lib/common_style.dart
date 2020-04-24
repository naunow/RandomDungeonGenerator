import 'package:flutter/material.dart';

/// Colors
const kGradient = [Color(0xFFFFCCBC), Color(0xFFFFAB91), Color(0xFFF48FB1), Color(0xFFB388FF)];
const kMainColor = Color(0xFFB388FF);
const kBodyTextColor = Color(0xFF303030);
final kShadowColor = Color(0xFF000000).withOpacity(.12);

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
