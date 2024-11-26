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
            FFAppState().wordLearned.any((w) => w.word == palabra.word) ||
            FFAppState().wordsLearning.any((w) => w.word == palabra.word));
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
    int ejercicio = availableExercise(newWord);
    newWord.exercises.add(ejercicio);
    ExerciseListStruct pair =
        new ExerciseListStruct(word: nuevaPalabra.word, exercise: ejercicio);
    pares.add(pair);
    FFAppState().wordsLearning.add(newWord);
    FFAppState().newWords.add(newWord.word);
  }

  var aprendidaUsada = false;
  FFAppState().counter = FFAppState().counter++;
  print("Categoria:");
  print(categoriaMaximaDisponible);
  print("\n");
  print("palabras disponibles(${palabrasDisponibles.length}):");
  for (var element in palabrasDisponibles) {
    print(element.word);
  }
  print("\n");
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
  print("\n================================\n");
  pares.forEach(print);
  print("\n================================\n");
  return pares;

  /// MODIFY CODE ONLY ABOVE THIS LINE
}

// OLD WORKING VERSION
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
}
// int availableExercise(ListWordStruct word) {
//   // Obtén los ejercicios posibles para el nivel de dificultad actual
//   List<int> ejerciciosPosibles =
//       ejerciciosPorDificultad[word.currentDifficulty]!;

//   // Elimina los ejercicios que ya han sido asignados
//   ejerciciosPosibles
//       .removeWhere((ejercicio) => word.exercises.contains(ejercicio));

//   // Si no hay ejercicios posibles, y la palabra no ha alcanzado el límite de su dificultad, incrementa la dificultad
//   if (ejerciciosPosibles.isEmpty) {
//     if (word.currentDifficulty < 3) {
//       word.currentDifficulty++; // Sube la dificultad si es posible
//       return availableExercise(
//           word); // Vuelve a intentar con el nuevo nivel de dificultad
//     } else {
//       return -1; // Si ya no hay más ejercicios posibles y la dificultad es 3, no hay más ejercicios disponibles
//     }
//   }

//   // Si hay ejercicios disponibles, selecciona uno aleatorio
//   return ejerciciosPosibles[math.Random().nextInt(ejerciciosPosibles.length)];
// }
