import 'package:flutter/material.dart';

class CommonStyle {
//  quicksand({double fontSize: 14.0}) {
//    return TextStyle(
//      fontFamily: 'Quicksand',
//      fontSize: fontSize,
//    );
//  }

  static quicksand({double fontSize: 14.0}) {
    return TextStyle(
      fontFamily: 'Quicksand',
      fontSize: fontSize,
    );
  }

  static Container labelContainer({String labelText}) {
    return Container(
        alignment: AlignmentDirectional.topStart,
        child: Text(
          labelText,
          style: CommonStyle.quicksand(fontSize: 24.0),
          textAlign: TextAlign.left,
        ));
  }
}
