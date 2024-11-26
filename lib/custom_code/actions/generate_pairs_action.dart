// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math' as math;

Map<int, List<int>> ejerciciosPorDificultad = {
  1: [1, 2, 3],
  2: [4, 5],
  3: [6, 7, 8],
};

Future generatePairsAction() async {
  generatePairs();
}

List<ExerciseListStruct> generatePairs() {
  List<ExerciseListStruct> pares = [];
  int maxPares = 7;

  List<WordStruct> palabrasDisponibles = FFAppState()
      .words
      .where((palabra) =>
          !FFAppState().wordsLearning.any((wl) => wl.word == palabra.word) &&
          !FFAppState().wordLearned.any((wl) => wl.word == palabra.word))
      .toList();

  bool categoriaCompleta(int categoria) {
    return FFAppState()
        .words
        .where((palabra) => palabra.category == categoria)
        .every((palabra) =>
            FFAppState().wordLearned.contains(palabra) ||
            FFAppState().wordsLearning.contains(palabra));
  }

  int categoriaMaximaDisponible = 1;
  for (int i = 1; i <= 4; i++) {
    if (categoriaCompleta(i)) {
      categoriaMaximaDisponible = i + 1;
      FFAppState().category = categoriaMaximaDisponible;
    } else {
      FFAppState().category = categoriaMaximaDisponible;
      break;
    }
  }

  palabrasDisponibles = palabrasDisponibles
      .where((palabra) => palabra.category <= categoriaMaximaDisponible)
      .toList();

  if (palabrasDisponibles.isNotEmpty && FFAppState().wordsLearning.length < 3) {
    var nuevaPalabra =
        palabrasDisponibles[math.Random().nextInt(palabrasDisponibles.length)];
    ListWordStruct newWord =
        new ListWordStruct(word: nuevaPalabra.word, exercises: []);
    ExerciseListStruct pair = new ExerciseListStruct(
        word: nuevaPalabra.word, exercise: availableExercise(newWord));
    pares.add(pair);
    FFAppState().wordsLearning.add(newWord);
    FFAppState().newWords.add(newWord.word);
  }

  var aprendidaUsada = false;
  FFAppState().counter = FFAppState().counter++;
  while (pares.length < maxPares) {
    if (FFAppState().wordsLearning.isNotEmpty) {
      var palabra = FFAppState().wordsLearning[
          math.Random().nextInt(FFAppState().wordsLearning.length)];
      int ejercicio = availableExercise(palabra);

      if (ejercicio != -1) {
        ExerciseListStruct pair =
            new ExerciseListStruct(word: palabra.word, exercise: ejercicio);
        pares.add(pair);
        palabra.exercises.add(ejercicio);
        palabra.views++;

        if (palabra.exercises.length ==
            ejerciciosPorDificultad.values.expand((e) => e).toList().length) {
          FFAppState().wordsLearning.remove(palabra);
          FFAppState().wordLearned.add(palabra);
        }
      }
    }

    if (FFAppState().wordLearned.isNotEmpty) {
      List<ListWordStruct> palabrasMenosVistas = [];
      int minVistas = FFAppState()
          .wordLearned
          .map((palabra) => palabra.views)
          .reduce((a, b) => a < b ? a : b);
      FFAppState().wordLearned.forEach((palabra) {
        if (palabra.views == minVistas) {
          palabrasMenosVistas.add(palabra);
        }
      });
      int index = math.Random().nextInt(palabrasMenosVistas.length);
      var palabraAprendida = palabrasMenosVistas[index];
      int ejercicio = math.Random().nextInt(8) + 1;

      if (!aprendidaUsada) {
        ExerciseListStruct pair = new ExerciseListStruct(
            word: palabraAprendida.word, exercise: ejercicio);
        pares.add(pair);
        aprendidaUsada = true;
        palabraAprendida.views++;
        palabraAprendida.exercises.add(ejercicio);
      }
    }
    //DELETE BELOW IF IS NOT WORKING
    if (palabrasDisponibles.isEmpty && FFAppState().wordLearned.isNotEmpty) {
      List<ListWordStruct> palabrasMenosVistas = [];
      int minVistas = FFAppState()
          .wordLearned
          .map((palabra) => palabra.views)
          .reduce((a, b) => a < b ? a : b);
      FFAppState().wordLearned.forEach((palabra) {
        if (palabra.views == minVistas) {
          palabrasMenosVistas.add(palabra);
        }
      });
      int index = math.Random().nextInt(palabrasMenosVistas.length);
      var palabraAprendida = palabrasMenosVistas[index];
      int ejercicio = math.Random().nextInt(8) + 1;

      ExerciseListStruct pair = new ExerciseListStruct(
          word: palabraAprendida.word, exercise: ejercicio);
      pares.add(pair);
      palabraAprendida.views++;
      palabraAprendida.exercises.add(ejercicio);
    }
    //DELETE ABOVE IF IS NOT WORKING
    palabrasDisponibles = FFAppState()
        .words
        .where((palabra) =>
            !FFAppState().wordsLearning.contains(palabra) &&
            !FFAppState().wordLearned.contains(palabra))
        .where((palabra) => palabra.category <= categoriaMaximaDisponible)
        .toList();
  }
  pares.forEach((par) {
    FFAppState().exercises.add(par);
  });
  FFAppState().counter = FFAppState().counter++;
  return pares;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

int availableExercise(ListWordStruct word) {
  List<int> ejerciciosPosibles =
      ejerciciosPorDificultad[word.currentDifficulty]!.toList();
  ejerciciosPosibles
      .removeWhere((ejercicio) => word.exercises.contains(ejercicio));

  if (ejerciciosPosibles.isEmpty) {
    if (word.currentDifficulty < 3) {
      word.currentDifficulty++;
      return availableExercise(word);
    } else {
      return -1;
    }
  }

  return ejerciciosPosibles[math.Random().nextInt(ejerciciosPosibles.length)];

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
