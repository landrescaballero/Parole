import '/backend/schema/structs/index.dart';
import '/components/correct_option/correct_option_widget.dart';
import '/components/in_correct_option/in_correct_option_widget.dart';
import '/components/see_later/see_later_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'game_page4_multiple_images_model.dart';
export 'game_page4_multiple_images_model.dart';

class GamePage4MultipleImagesWidget extends StatefulWidget {
  const GamePage4MultipleImagesWidget({super.key});

  @override
  State<GamePage4MultipleImagesWidget> createState() =>
      _GamePage4MultipleImagesWidgetState();
}

class _GamePage4MultipleImagesWidgetState
    extends State<GamePage4MultipleImagesWidget> {
  late GamePage4MultipleImagesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePage4MultipleImagesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentWord = FFAppState()
          .words
          .where((e) => e.word == FFAppState().currentExercise.word)
          .toList()
          .first;
      safeSetState(() {});
      _model.listOptions = FFAppState()
          .words
          .where((e) =>
              (e.category == _model.currentWord?.category) &&
              (e.word != _model.currentWord?.word))
          .toList()
          .toList()
          .cast<WordStruct>();
      safeSetState(() {});
      _model.options = functions
          .shuffleExerciseOptions(
              _model.listOptions.toList(), _model.currentWord!)
          .toList()
          .cast<WordStruct>();
      safeSetState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primary,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              if (FFAppState().Practicando) {
                context.pushNamed('SelectActivity');
              } else {
                context.pushNamed('MainMenu');
              }
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Seleciona la imagen que corresponda a la palabra ${_model.currentWord?.word}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).displaySmall.override(
                            fontFamily: 'OpenDyslexic',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 25.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final imageOptions = _model.options.toList();

                        return GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: 1.0,
                          ),
                          scrollDirection: Axis.vertical,
                          itemCount: imageOptions.length,
                          itemBuilder: (context, imageOptionsIndex) {
                            final imageOptionsItem =
                                imageOptions[imageOptionsIndex];
                            return InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                FFAppState().attempts =
                                    FFAppState().attempts + 1;
                                safeSetState(() {});
                                if (imageOptionsItem.word ==
                                    _model.currentWord?.word) {
                                  if (FFAppState().exercises.length > 0) {
                                    FFAppState().currentExercise =
                                        FFAppState().exercises.first;
                                    FFAppState().hits = FFAppState().hits + 1;
                                    safeSetState(() {});
                                    FFAppState().currentMistakes = 0;
                                    safeSetState(() {});
                                    FFAppState().removeAtIndexFromExercises(0);
                                    safeSetState(() {});
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.3,
                                              child: CorrectOptionWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    if (FFAppState().currentExercise.exercise ==
                                        1) {
                                      context.pushNamed('GamePage1Translation');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        2) {
                                      context.pushNamed('GamePage2Image');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        3) {
                                      context.pushNamed('GamePage3Sound');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        4) {
                                      context
                                          .pushNamed('GamePage4MultipleImages');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        5) {
                                      context
                                          .pushNamed('GamePage5MultipleSounds');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        6) {
                                      context.pushNamed('gamePage6Syllables');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        7) {
                                      context.pushNamed('gamePage7Write');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        8) {
                                      context.pushNamed('gamePage8Usage');
                                    } else {
                                      context.pushNamed('MainMenu');
                                    }
                                  } else {
                                    context.pushNamed('ConfettiWinnerPage');
                                  }
                                } else {
                                  FFAppState().currentMistakes =
                                      FFAppState().currentMistakes + 1;
                                  FFAppState().sessionMistakes =
                                      FFAppState().sessionMistakes + 1;
                                  safeSetState(() {});
                                  if (FFAppState().currentMistakes > 2) {
                                    await actions.addExerciseToRetry(
                                      FFAppState().currentExercise,
                                    );
                                    FFAppState().currentExercise =
                                        FFAppState().exercises.first;
                                    FFAppState().removeAtIndexFromExercises(0);
                                    FFAppState().currentMistakes = 0;
                                    safeSetState(() {});
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.3,
                                              child: SeeLaterWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));

                                    if (FFAppState().currentExercise.exercise ==
                                        1) {
                                      context.pushNamed('GamePage1Translation');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        2) {
                                      context.pushNamed('GamePage2Image');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        3) {
                                      context.pushNamed('GamePage3Sound');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        4) {
                                      context
                                          .pushNamed('GamePage4MultipleImages');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        5) {
                                      context
                                          .pushNamed('GamePage5MultipleSounds');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        6) {
                                      context.pushNamed('gamePage6Syllables');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        7) {
                                      context.pushNamed('gamePage7Write');
                                    } else if (FFAppState()
                                            .currentExercise
                                            .exercise ==
                                        8) {
                                      context.pushNamed('gamePage8Usage');
                                    } else {
                                      context.pushNamed('MainMenu');
                                    }
                                  } else {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      enableDrag: false,
                                      context: context,
                                      builder: (context) {
                                        return GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(context).unfocus(),
                                          child: Padding(
                                            padding: MediaQuery.viewInsetsOf(
                                                context),
                                            child: Container(
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.3,
                                              child: InCorrectOptionWidget(),
                                            ),
                                          ),
                                        );
                                      },
                                    ).then((value) => safeSetState(() {}));
                                  }
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(24.0),
                                child: Image.network(
                                  imageOptionsItem.image,
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 40.0)).around(SizedBox(height: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
