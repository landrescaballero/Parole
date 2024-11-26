import '/backend/schema/structs/index.dart';
import '/components/correct_option/correct_option_widget.dart';
import '/components/in_correct_option/in_correct_option_widget.dart';
import '/components/new_word_card/new_word_card_widget.dart';
import '/components/see_later/see_later_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'game_page3_sound_model.dart';
export 'game_page3_sound_model.dart';

class GamePage3SoundWidget extends StatefulWidget {
  const GamePage3SoundWidget({super.key});

  @override
  State<GamePage3SoundWidget> createState() => _GamePage3SoundWidgetState();
}

class _GamePage3SoundWidgetState extends State<GamePage3SoundWidget>
    with TickerProviderStateMixin {
  late GamePage3SoundModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePage3SoundModel());

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
      if (FFAppState()
              .newWords
              .where((e) => e == _model.currentWord?.word)
              .toList()
              .length >
          0) {
        FFAppState().removeFromNewWords(_model.currentWord!.word);
        safeSetState(() {});
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.9,
                  child: NewWordCardWidget(
                    wordInfo: _model.currentWord!,
                  ),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
    });

    animationsMap.addAll({
      'buttonOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.bounceOut,
            delay: 0.0.ms,
            duration: 860.0.ms,
            begin: Offset(1.0, 1.0),
            end: Offset(1.05, 1.1),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      'Seleciona  la palabra correspondiente al sonido',
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'OpenDyslexic',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.soundPlayer ??= AudioPlayer();
                        if (_model.soundPlayer!.playing) {
                          await _model.soundPlayer!.stop();
                        }
                        _model.soundPlayer!.setVolume(1.0);
                        _model.soundPlayer!
                            .setUrl(_model.currentWord!.audio)
                            .then((_) => _model.soundPlayer!.play());
                      },
                      text: '',
                      icon: Icon(
                        Icons.music_note,
                        size: 120.0,
                      ),
                      options: FFButtonOptions(
                        width: 160.0,
                        height: 160.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).tertiary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
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
                  Builder(
                    builder: (context) {
                      final audioOptions = _model.options.toList();

                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: audioOptions.length,
                        itemBuilder: (context, audioOptionsIndex) {
                          final audioOptionsItem =
                              audioOptions[audioOptionsIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 8.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().attempts =
                                    FFAppState().attempts + 1;
                                safeSetState(() {});
                                if (audioOptionsItem.word ==
                                    _model.currentWord?.word) {
                                  if (FFAppState().exercises.length > 0) {
                                    FFAppState().currentExercise =
                                        FFAppState().exercises.first;
                                    FFAppState().hits = FFAppState().hits + 1;
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
                                      context.pushNamed(
                                        'GamePage1Translation',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.fade,
                                            duration: Duration(milliseconds: 0),
                                          ),
                                        },
                                      );
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
                              text: audioOptionsItem.word,
                              options: FFButtonOptions(
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'OpenDyslexic',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 27.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ).animateOnActionTrigger(
                              animationsMap['buttonOnActionTriggerAnimation']!,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
