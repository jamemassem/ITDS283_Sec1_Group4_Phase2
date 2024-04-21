// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:faker/faker.dart';
import 'dart:math';

Future<List<LevelStruct>> initializeLevels() async {
  // populate List<Player> with 5 items of Player data type and random values for its fields
  List<LevelStruct> levels = [];

  for (int i = 0; i < 5; i++) {
    LevelStruct level = LevelStruct(
      isLevelLocked: i == 0 ? false : true,
      levelName: "Level ${i}",
      levelDesc: "A great level!",
      completionPerc: i == 0 ? Random().nextDouble() : 0,
      levelNumber: i,
    );
    levels.add(level);
  }

  return levels;
}
