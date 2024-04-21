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

Future<List<PlayerStruct>> populatePlayers() async {
  // populate List<Player> with 5 items of Player data type and random values for its fields
  List<PlayerStruct> players = [];

  for (int i = 0; i < 10; i++) {
    PlayerStruct player = PlayerStruct(
      isCurrentUser: i == 0 ? true : false,
      profileName: faker.person.name(),
      highScore: Random().nextInt(2000) + 18,
      hasTopRank: Random().nextBool(),
      profileImage:
          "https://mighty.tools/mockmind-api/content/human/${Random().nextInt(20)}.jpg",
    );
    players.add(player);
  }

  return players;
}
