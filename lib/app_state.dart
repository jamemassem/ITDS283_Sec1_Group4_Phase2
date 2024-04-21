import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _playerName =
          await secureStorage.getString('ff_playerName') ?? _playerName;
    });
    await _safeInitAsync(() async {
      _isDarkMode = await secureStorage.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    await _safeInitAsync(() async {
      _lastAchievedLevel = await secureStorage.getInt('ff_lastAchievedLevel') ??
          _lastAchievedLevel;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _playerName = 'player1';
  String get playerName => _playerName;
  set playerName(String _value) {
    _playerName = _value;
    secureStorage.setString('ff_playerName', _value);
  }

  void deletePlayerName() {
    secureStorage.delete(key: 'ff_playerName');
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool _value) {
    _isDarkMode = _value;
    secureStorage.setBool('ff_isDarkMode', _value);
  }

  void deleteIsDarkMode() {
    secureStorage.delete(key: 'ff_isDarkMode');
  }

  int _levelsCount = 5;
  int get levelsCount => _levelsCount;
  set levelsCount(int _value) {
    _levelsCount = _value;
  }

  int _lastAchievedLevel = 0;
  int get lastAchievedLevel => _lastAchievedLevel;
  set lastAchievedLevel(int _value) {
    _lastAchievedLevel = _value;
    secureStorage.setInt('ff_lastAchievedLevel', _value);
  }

  void deleteLastAchievedLevel() {
    secureStorage.delete(key: 'ff_lastAchievedLevel');
  }

  List<PlayerStruct> _currentPlayers = [];
  List<PlayerStruct> get currentPlayers => _currentPlayers;
  set currentPlayers(List<PlayerStruct> _value) {
    _currentPlayers = _value;
  }

  void addToCurrentPlayers(PlayerStruct _value) {
    _currentPlayers.add(_value);
  }

  void removeFromCurrentPlayers(PlayerStruct _value) {
    _currentPlayers.remove(_value);
  }

  void removeAtIndexFromCurrentPlayers(int _index) {
    _currentPlayers.removeAt(_index);
  }

  void updateCurrentPlayersAtIndex(
    int _index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    _currentPlayers[_index] = updateFn(_currentPlayers[_index]);
  }

  void insertAtIndexInCurrentPlayers(int _index, PlayerStruct _value) {
    _currentPlayers.insert(_index, _value);
  }

  List<LevelStruct> _levelsList = [];
  List<LevelStruct> get levelsList => _levelsList;
  set levelsList(List<LevelStruct> _value) {
    _levelsList = _value;
  }

  void addToLevelsList(LevelStruct _value) {
    _levelsList.add(_value);
  }

  void removeFromLevelsList(LevelStruct _value) {
    _levelsList.remove(_value);
  }

  void removeAtIndexFromLevelsList(int _index) {
    _levelsList.removeAt(_index);
  }

  void updateLevelsListAtIndex(
    int _index,
    LevelStruct Function(LevelStruct) updateFn,
  ) {
    _levelsList[_index] = updateFn(_levelsList[_index]);
  }

  void insertAtIndexInLevelsList(int _index, LevelStruct _value) {
    _levelsList.insert(_index, _value);
  }

  bool _isHapticAllowed = true;
  bool get isHapticAllowed => _isHapticAllowed;
  set isHapticAllowed(bool _value) {
    _isHapticAllowed = _value;
  }

  bool _isSoundOn = true;
  bool get isSoundOn => _isSoundOn;
  set isSoundOn(bool _value) {
    _isSoundOn = _value;
  }

  String _musicFile =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3';
  String get musicFile => _musicFile;
  set musicFile(String _value) {
    _musicFile = _value;
  }

  double _currentMusicVolume = 0.5;
  double get currentMusicVolume => _currentMusicVolume;
  set currentMusicVolume(double _value) {
    _currentMusicVolume = _value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
