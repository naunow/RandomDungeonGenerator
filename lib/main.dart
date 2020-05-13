import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:randomdungeongenerator/screen/top_page_tile.dart';

void main() {
  debugPaintSizeEnabled = true;
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
      home: TopPageTile(),
    );
  }
}