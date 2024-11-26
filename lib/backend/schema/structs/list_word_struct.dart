// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ListWordStruct extends BaseStruct {
  ListWordStruct({
    String? word,
    int? views,
    List<int>? exercises,
    int? currentDifficulty,
  })  : _word = word,
        _views = views,
        _exercises = exercises,
        _currentDifficulty = currentDifficulty;

  // "word" field.
  String? _word;
  String get word => _word ?? '';
  set word(String? val) => _word = val;

  bool hasWord() => _word != null;

  // "views" field.
  int? _views;
  int get views => _views ?? 1;
  set views(int? val) => _views = val;

  void incrementViews(int amount) => views = views + amount;

  bool hasViews() => _views != null;

  // "exercises" field.
  List<int>? _exercises;
  List<int> get exercises => _exercises ?? const [];
  set exercises(List<int>? val) => _exercises = val;

  void updateExercises(Function(List<int>) updateFn) {
    updateFn(_exercises ??= []);
  }

  bool hasExercises() => _exercises != null;

  // "currentDifficulty" field.
  int? _currentDifficulty;
  int get currentDifficulty => _currentDifficulty ?? 1;
  set currentDifficulty(int? val) => _currentDifficulty = val;

  void incrementCurrentDifficulty(int amount) =>
      currentDifficulty = currentDifficulty + amount;

  bool hasCurrentDifficulty() => _currentDifficulty != null;

  static ListWordStruct fromMap(Map<String, dynamic> data) => ListWordStruct(
        word: data['word'] as String?,
        views: castToType<int>(data['views']),
        exercises: getDataList(data['exercises']),
        currentDifficulty: castToType<int>(data['currentDifficulty']),
      );

  static ListWordStruct? maybeFromMap(dynamic data) =>
      data is Map ? ListWordStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'word': _word,
        'views': _views,
        'exercises': _exercises,
        'currentDifficulty': _currentDifficulty,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'word': serializeParam(
          _word,
          ParamType.String,
        ),
        'views': serializeParam(
          _views,
          ParamType.int,
        ),
        'exercises': serializeParam(
          _exercises,
          ParamType.int,
          isList: true,
        ),
        'currentDifficulty': serializeParam(
          _currentDifficulty,
          ParamType.int,
        ),
      }.withoutNulls;

  static ListWordStruct fromSerializableMap(Map<String, dynamic> data) =>
      ListWordStruct(
        word: deserializeParam(
          data['word'],
          ParamType.String,
          false,
        ),
        views: deserializeParam(
          data['views'],
          ParamType.int,
          false,
        ),
        exercises: deserializeParam<int>(
          data['exercises'],
          ParamType.int,
          true,
        ),
        currentDifficulty: deserializeParam(
          data['currentDifficulty'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ListWordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ListWordStruct &&
        word == other.word &&
        views == other.views &&
        listEquality.equals(exercises, other.exercises) &&
        currentDifficulty == other.currentDifficulty;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([word, views, exercises, currentDifficulty]);
}

ListWordStruct createListWordStruct({
  String? word,
  int? views,
  int? currentDifficulty,
}) =>
    ListWordStruct(
      word: word,
      views: views,
      currentDifficulty: currentDifficulty,
    );
