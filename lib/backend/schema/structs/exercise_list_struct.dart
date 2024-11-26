// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExerciseListStruct extends BaseStruct {
  ExerciseListStruct({
    String? word,
    int? exercise,
  })  : _word = word,
        _exercise = exercise;

  // "word" field.
  String? _word;
  String get word => _word ?? '';
  set word(String? val) => _word = val;

  bool hasWord() => _word != null;

  // "exercise" field.
  int? _exercise;
  int get exercise => _exercise ?? 0;
  set exercise(int? val) => _exercise = val;

  void incrementExercise(int amount) => exercise = exercise + amount;

  bool hasExercise() => _exercise != null;

  static ExerciseListStruct fromMap(Map<String, dynamic> data) =>
      ExerciseListStruct(
        word: data['word'] as String?,
        exercise: castToType<int>(data['exercise']),
      );

  static ExerciseListStruct? maybeFromMap(dynamic data) => data is Map
      ? ExerciseListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'word': _word,
        'exercise': _exercise,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'word': serializeParam(
          _word,
          ParamType.String,
        ),
        'exercise': serializeParam(
          _exercise,
          ParamType.int,
        ),
      }.withoutNulls;

  static ExerciseListStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExerciseListStruct(
        word: deserializeParam(
          data['word'],
          ParamType.String,
          false,
        ),
        exercise: deserializeParam(
          data['exercise'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ExerciseListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ExerciseListStruct &&
        word == other.word &&
        exercise == other.exercise;
  }

  @override
  int get hashCode => const ListEquality().hash([word, exercise]);
}

ExerciseListStruct createExerciseListStruct({
  String? word,
  int? exercise,
}) =>
    ExerciseListStruct(
      word: word,
      exercise: exercise,
    );
