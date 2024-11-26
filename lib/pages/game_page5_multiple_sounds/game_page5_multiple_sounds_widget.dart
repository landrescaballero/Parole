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
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'game_page5_multiple_sounds_model.dart';
export 'game_page5_multiple_sounds_model.dart';

class GamePage5MultipleSoundsWidget extends StatefulWidget {
  const GamePage5MultipleSoundsWidget({super.key});

  @override
  State<GamePage5MultipleSoundsWidget> createState() =>
      _GamePage5MultipleSoundsWidgetState();
}

class _GamePage5MultipleSoundsWidgetState
    extends State<GamePage5MultipleSoundsWidget> {
  late GamePage5MultipleSoundsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePage5MultipleSoundsModel());

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Seleciona el audio que corresponda a la palabra: ${_model.currentWord?.word}',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'OpenDyslexic',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 23.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Text(
                    'Presiona una vez el boton para escucharlo y manten presionado para selecionarlo ',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'OpenDyslexic',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final soundsOptions = _model.options.toList();

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
                          itemCount: soundsOptions.length,
                          itemBuilder: (context, soundsOptionsIndex) {
                            final soundsOptionsItem =
                                soundsOptions[soundsOptionsIndex];
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onLongPress: () async {
                                  FFAppState().attempts =
                                      FFAppState().attempts + 1;
                                  safeSetState(() {});
                                  if (soundsOptionsItem.word ==
                                      _model.currentWord?.word) {
                                    if (FFAppState().exercises.length > 0) {
                                      FFAppState().currentExercise =
                                          FFAppState().exercises.first;
                                      FFAppState()
                                          .removeAtIndexFromExercises(0);
                                      FFAppState().hits = FFAppState().hits + 1;
                                      safeSetState(() {});
                                      FFAppState().currentMistakes = 0;
                                      safeSetState(() {});
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.3,
                                                child: CorrectOptionWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      if (FFAppState()
                                              .currentExercise
                                              .exercise ==
                                          1) {
                                        context
                                            .pushNamed('GamePage1Translation');
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
                                        context.pushNamed(
                                            'GamePage4MultipleImages');
                                      } else if (FFAppState()
                                              .currentExercise
                                              .exercise ==
                                          5) {
                                        context.pushNamed(
                                            'GamePage5MultipleSounds');
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
                                      FFAppState()
                                          .removeAtIndexFromExercises(0);
                                      FFAppState().currentMistakes = 0;
                                      safeSetState(() {});
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.3,
                                                child: SeeLaterWidget(),
                                              ),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));

                                      if (FFAppState()
                                              .currentExercise
                                              .exercise ==
                                          1) {
                                        context
                                            .pushNamed('GamePage1Translation');
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
                                        context.pushNamed(
                                            'GamePage4MultipleImages');
                                      } else if (FFAppState()
                                              .currentExercise
                                              .exercise ==
                                          5) {
                                        context.pushNamed(
                                            'GamePage5MultipleSounds');
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
                                            onTap: () => FocusScope.of(context)
                                                .unfocus(),
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
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
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    _model.soundPlayer ??= AudioPlayer();
                                    if (_model.soundPlayer!.playing) {
                                      await _model.soundPlayer!.stop();
                                    }
                                    _model.soundPlayer!.setVolume(1.0);
                                    _model.soundPlayer!
                                        .setUrl(soundsOptionsItem.audio)
                                        .then(
                                            (_) => _model.soundPlayer!.play());
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.music_note,
                                    size: 110.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 150.0,
                                    height: 150.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color:
                                        FlutterFlowTheme.of(context).tertiary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'OpenDyslexic',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                    elevation: 0.0,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ].divide(SizedBox(height: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
