import 'package:flutter/material.dart';
import '../common_style.dart';
class StageTile extends StatelessWidget {
  final String text;
  final Function onTap;
  const StageTile({
    Key key, this.text, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  color: kShadowColor),
            ]),
        child: Center(child: Text(text)),
      ),
    );
  }
}
