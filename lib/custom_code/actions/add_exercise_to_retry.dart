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

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
int getDifficultyLevel(int exercise) {
  if (exercise <= 3) return 1;
  if (exercise <= 5) return 2;
  return 3;
}

Future addExerciseToRetry(ExerciseListStruct exerciseToRetry) async {
  String newWord = exerciseToRetry.word;
  int newExercise = exerciseToRetry.exercise;
  int newDifficulty = getDifficultyLevel(newExercise);

  List<ExerciseListStruct> exercisesList = FFAppState().exercises;
  int indexToInsert = exercisesList.length;

  for (int i = 0; i < exercisesList.length; i++) {
    ExerciseListStruct item = exercisesList[i];
    if (item.word == newWord &&
        getDifficultyLevel(item.exercise) > newDifficulty) {
      indexToInsert = i;
      break;
    }
  }

  FFAppState().exercises.insert(indexToInsert, exerciseToRetry);
}
