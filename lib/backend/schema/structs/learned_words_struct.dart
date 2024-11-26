// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LearnedWordsStruct extends BaseStruct {
  LearnedWordsStruct({
    String? word,
    int? counter,
    int? lastSession,
  })  : _word = word,
        _counter = counter,
        _lastSession = lastSession;

  // "word" field.
  String? _word;
  String get word => _word ?? '';
  set word(String? val) => _word = val;

  bool hasWord() => _word != null;

  // "counter" field.
  int? _counter;
  int get counter => _counter ?? 0;
  set counter(int? val) => _counter = val;

  void incrementCounter(int amount) => counter = counter + amount;

  bool hasCounter() => _counter != null;

  // "lastSession" field.
  int? _lastSession;
  int get lastSession => _lastSession ?? 0;
  set lastSession(int? val) => _lastSession = val;

  void incrementLastSession(int amount) => lastSession = lastSession + amount;

  bool hasLastSession() => _lastSession != null;

  static LearnedWordsStruct fromMap(Map<String, dynamic> data) =>
      LearnedWordsStruct(
        word: data['word'] as String?,
        counter: castToType<int>(data['counter']),
        lastSession: castToType<int>(data['lastSession']),
      );

  static LearnedWordsStruct? maybeFromMap(dynamic data) => data is Map
      ? LearnedWordsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'word': _word,
        'counter': _counter,
        'lastSession': _lastSession,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'word': serializeParam(
          _word,
          ParamType.String,
        ),
        'counter': serializeParam(
          _counter,
          ParamType.int,
        ),
        'lastSession': serializeParam(
          _lastSession,
          ParamType.int,
        ),
      }.withoutNulls;

  static LearnedWordsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LearnedWordsStruct(
        word: deserializeParam(
          data['word'],
          ParamType.String,
          false,
        ),
        counter: deserializeParam(
          data['counter'],
          ParamType.int,
          false,
        ),
        lastSession: deserializeParam(
          data['lastSession'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LearnedWordsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LearnedWordsStruct &&
        word == other.word &&
        counter == other.counter &&
        lastSession == other.lastSession;
  }

  @override
  int get hashCode => const ListEquality().hash([word, counter, lastSession]);
}

LearnedWordsStruct createLearnedWordsStruct({
  String? word,
  int? counter,
  int? lastSession,
}) =>
    LearnedWordsStruct(
      word: word,
      counter: counter,
      lastSession: lastSession,
    );
