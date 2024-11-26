import '/backend/schema/structs/index.dart';
import '/components/correct_option/correct_option_widget.dart';
import '/components/in_correct_option/in_correct_option_widget.dart';
import '/components/see_later/see_later_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'game_page7_write_model.dart';
export 'game_page7_write_model.dart';

class GamePage7WriteWidget extends StatefulWidget {
  const GamePage7WriteWidget({super.key});

  @override
  State<GamePage7WriteWidget> createState() => _GamePage7WriteWidgetState();
}

class _GamePage7WriteWidgetState extends State<GamePage7WriteWidget> {
  late GamePage7WriteModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GamePage7WriteModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.currentWord = FFAppState()
          .words
          .where((e) => e.word == FFAppState().currentExercise.word)
          .toList()
          .first;
      safeSetState(() {});
    });

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
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
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Text(
                    'Escriba  la palabra correspondiente al sonido y la imagen',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'OpenDyslexic',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 19.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          useGoogleFonts: false,
                        ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    _model.currentWord!.image,
                    width: (isWeb
                                ? MediaQuery.viewInsetsOf(context).bottom > 0
                                : _isKeyboardVisible) ==
                            true
                        ? 100.0
                        : 300.0,
                    height: (isWeb
                            ? MediaQuery.viewInsetsOf(context).bottom > 0
                            : _isKeyboardVisible)
                        ? 100.0
                        : 300.0,
                    fit: BoxFit.cover,
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    _model.soundPlayer ??= AudioPlayer();
                    if (_model.soundPlayer!.playing) {
                      await _model.soundPlayer!.stop();
                    }
                    _model.soundPlayer!.setVolume(1.0);
                    _model.soundPlayer!
                        .setUrl(_model.currentWord!.audio)
                        .then((_) => _model.soundPlayer!.play());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/xilzb6srpc07/volumen_(1).png',
                      width: (isWeb
                                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                                  : _isKeyboardVisible) ==
                              true
                          ? 0.0
                          : 60.0,
                      height: (isWeb
                                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                                  : _isKeyboardVisible) ==
                              true
                          ? 0.0
                          : 60.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Stack(
                  children: [
                    TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'OpenDyslexic',
                              fontSize: 28.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                        hintText: 'Escribe aqui',
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'OpenDyslexic',
                                  fontSize: 22.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0x00000000),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: FlutterFlowTheme.of(context).alternate,
                      ),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'OpenDyslexic',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                          _model.textControllerValidator.asValidator(context),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            FFAppState().attempts = FFAppState().attempts + 1;
                            safeSetState(() {});
                            if (_model.currentWord?.word ==
                                _model.textController.text) {
                              if (FFAppState().exercises.length > 0) {
                                FFAppState().currentExercise =
                                    FFAppState().exercises.first;
                                FFAppState().removeAtIndexFromExercises(0);
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
                                      onTap: () =>
                                          FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
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
                                  context.pushNamed('GamePage4MultipleImages');
                                } else if (FFAppState()
                                        .currentExercise
                                        .exercise ==
                                    5) {
                                  context.pushNamed('GamePage5MultipleSounds');
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
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
                                  context.pushNamed('GamePage4MultipleImages');
                                } else if (FFAppState()
                                        .currentExercise
                                        .exercise ==
                                    5) {
                                  context.pushNamed('GamePage5MultipleSounds');
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
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
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
                          text: '',
                          icon: FaIcon(
                            FontAwesomeIcons.checkSquare,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 50.0,
                          ),
                          options: FFButtonOptions(
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0x00286FFF),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  fontSize: 24.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
