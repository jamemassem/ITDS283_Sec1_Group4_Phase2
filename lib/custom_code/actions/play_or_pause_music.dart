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

import '/custom_code/actions/init_audio_player.dart';
import 'package:just_audio/just_audio.dart';

Future playOrPauseMusic(String mp3Url, bool isPause) async {
  var _audioPlayer = AudioPlayerSingleton().audioPlayer!;

  if (_audioPlayer.playing) {
    await _audioPlayer.stop();
  }

  if (!_audioPlayer.playing && isPause == false) {
    await _audioPlayer.setAudioSource(
      AudioSource.uri(
        Uri.parse(mp3Url),
      ),
      initialIndex: 0,
      initialPosition: Duration.zero,
    );
    await _audioPlayer.play();
    _audioPlayer.setLoopMode(LoopMode.all);
  }
}
