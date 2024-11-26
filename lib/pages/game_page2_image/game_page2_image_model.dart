import '/backend/schema/structs/index.dart';
import '/components/correct_option/correct_option_widget.dart';
import '/components/in_correct_option/in_correct_option_widget.dart';
import '/components/new_word_card/new_word_card_widget.dart';
import '/components/see_later/see_later_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'game_page2_image_widget.dart' show GamePage2ImageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class GamePage2ImageModel extends FlutterFlowModel<GamePage2ImageWidget> {
  ///  Local state fields for this page.

  WordStruct? currentWord;
  void updateCurrentWordStruct(Function(WordStruct) updateFn) {
    updateFn(currentWord ??= WordStruct());
  }

  List<WordStruct> options = [];
  void addToOptions(WordStruct item) => options.add(item);
  void removeFromOptions(WordStruct item) => options.remove(item);
  void removeAtIndexFromOptions(int index) => options.removeAt(index);
  void insertAtIndexInOptions(int index, WordStruct item) =>
      options.insert(index, item);
  void updateOptionsAtIndex(int index, Function(WordStruct) updateFn) =>
      options[index] = updateFn(options[index]);

  List<WordStruct> listOptions = [];
  void addToListOptions(WordStruct item) => listOptions.add(item);
  void removeFromListOptions(WordStruct item) => listOptions.remove(item);
  void removeAtIndexFromListOptions(int index) => listOptions.removeAt(index);
  void insertAtIndexInListOptions(int index, WordStruct item) =>
      listOptions.insert(index, item);
  void updateListOptionsAtIndex(int index, Function(WordStruct) updateFn) =>
      listOptions[index] = updateFn(listOptions[index]);

  int? posibleIndex = 0;

  int? index = 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
