import '/backend/schema/structs/index.dart';
import '/components/category/category_widget.dart';
import '/components/words_learned_in_session/words_learned_in_session_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'confetti_winner_page_model.dart';
export 'confetti_winner_page_model.dart';

class ConfettiWinnerPageWidget extends StatefulWidget {
  const ConfettiWinnerPageWidget({super.key});

  @override
  State<ConfettiWinnerPageWidget> createState() =>
      _ConfettiWinnerPageWidgetState();
}

class _ConfettiWinnerPageWidgetState extends State<ConfettiWinnerPageWidget> {
  late ConfettiWinnerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfettiWinnerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().listLearned.length > 0) {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: GestureDetector(
                onTap: () => FocusScope.of(dialogContext).unfocus(),
                child: WordsLearnedInSessionWidget(),
              ),
            );
          },
        );
      }
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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: Align(
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: Image.asset(
                                'assets/images/pngtree-3-star-vector-clipart-png-image_6665412.png',
                                height: 150.0,
                                fit: BoxFit.scaleDown,
                                alignment: Alignment(0.0, -1.0),
                              ),
                            ),
                          ),
                          Text(
                            'FELICIDADES, LECCIÓN COMPLETADA',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Text(
                            'Ejercicios realizados: ${FFAppState().attempts.toString()}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Text(
                            'Errores de la lección: ${FFAppState().sessionMistakes.toString()}',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context).tertiary,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: false,
                                ),
                          ),
                          Builder(
                            builder: (context) => FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().exercises.length == 0) {
                                  FFAppState().sessionCounter =
                                      FFAppState().sessionCounter + 1;
                                  FFAppState().hits = 0;
                                  FFAppState().attempts = 0;
                                  FFAppState().sessionMistakes = 0;
                                  FFAppState().currentExercise = ExerciseListStruct
                                      .fromSerializableMap(jsonDecode(
                                          '{\"word\":\"NA\",\"exercise\":\"0\"}'));
                                  FFAppState().currentMistakes = 0;
                                  safeSetState(() {});
                                  await actions.generatePairsAction();
                                  FFAppState().currentExercise =
                                      FFAppState().exercises.first;
                                  safeSetState(() {});
                                  FFAppState().removeAtIndexFromExercises(0);
                                  safeSetState(() {});
                                  await showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return Dialog(
                                        elevation: 0,
                                        insetPadding: EdgeInsets.zero,
                                        backgroundColor: Colors.transparent,
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                        child: GestureDetector(
                                          onTap: () =>
                                              FocusScope.of(dialogContext)
                                                  .unfocus(),
                                          child: CategoryWidget(),
                                        ),
                                      );
                                    },
                                  );
                                }
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
                              },
                              text: 'Siguiente Lección',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).secondary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'OpenDyslexic',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 22.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              FFAppState().currentExercise = ExerciseListStruct
                                  .fromSerializableMap(jsonDecode(
                                      '{\"word\":\"NA\",\"exercise\":\"0\"}'));
                              FFAppState().currentMistakes = 0;
                              FFAppState().attempts = 0;
                              FFAppState().hits = 0;
                              safeSetState(() {});

                              context.pushNamed('MainMenu');
                            },
                            text: 'Salir al Inicio',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 60.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).secondary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'OpenDyslexic',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            showLoadingIndicator: false,
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
