import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'main_menu_model.dart';
export 'main_menu_model.dart';

class MainMenuWidget extends StatefulWidget {
  const MainMenuWidget({super.key});

  @override
  State<MainMenuWidget> createState() => _MainMenuWidgetState();
}

class _MainMenuWidgetState extends State<MainMenuWidget> {
  late MainMenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainMenuModel());

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
              Icons.settings,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pushNamed('Settings');
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
              padding: EdgeInsets.all(14.0),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/depositphotos_664564782-stock-illustration-hand-drawn-ice-cream-cup-removebg-preview.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                      child: Text(
                        'Parole',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context)
                            .displayMedium
                            .override(
                              fontFamily: 'OpenDyslexic',
                              color: FlutterFlowTheme.of(context).secondaryText,
                              fontSize: () {
                                if (MediaQuery.sizeOf(context).width <
                                    kBreakpointSmall) {
                                  return 32.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointMedium) {
                                  return 48.0;
                                } else if (MediaQuery.sizeOf(context).width <
                                    kBreakpointLarge) {
                                  return 58.0;
                                } else {
                                  return 35.0;
                                }
                              }(),
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 40.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                if (FFAppState().exercises.length == 0) {
                                  FFAppState().sessionCounter =
                                      FFAppState().sessionCounter + 1;
                                  safeSetState(() {});
                                  await actions.generatePairsAction();
                                  FFAppState().wordLearned = FFAppState()
                                      .wordLearned
                                      .toList()
                                      .cast<ListWordStruct>();
                                  FFAppState().wordsLearning = FFAppState()
                                      .wordsLearning
                                      .toList()
                                      .cast<ListWordStruct>();
                                  safeSetState(() {});
                                  FFAppState().currentExercise =
                                      FFAppState().exercises.first;
                                  safeSetState(() {});
                                  FFAppState().removeAtIndexFromExercises(0);
                                  safeSetState(() {});
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
                              text: 'Empezar',
                              icon: Icon(
                                Icons.play_arrow_rounded,
                                size: 30.0,
                              ),
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).tertiary,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'OpenDyslexic',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed('SelectCollections');
                              },
                              text: 'Colección',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).alternate,
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'OpenDyslexic',
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      fontSize: 30.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 20.0, 0.0, 0.0),
                            child: Text(
                              'Palabras Aprendidas: ${FFAppState().wordLearned.length.toString()}',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'OpenDyslexic',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ].divide(SizedBox(height: 20.0)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
