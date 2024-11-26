import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _words = prefs
              .getStringList('ff_words')
              ?.map((x) {
                try {
                  return WordStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _words;
    });
    _safeInit(() {
      _sessionCounter = prefs.getInt('ff_sessionCounter') ?? _sessionCounter;
    });
    _safeInit(() {
      _wordLearned = prefs
              .getStringList('ff_wordLearned')
              ?.map((x) {
                try {
                  return ListWordStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _wordLearned;
    });
    _safeInit(() {
      _wordsLearning = prefs
              .getStringList('ff_wordsLearning')
              ?.map((x) {
                try {
                  return ListWordStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _wordsLearning;
    });
    _safeInit(() {
      _exercises = prefs
              .getStringList('ff_exercises')
              ?.map((x) {
                try {
                  return ExerciseListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _exercises;
    });
    _safeInit(() {
      _exerciseTesting = prefs
              .getStringList('ff_exerciseTesting')
              ?.map((x) {
                try {
                  return ExerciseListStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _exerciseTesting;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_currentExercise')) {
        try {
          final serializedData = prefs.getString('ff_currentExercise') ?? '{}';
          _currentExercise = ExerciseListStruct.fromSerializableMap(
              jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _currentMistakes = prefs.getInt('ff_currentMistakes') ?? _currentMistakes;
    });
    _safeInit(() {
      _sessionMistakes = prefs.getInt('ff_sessionMistakes') ?? _sessionMistakes;
    });
    _safeInit(() {
      _hits = prefs.getInt('ff_hits') ?? _hits;
    });
    _safeInit(() {
      _attempts = prefs.getInt('ff_attempts') ?? _attempts;
    });
    _safeInit(() {
      _newWords = prefs.getStringList('ff_newWords') ?? _newWords;
    });
    _safeInit(() {
      _playerName = prefs.getString('ff_playerName') ?? _playerName;
    });
    _safeInit(() {
      _isDarkMode = prefs.getBool('ff_isDarkMode') ?? _isDarkMode;
    });
    _safeInit(() {
      _category = prefs.getInt('ff_category') ?? _category;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<WordStruct> _words = [
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Cane\",\"pronunciation\":\"ká-ne\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/h4dptlj6kafa/Cane.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/ixzqyjbjqas2/Cane_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/9hu2lbtp3t70/Cane.png\",\"definition\":\"Un animale domestico, noto per la sua fedeltà e compagnia.\",\"translation\":\"Perro\",\"usage\":\"Il cane corre nel parco.\",\"usageExercise\":\"Il ____ corre nel parco.\",\"syllables\":\"[\\\"Ca\\\",\\\"rro\\\",\\\"ne\\\",\\\"me\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Gatto\",\"pronunciation\":\"gát-to\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/m2y82g16grxm/Gatto.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/106ijui6h5fg/Gatto_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/j7nc1sihoyei/Gatto.png\",\"definition\":\"Un piccolo animale domestico, spesso tenero e amato, noto per la sua agilità e indipendenza.\",\"translation\":\"Gato\",\"usage\":\"Il gatto dorme sul divano.\",\"usageExercise\":\"Il _____ dorme sul divano.\",\"syllables\":\"[\\\"tto\\\",\\\"Ga\\\",\\\"to\\\",\\\"go\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Cavallo\",\"pronunciation\":\"ca-vál-lo\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/7jpdnhajtf28/Cavallo.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/fsterwbi3388/Cavallo_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/n575blbp2b0w/Cavallo.png\",\"definition\":\"Un animale da allevamento e da equitazione, noto per la sua forza e velocità.\",\"translation\":\"Caballo\",\"usage\":\"Il cavallo galoppa nel campo.\",\"usageExercise\":\"Il _________  galoppa nel campo.\",\"syllables\":\"[\\\"va\\\",\\\"llo\\\",\\\"ve\\\",\\\"Ca\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Coniglio\",\"pronunciation\":\"co-níl-io\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/5r3u9jnqlkon/Coniglio.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/b8pbux39sfda/Coniglio_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/77f0bl8yz0cx/Coniglio.png\",\"definition\":\"Un piccolo mammifero erbivoro, con orecchie lunghe e coda corta.\",\"translation\":\"Conejo\",\"usage\":\"Il coniglio mangia le carote.\",\"usageExercise\":\"Il _________ mangia le carote.\",\"syllables\":\"[\\\"glio\\\",\\\"Co\\\",\\\"no\\\",\\\"ni\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Pesce\",\"pronunciation\":\"pé-she\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/i12f6azhg19j/Pesce.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/yysucz0hy8ax/Pesce_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/393ljqt5mds9/Pesce.png\",\"definition\":\"Un animale acquatico con pinne e branchie, che vive in acqua.\",\"translation\":\"Pez\",\"usage\":\"Il pesce nuota nel lago.\",\"usageExercise\":\"Il _____ nuota nel lago.\",\"syllables\":\"[\\\"Pes\\\",\\\"no\\\",\\\"ce\\\",\\\"to\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Uccello\",\"pronunciation\":\"u-chél-lo\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/uo67vi2kpytc/Uccello.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/r64pgqdalke3/Uccello_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/gl00byjtxgl1/Uccello.png\",\"definition\":\"Un animale con ali, capace di volare.\",\"translation\":\"Pájaro\",\"usage\":\"L\'uccello canta al mattino.\",\"usageExercise\":\"L\'_______ canta al mattino.\",\"syllables\":\"[\\\"U\\\",\\\"llo\\\",\\\"mo\\\",\\\"cce\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Mucca\",\"pronunciation\":\"múk-ka\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/d6o7mjw8a81q/Mucca.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/yfspct5wvnbe/Mucca_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/2q07jpuhhjzo/Mucca.png\",\"definition\":\"Un animale domestico da allevamento, noto per produrre latte.\",\"translation\":\"Vaca\",\"usage\":\"La mucca dà il latte.\",\"usageExercise\":\"La _____ dà il latte.\",\"syllables\":\"[\\\"cca\\\",\\\"ve\\\",\\\"Mu\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Maiale\",\"pronunciation\":\"ma-yá-le\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/gjflk04zrzrk/Maiale.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/aafcrf6rihox/Maiale_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/25c8zh92k7q1/Maiale.png\",\"definition\":\"Un animale da allevamento, spesso utilizzato per la produzione di carne.\",\"translation\":\"Cerdo\",\"usage\":\"Il maiale vive nel fango.\",\"usageExercise\":\"Il ______ vive nel fango.\",\"syllables\":\"[\\\"ia\\\",\\\"le\\\",\\\"Ma\\\",\\\"to\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Anatra\",\"pronunciation\":\"á-na-tra\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/escw0lla2dsb/Anatra.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/5wtmxizt9f29/Anatra_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/7un6dmj86bor/Anatra.png\",\"definition\":\"Un uccello acquatico con il corpo tozzo e il becco piatto.\",\"translation\":\"Pato\",\"usage\":\"L\'anatra nuota nel fiume.\",\"usageExercise\":\"L\'______ nuota nel fiume.\",\"syllables\":\"[\\\"tra\\\",\\\"A\\\",\\\"na\\\",\\\"de\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Ape\",\"pronunciation\":\"á-pe\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/0z3c2z8yrfoi/Ape.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/50yc4ldi2xrh/Ape_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/2yiuugcmkacx/Ape.png\",\"definition\":\"Un insetto che produce miele e polline.\",\"translation\":\"Abeja\",\"usage\":\"L\'ape vola tra i fiori.\",\"usageExercise\":\"L\'___ vola tra i fiori.\",\"syllables\":\"[\\\"pe\\\",\\\"A\\\",\\\"i\\\"]\",\"category\":\"1\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Macchina\",\"pronunciation\":\"má-ki-na\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/ewwsjplhl6z5/macchina.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/rt0nh8znkfs4/macchina_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/a9ao2gvtngkc/Macchina.png\",\"definition\":\"Un veicolo a motore utilizzato per il trasporto di persone o merci.\",\"translation\":\"Coche\",\"usage\":\"Guido la macchina al lavoro.\",\"usageExercise\":\"Guido la ________ al lavoro.\",\"syllables\":\"[\\\"Mac\\\",\\\"na\\\",\\\"chi\\\",\\\"to\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Motocicletta\",\"pronunciation\":\"mo-to-chi-lét-ta\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/l1jrz12qfjyz/Motocicletta.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/jpvuviezpefx/Motocicletta_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/i5nhphbwsusb/Motocicletta.png\",\"definition\":\"Un veicolo a due ruote azionato da un motore.\",\"translation\":\"Motocicleta\",\"usage\":\"Vado in motocicletta al mare.\",\"usageExercise\":\"Vado in ____________ al mare.\",\"syllables\":\"[\\\"to\\\",\\\"Mo\\\",\\\"cle\\\",\\\"ci\\\",\\\"tta\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Bicicletta\",\"pronunciation\":\"bi-chi-lét-ta\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/4shrt8xips45/Bicicletta.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/etm4e9m300qz/Bicicletta_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/wfdjtb6ew0af/Bicicletta.png\",\"definition\":\"Un veicolo a due ruote, azionato dalla forza muscolare di chi pedala.\",\"translation\":\"Bicicleta\",\"usage\":\"La bicicletta è ecologica.\",\"usageExercise\":\"La __________ è ecologica.\",\"syllables\":\"[\\\"tta\\\",\\\"ci\\\",\\\"cle\\\",\\\"Bi\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Autobus\",\"pronunciation\":\"áu-to-bus\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/3c3p2dx9xky2/Autobus.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/80wz3vb8is6u/Autobus_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/rc3jj42tr6ud/Autobus.png\",\"definition\":\"Un veicolo a motore utilizzato per il trasporto pubblico di persone.\",\"translation\":\"Autobús\",\"usage\":\"Prendo l\'autobus per andare a scuola.\",\"usageExercise\":\"Prendo l\'_______ per andare a scuola.\",\"syllables\":\"[\\\"to\\\",\\\"Au\\\",\\\"bus\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Treno\",\"pronunciation\":\"trè-no\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/8oaj6h4svt5i/Treno.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/hnu6qpgf65r1/Treno_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/sqyfqqs2db9z/Treno.png\",\"definition\":\"Un mezzo di trasporto su rotaia, utilizzato per spostamenti a lunga distanza.\",\"translation\":\"Tren\",\"usage\":\"Il treno arriva in stazione alle 10.\",\"usageExercise\":\"Il _____ arriva in stazione alle 10.\",\"syllables\":\"[\\\"no\\\",\\\"se\\\",\\\"Tre\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Barca\",\"pronunciation\":\"bár-ka\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/2w9mvkg1szu0/Barca.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/0dx43ugkbigk/Barca_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/6ows0jftt312/Barca.png\",\"definition\":\"Un\'imbarcazione utilizzata per il trasporto via acqua.\",\"translation\":\"Barco\",\"usage\":\"La barca naviga nel mare.\",\"usageExercise\":\"La _____ naviga nel mare.\",\"syllables\":\"[\\\"de\\\",\\\"ca\\\",\\\"Bar\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Elicottero\",\"pronunciation\":\"e-li-cót-te-ro\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/tbfe4ldnpjl0/Elicottero.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/dzczctsqu4l0/Elicottero_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/a8nrn08u7r8e/Elicottero.png\",\"definition\":\"Un veicolo aereo con pale rotanti, utilizzato per trasporti brevi e emergenze.\",\"translation\":\"Helicóptero\",\"usage\":\"L\'elicottero atterra sul tetto.\",\"usageExercise\":\"L\'__________ atterra sul tetto.\",\"syllables\":\"[\\\"li\\\",\\\"tte\\\",\\\"ro\\\",\\\"E\\\",\\\"co\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Nave\",\"pronunciation\":\"ná-ve\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/ae52q95v3kej/Nave.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/47u1mhccry0h/Nave_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/9x07ghe664yb/Nave.png\",\"definition\":\"Una grande imbarcazione utilizzata per il trasporto di persone e merci.\",\"translation\":\"Barco\",\"usage\":\"La nave salpa domani.\",\"usageExercise\":\"La ____ salpa domani.\",\"syllables\":\"[\\\"Na\\\",\\\"si\\\",\\\"cce\\\",\\\"ve\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Aereo\",\"pronunciation\":\"a-é-re-o\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/2f09742cwjb7/Aereo.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/j6g409qlw4og/Aereo_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/bfcxy91zcbwu/Aereo.png\",\"definition\":\"Un veicolo aereo utilizzato per il trasporto di passeggeri e merci su lunghe distanze.\",\"translation\":\"Avion\",\"usage\":\"L\'aereo decolla alle 8.\",\"usageExercise\":\"L\'_____ decolla alle 8.\",\"syllables\":\"[\\\"e\\\",\\\"A\\\",\\\"o\\\",\\\"re\\\"]\",\"category\":\"2\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Forchetta\",\"pronunciation\":\"for-qué-ta\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/uj29m6j3o956/Forchetta.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/3mdwubt3xlhh/Forchetta_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/hovolt9zg70q/Forchetta.png\",\"definition\":\"Utensile da tavola con denti, utilizzato per prendere e portare il cibo alla bocca.\",\"translation\":\"Tenedor\",\"usage\":\"Prendo la pasta con la forchetta.\",\"usageExercise\":\"Prendo la pasta con la _________.\",\"syllables\":\"[\\\"che\\\",\\\"For\\\",\\\"tta\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Coltello\",\"pronunciation\":\"col-tél-lo\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/ue1twavsujc3/Coltello.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/x78dj29d16py/Coltello_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/3ztpww5upzwm/Coltello.png\",\"definition\":\"Utensile da taglio usato per affettare il cibo.\",\"translation\":\"Cuchillo\",\"usage\":\"Taglio il pane con il coltello.\",\"usageExercise\":\"Taglio il pane con il ________.\",\"syllables\":\"[\\\"te\\\",\\\"re\\\",\\\"Col\\\",\\\"llo\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Cucchiaio\",\"pronunciation\":\"cuc-quiá-yo\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/084k116cm7hx/Cucchiaio.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/v9gfx7j6wqrj/Cucchiaio_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/56yomlxorb41/Cucchiaio.png\",\"definition\":\"Utensile da tavola a forma concava, usato per consumare alimenti liquidi.\",\"translation\":\"Cuchara\",\"usage\":\"Mangio la zuppa con il cucchiaio.\",\"usageExercise\":\"Mangio la zuppa con il _________.\",\"syllables\":\"[\\\"Cu\\\",\\\"aio\\\",\\\"cchi\\\",\\\"so\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Piatto\",\"pronunciation\":\"piát-to\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/xa8i69oujr3k/Piatto.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/6j7nt96yrohf/Piatto_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/rocww1lbvmws/Piatto.png\",\"definition\":\"Superficie piana su cui si serve il cibo.\",\"translation\":\"Plato\",\"usage\":\"Il piatto è pieno di spaghetti.\",\"usageExercise\":\"Il _____ è pieno di spaghetti.\",\"syllables\":\"[\\\"tto\\\",\\\"wi\\\",\\\"Pia\\\",\\\"ne\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Scodella\",\"pronunciation\":\"sco-dé-lla\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/etz7b8evlluv/Scodella.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/prmnbojhxdrr/Scodella_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/kqcuqtn78oaq/Scodella.png\",\"definition\":\"Contenitore profondo usato per servire zuppe e cereali.\",\"translation\":\"Tazón\",\"usage\":\"Verso la minestra nella scodella.\",\"usageExercise\":\"Verso la minestra nella ________.\",\"syllables\":\"[\\\"lla\\\",\\\"sa\\\",\\\"de\\\",\\\"Sco\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Tazza\",\"pronunciation\":\"tá-tsa\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/qiii1qvzcm5f/Tazza.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/3v724vtow6cu/Tazza_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/4930eb7d3soe/Tazza.png\",\"definition\":\"Contenitore con manico per bere bevande calde.\",\"translation\":\"Taza\",\"usage\":\"Bevo il tè nella tazza.\",\"usageExercise\":\"Bevo il tè nella _____.\",\"syllables\":\"[\\\"su\\\",\\\"Ta\\\",\\\"to\\\",\\\"zza\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Bicchiere\",\"pronunciation\":\"bi-quié-re\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/5r7fngy53zbr/Bicchiere.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/tmy7vlx4s44e/Bicchiere_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/rml46uzpqnr7/Bicchiere.png\",\"definition\":\"Contenitore di vetro usato per bere liquidi.\",\"translation\":\"Vaso\",\"usage\":\"Verso l\'acqua nel bicchiere.\",\"usageExercise\":\"Verso l\'acqua nel _________.\",\"syllables\":\"[\\\"Bi\\\",\\\"re\\\",\\\"ji\\\",\\\"cchi\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Frigorifero\",\"pronunciation\":\"fri-go-rí-fe-ro\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/zaupbzdy81n8/Frigorifero.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/y6pf08hmmwqw/Frigorifero_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/2sooipduzmz1/Frigorifero.png\",\"definition\":\"Elettrodomestico usato per conservare i cibi al fresco.\",\"translation\":\"Nevera\",\"usage\":\"Metto il latte in frigorifero.\",\"usageExercise\":\"Metto il latte in ___________.\",\"syllables\":\"[\\\"go\\\",\\\"fe\\\",\\\"Fri\\\",\\\"ro\\\",\\\"ri\\\"]\",\"category\":\"3\"}')),
    WordStruct.fromSerializableMap(jsonDecode(
        '{\"word\":\"Forno\",\"pronunciation\":\"fór-no\",\"audio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/d0zqh29t8cwy/Forno.mp3\",\"slowAudio\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/24jzhjf1zmy0/Forno_Slow.mp3\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/wbekmdpeltv1/Forno.png\",\"definition\":\"Elettrodomestico usato per cucinare o riscaldare cibi ad alte temperature.\",\"translation\":\"Horno\",\"usage\":\"Cuocio la pizza nel forno.\",\"usageExercise\":\"Cuocio la pizza nel _____.\",\"syllables\":\"[\\\"no\\\",\\\"ga\\\",\\\"For\\\",\\\"cci\\\"]\",\"category\":\"3\"}'))
  ];
  List<WordStruct> get words => _words;
  set words(List<WordStruct> value) {
    _words = value;
    prefs.setStringList('ff_words', value.map((x) => x.serialize()).toList());
  }

  void addToWords(WordStruct value) {
    words.add(value);
    prefs.setStringList('ff_words', _words.map((x) => x.serialize()).toList());
  }

  void removeFromWords(WordStruct value) {
    words.remove(value);
    prefs.setStringList('ff_words', _words.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWords(int index) {
    words.removeAt(index);
    prefs.setStringList('ff_words', _words.map((x) => x.serialize()).toList());
  }

  void updateWordsAtIndex(
    int index,
    WordStruct Function(WordStruct) updateFn,
  ) {
    words[index] = updateFn(_words[index]);
    prefs.setStringList('ff_words', _words.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWords(int index, WordStruct value) {
    words.insert(index, value);
    prefs.setStringList('ff_words', _words.map((x) => x.serialize()).toList());
  }

  int _sessionCounter = 0;
  int get sessionCounter => _sessionCounter;
  set sessionCounter(int value) {
    _sessionCounter = value;
    prefs.setInt('ff_sessionCounter', value);
  }

  List<ListWordStruct> _wordLearned = [];
  List<ListWordStruct> get wordLearned => _wordLearned;
  set wordLearned(List<ListWordStruct> value) {
    _wordLearned = value;
    prefs.setStringList(
        'ff_wordLearned', value.map((x) => x.serialize()).toList());
  }

  void addToWordLearned(ListWordStruct value) {
    wordLearned.add(value);
    prefs.setStringList(
        'ff_wordLearned', _wordLearned.map((x) => x.serialize()).toList());
  }

  void removeFromWordLearned(ListWordStruct value) {
    wordLearned.remove(value);
    prefs.setStringList(
        'ff_wordLearned', _wordLearned.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWordLearned(int index) {
    wordLearned.removeAt(index);
    prefs.setStringList(
        'ff_wordLearned', _wordLearned.map((x) => x.serialize()).toList());
  }

  void updateWordLearnedAtIndex(
    int index,
    ListWordStruct Function(ListWordStruct) updateFn,
  ) {
    wordLearned[index] = updateFn(_wordLearned[index]);
    prefs.setStringList(
        'ff_wordLearned', _wordLearned.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWordLearned(int index, ListWordStruct value) {
    wordLearned.insert(index, value);
    prefs.setStringList(
        'ff_wordLearned', _wordLearned.map((x) => x.serialize()).toList());
  }

  List<ListWordStruct> _wordsLearning = [];
  List<ListWordStruct> get wordsLearning => _wordsLearning;
  set wordsLearning(List<ListWordStruct> value) {
    _wordsLearning = value;
    prefs.setStringList(
        'ff_wordsLearning', value.map((x) => x.serialize()).toList());
  }

  void addToWordsLearning(ListWordStruct value) {
    wordsLearning.add(value);
    prefs.setStringList(
        'ff_wordsLearning', _wordsLearning.map((x) => x.serialize()).toList());
  }

  void removeFromWordsLearning(ListWordStruct value) {
    wordsLearning.remove(value);
    prefs.setStringList(
        'ff_wordsLearning', _wordsLearning.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWordsLearning(int index) {
    wordsLearning.removeAt(index);
    prefs.setStringList(
        'ff_wordsLearning', _wordsLearning.map((x) => x.serialize()).toList());
  }

  void updateWordsLearningAtIndex(
    int index,
    ListWordStruct Function(ListWordStruct) updateFn,
  ) {
    wordsLearning[index] = updateFn(_wordsLearning[index]);
    prefs.setStringList(
        'ff_wordsLearning', _wordsLearning.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWordsLearning(int index, ListWordStruct value) {
    wordsLearning.insert(index, value);
    prefs.setStringList(
        'ff_wordsLearning', _wordsLearning.map((x) => x.serialize()).toList());
  }

  List<ExerciseListStruct> _exercises = [];
  List<ExerciseListStruct> get exercises => _exercises;
  set exercises(List<ExerciseListStruct> value) {
    _exercises = value;
    prefs.setStringList(
        'ff_exercises', value.map((x) => x.serialize()).toList());
  }

  void addToExercises(ExerciseListStruct value) {
    exercises.add(value);
    prefs.setStringList(
        'ff_exercises', _exercises.map((x) => x.serialize()).toList());
  }

  void removeFromExercises(ExerciseListStruct value) {
    exercises.remove(value);
    prefs.setStringList(
        'ff_exercises', _exercises.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromExercises(int index) {
    exercises.removeAt(index);
    prefs.setStringList(
        'ff_exercises', _exercises.map((x) => x.serialize()).toList());
  }

  void updateExercisesAtIndex(
    int index,
    ExerciseListStruct Function(ExerciseListStruct) updateFn,
  ) {
    exercises[index] = updateFn(_exercises[index]);
    prefs.setStringList(
        'ff_exercises', _exercises.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInExercises(int index, ExerciseListStruct value) {
    exercises.insert(index, value);
    prefs.setStringList(
        'ff_exercises', _exercises.map((x) => x.serialize()).toList());
  }

  List<ExerciseListStruct> _exerciseTesting = [];
  List<ExerciseListStruct> get exerciseTesting => _exerciseTesting;
  set exerciseTesting(List<ExerciseListStruct> value) {
    _exerciseTesting = value;
    prefs.setStringList(
        'ff_exerciseTesting', value.map((x) => x.serialize()).toList());
  }

  void addToExerciseTesting(ExerciseListStruct value) {
    exerciseTesting.add(value);
    prefs.setStringList('ff_exerciseTesting',
        _exerciseTesting.map((x) => x.serialize()).toList());
  }

  void removeFromExerciseTesting(ExerciseListStruct value) {
    exerciseTesting.remove(value);
    prefs.setStringList('ff_exerciseTesting',
        _exerciseTesting.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromExerciseTesting(int index) {
    exerciseTesting.removeAt(index);
    prefs.setStringList('ff_exerciseTesting',
        _exerciseTesting.map((x) => x.serialize()).toList());
  }

  void updateExerciseTestingAtIndex(
    int index,
    ExerciseListStruct Function(ExerciseListStruct) updateFn,
  ) {
    exerciseTesting[index] = updateFn(_exerciseTesting[index]);
    prefs.setStringList('ff_exerciseTesting',
        _exerciseTesting.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInExerciseTesting(int index, ExerciseListStruct value) {
    exerciseTesting.insert(index, value);
    prefs.setStringList('ff_exerciseTesting',
        _exerciseTesting.map((x) => x.serialize()).toList());
  }

  ExerciseListStruct _currentExercise = ExerciseListStruct.fromSerializableMap(
      jsonDecode('{\"word\":\"NA\",\"exercise\":\"0\"}'));
  ExerciseListStruct get currentExercise => _currentExercise;
  set currentExercise(ExerciseListStruct value) {
    _currentExercise = value;
    prefs.setString('ff_currentExercise', value.serialize());
  }

  void updateCurrentExerciseStruct(Function(ExerciseListStruct) updateFn) {
    updateFn(_currentExercise);
    prefs.setString('ff_currentExercise', _currentExercise.serialize());
  }

  int _currentMistakes = 0;
  int get currentMistakes => _currentMistakes;
  set currentMistakes(int value) {
    _currentMistakes = value;
    prefs.setInt('ff_currentMistakes', value);
  }

  int _sessionMistakes = 0;
  int get sessionMistakes => _sessionMistakes;
  set sessionMistakes(int value) {
    _sessionMistakes = value;
    prefs.setInt('ff_sessionMistakes', value);
  }

  int _hits = 0;
  int get hits => _hits;
  set hits(int value) {
    _hits = value;
    prefs.setInt('ff_hits', value);
  }

  int _attempts = 0;
  int get attempts => _attempts;
  set attempts(int value) {
    _attempts = value;
    prefs.setInt('ff_attempts', value);
  }

  List<String> _newWords = [];
  List<String> get newWords => _newWords;
  set newWords(List<String> value) {
    _newWords = value;
    prefs.setStringList('ff_newWords', value);
  }

  void addToNewWords(String value) {
    newWords.add(value);
    prefs.setStringList('ff_newWords', _newWords);
  }

  void removeFromNewWords(String value) {
    newWords.remove(value);
    prefs.setStringList('ff_newWords', _newWords);
  }

  void removeAtIndexFromNewWords(int index) {
    newWords.removeAt(index);
    prefs.setStringList('ff_newWords', _newWords);
  }

  void updateNewWordsAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    newWords[index] = updateFn(_newWords[index]);
    prefs.setStringList('ff_newWords', _newWords);
  }

  void insertAtIndexInNewWords(int index, String value) {
    newWords.insert(index, value);
    prefs.setStringList('ff_newWords', _newWords);
  }

  String _playerName = 'player1';
  String get playerName => _playerName;
  set playerName(String value) {
    _playerName = value;
    prefs.setString('ff_playerName', value);
  }

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  set isDarkMode(bool value) {
    _isDarkMode = value;
    prefs.setBool('ff_isDarkMode', value);
  }

  int _levelsCount = 0;
  int get levelsCount => _levelsCount;
  set levelsCount(int value) {
    _levelsCount = value;
  }

  bool _isHapticAllowed = true;
  bool get isHapticAllowed => _isHapticAllowed;
  set isHapticAllowed(bool value) {
    _isHapticAllowed = value;
  }

  bool _isSoundOn = false;
  bool get isSoundOn => _isSoundOn;
  set isSoundOn(bool value) {
    _isSoundOn = value;
  }

  String _musicFile =
      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/0s2gwb0d5i0x/audio.mp3';
  String get musicFile => _musicFile;
  set musicFile(String value) {
    _musicFile = value;
  }

  double _currentMusicVolume = 0.1;
  double get currentMusicVolume => _currentMusicVolume;
  set currentMusicVolume(double value) {
    _currentMusicVolume = value;
  }

  bool _Practicando = false;
  bool get Practicando => _Practicando;
  set Practicando(bool value) {
    _Practicando = value;
  }

  int _Aleatorio = 0;
  int get Aleatorio => _Aleatorio;
  set Aleatorio(int value) {
    _Aleatorio = value;
  }

  int _category = 0;
  int get category => _category;
  set category(int value) {
    _category = value;
    prefs.setInt('ff_category', value);
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
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
