import 'package:flutter/material.dart';

import '../common_style.dart';

class IconNameRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const IconNameRow({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              text,
              style: Quicksand(size: 18),
            ),
          )
        ],
      ),
    );
  }
}