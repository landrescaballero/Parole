import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

List<WordStruct> shuffleExerciseOptions(
  List<WordStruct> listOptions,
  WordStruct correctOption,
) {
  if (listOptions.length <= 3) {
    listOptions.shuffle();
    int randomPosition = math.Random().nextInt(listOptions.length + 1);

    // Insertar el elemento en la posición aleatoria
    listOptions.insert(randomPosition, correctOption);
    return listOptions; // Devuelve la lista completa si tiene 3 o menos elementos.
  }
  listOptions.shuffle();
  final randomItems = listOptions.take(3).toList();

  int randomPosition = math.Random().nextInt(randomItems.length + 1);

  // Insertar el elemento en la posición aleatoria
  randomItems.insert(randomPosition, correctOption);

  return randomItems;
}
