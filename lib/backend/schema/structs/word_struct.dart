// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WordStruct extends BaseStruct {
  WordStruct({
    String? word,
    String? pronunciation,
    String? audio,
    String? slowAudio,
    String? image,
    String? definition,
    String? translation,
    String? usage,
    String? usageExercise,
    List<String>? syllables,
    int? category,
  })  : _word = word,
        _pronunciation = pronunciation,
        _audio = audio,
        _slowAudio = slowAudio,
        _image = image,
        _definition = definition,
        _translation = translation,
        _usage = usage,
        _usageExercise = usageExercise,
        _syllables = syllables,
        _category = category;

  // "word" field.
  String? _word;
  String get word => _word ?? '';
  set word(String? val) => _word = val;

  bool hasWord() => _word != null;

  // "pronunciation" field.
  String? _pronunciation;
  String get pronunciation => _pronunciation ?? '';
  set pronunciation(String? val) => _pronunciation = val;

  bool hasPronunciation() => _pronunciation != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  set audio(String? val) => _audio = val;

  bool hasAudio() => _audio != null;

  // "slowAudio" field.
  String? _slowAudio;
  String get slowAudio => _slowAudio ?? '';
  set slowAudio(String? val) => _slowAudio = val;

  bool hasSlowAudio() => _slowAudio != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "definition" field.
  String? _definition;
  String get definition => _definition ?? '';
  set definition(String? val) => _definition = val;

  bool hasDefinition() => _definition != null;

  // "translation" field.
  String? _translation;
  String get translation => _translation ?? '';
  set translation(String? val) => _translation = val;

  bool hasTranslation() => _translation != null;

  // "usage" field.
  String? _usage;
  String get usage => _usage ?? '';
  set usage(String? val) => _usage = val;

  bool hasUsage() => _usage != null;

  // "usageExercise" field.
  String? _usageExercise;
  String get usageExercise => _usageExercise ?? '';
  set usageExercise(String? val) => _usageExercise = val;

  bool hasUsageExercise() => _usageExercise != null;

  // "syllables" field.
  List<String>? _syllables;
  List<String> get syllables => _syllables ?? const [];
  set syllables(List<String>? val) => _syllables = val;

  void updateSyllables(Function(List<String>) updateFn) {
    updateFn(_syllables ??= []);
  }

  bool hasSyllables() => _syllables != null;

  // "category" field.
  int? _category;
  int get category => _category ?? 0;
  set category(int? val) => _category = val;

  void incrementCategory(int amount) => category = category + amount;

  bool hasCategory() => _category != null;

  static WordStruct fromMap(Map<String, dynamic> data) => WordStruct(
        word: data['word'] as String?,
        pronunciation: data['pronunciation'] as String?,
        audio: data['audio'] as String?,
        slowAudio: data['slowAudio'] as String?,
        image: data['image'] as String?,
        definition: data['definition'] as String?,
        translation: data['translation'] as String?,
        usage: data['usage'] as String?,
        usageExercise: data['usageExercise'] as String?,
        syllables: getDataList(data['syllables']),
        category: castToType<int>(data['category']),
      );

  static WordStruct? maybeFromMap(dynamic data) =>
      data is Map ? WordStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'word': _word,
        'pronunciation': _pronunciation,
        'audio': _audio,
        'slowAudio': _slowAudio,
        'image': _image,
        'definition': _definition,
        'translation': _translation,
        'usage': _usage,
        'usageExercise': _usageExercise,
        'syllables': _syllables,
        'category': _category,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'word': serializeParam(
          _word,
          ParamType.String,
        ),
        'pronunciation': serializeParam(
          _pronunciation,
          ParamType.String,
        ),
        'audio': serializeParam(
          _audio,
          ParamType.String,
        ),
        'slowAudio': serializeParam(
          _slowAudio,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'definition': serializeParam(
          _definition,
          ParamType.String,
        ),
        'translation': serializeParam(
          _translation,
          ParamType.String,
        ),
        'usage': serializeParam(
          _usage,
          ParamType.String,
        ),
        'usageExercise': serializeParam(
          _usageExercise,
          ParamType.String,
        ),
        'syllables': serializeParam(
          _syllables,
          ParamType.String,
          isList: true,
        ),
        'category': serializeParam(
          _category,
          ParamType.int,
        ),
      }.withoutNulls;

  static WordStruct fromSerializableMap(Map<String, dynamic> data) =>
      WordStruct(
        word: deserializeParam(
          data['word'],
          ParamType.String,
          false,
        ),
        pronunciation: deserializeParam(
          data['pronunciation'],
          ParamType.String,
          false,
        ),
        audio: deserializeParam(
          data['audio'],
          ParamType.String,
          false,
        ),
        slowAudio: deserializeParam(
          data['slowAudio'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        definition: deserializeParam(
          data['definition'],
          ParamType.String,
          false,
        ),
        translation: deserializeParam(
          data['translation'],
          ParamType.String,
          false,
        ),
        usage: deserializeParam(
          data['usage'],
          ParamType.String,
          false,
        ),
        usageExercise: deserializeParam(
          data['usageExercise'],
          ParamType.String,
          false,
        ),
        syllables: deserializeParam<String>(
          data['syllables'],
          ParamType.String,
          true,
        ),
        category: deserializeParam(
          data['category'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WordStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WordStruct &&
        word == other.word &&
        pronunciation == other.pronunciation &&
        audio == other.audio &&
        slowAudio == other.slowAudio &&
        image == other.image &&
        definition == other.definition &&
        translation == other.translation &&
        usage == other.usage &&
        usageExercise == other.usageExercise &&
        listEquality.equals(syllables, other.syllables) &&
        category == other.category;
  }

  @override
  int get hashCode => const ListEquality().hash([
        word,
        pronunciation,
        audio,
        slowAudio,
        image,
        definition,
        translation,
        usage,
        usageExercise,
        syllables,
        category
      ]);
}

WordStruct createWordStruct({
  String? word,
  String? pronunciation,
  String? audio,
  String? slowAudio,
  String? image,
  String? definition,
  String? translation,
  String? usage,
  String? usageExercise,
  int? category,
}) =>
    WordStruct(
      word: word,
      pronunciation: pronunciation,
      audio: audio,
      slowAudio: slowAudio,
      image: image,
      definition: definition,
      translation: translation,
      usage: usage,
      usageExercise: usageExercise,
      category: category,
    );
