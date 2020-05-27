import 'package:randomdungeongenerator/customicon/monsters_demo_icons_icons.dart';
import 'package:randomdungeongenerator/customicon/objects_demo_icons.dart';
import 'package:randomdungeongenerator/viewmodel/Monster.dart';
import 'package:randomdungeongenerator/viewmodel/Object.dart';

var allMonsters = [
  Monster('Goblin', MonstersDemo.goblin_head, true),
  Monster('Golem', MonstersDemo.ice_golem, true),
  Monster('Orge', MonstersDemo.ogre, true),
  Monster('Orc', MonstersDemo.orc_head, true)];

var allObjects = [
  Object('Barrel', ObjectsDemo.barrel, true),
  Object('Brick Wall', ObjectsDemo.brick_wall, true),
  Object('Lava', ObjectsDemo.lava, true),
  Object('Chest', ObjectsDemo.chest, true),
  Object('Spiky pit', ObjectsDemo.spiky_pit, true),
  Object('Spill', ObjectsDemo.spill, true)
];

