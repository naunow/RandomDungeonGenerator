import 'Monster.dart';
import 'Object.dart';

class Stage {
  int id;
  String name;
  int column;
  int row;
  List<int> wallTiles;
  List<Object> objects;
  List<Monster> monsters;
  int monsterRate;
  int objectRate;
  List<int> get defaultWallTiles => getDefaultWallTiles(this.row, this.column);

  List<int> getDefaultWallTiles(int row, int column) {
    List<int> allTiles = [];
    for (var i = 0; i < row * column; i++) {
      allTiles.add(i);
    }

    // Set each corner tile.
    int topLeftCorner = 0;
    int topRightCorner = column - 1;
    int bottomLeftCorner = column * (row - 1);
    int bottomRightCorner = (column * row) - 1;

    // Set each line tiles.
    List<int> topLine =
        allTiles.where((tile) => tile > topLeftCorner && tile < topRightCorner).toList();

    List<int> rightLine = allTiles.where(
        (tile) => tile % column == column-1 && tile != bottomRightCorner).toList();
    List<int> leftLine = allTiles.where((tile) => tile % column == 0).toList();

    List<int> bottomLine = allTiles
        .where((tile) => tile > bottomLeftCorner && tile < bottomRightCorner).toList();

    // Add all default tiles to list.
    List<int> defaultWallTiles = [];
    defaultWallTiles
      ..add(topLeftCorner)
      ..add(topRightCorner)
      ..add(bottomLeftCorner)
      ..add(bottomRightCorner);

    defaultWallTiles
      ..addAll(topLine)
      ..addAll(rightLine)
      ..addAll(bottomLine)
      ..addAll(leftLine)
    ;

    return defaultWallTiles;
  }
}
