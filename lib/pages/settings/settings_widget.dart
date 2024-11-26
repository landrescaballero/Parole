import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'settings_model.dart';
export 'settings_model.dart';

class SettingsWidget extends StatefulWidget {
  const SettingsWidget({super.key});

  @override
  State<SettingsWidget> createState() => _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {
  late SettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SettingsModel());

    _model.musicSwitchValue = FFAppState().isSoundOn;
    _model.darkModeSwitchValue = false;
    _model.vibrationSwitchValue = false;
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
          automaticallyImplyLeading: true,
          leading: FlutterFlowIconButton(
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back,
              color: FlutterFlowTheme.of(context).secondaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Text(
            'Configuraciones',
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'OpenDyslexic',
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(18.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            'Sonido',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        SliderTheme(
                          data: SliderThemeData(
                            showValueIndicator: ShowValueIndicator.always,
                          ),
                          child: Slider(
                            activeColor: FlutterFlowTheme.of(context).tertiary,
                            inactiveColor: FlutterFlowTheme.of(context).primary,
                            min: 0.0,
                            max: 1.0,
                            value: _model.soundSliderValue ??=
                                valueOrDefault<double>(
                              FFAppState().currentMusicVolume,
                              0.5,
                            ),
                            label: _model.soundSliderValue?.toStringAsFixed(1),
                            onChanged: (newValue) {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(1));
                              safeSetState(
                                  () => _model.soundSliderValue = newValue);
                            },
                            onChangeEnd: (newValue) async {
                              newValue =
                                  double.parse(newValue.toStringAsFixed(1));
                              safeSetState(
                                  () => _model.soundSliderValue = newValue);
                              await actions.adjustMusicVolume(
                                _model.soundSliderValue!,
                              );
                              FFAppState().currentMusicVolume =
                                  _model.soundSliderValue!;
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            'Música',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.musicSwitchValue!,
                              onChanged: (newValue) async {
                                safeSetState(
                                    () => _model.musicSwitchValue = newValue!);
                                if (newValue!) {
                                  FFAppState().isSoundOn = true;
                                  safeSetState(() {});
                                  await actions.playOrPauseMusic(
                                    FFAppState().musicFile,
                                    false,
                                  );
                                } else {
                                  FFAppState().isSoundOn = false;
                                  safeSetState(() {});
                                  await actions.playOrPauseMusic(
                                    FFAppState().musicFile,
                                    true,
                                  );
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).accent2,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            'Modo Oscuro',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.darkModeSwitchValue!,
                              onChanged: (newValue) async {
                                safeSetState(() =>
                                    _model.darkModeSwitchValue = newValue!);
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).accent2,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            'Vibración',
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                                  fontFamily: 'OpenDyslexic',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(1.0, 0.0),
                            child: Switch.adaptive(
                              value: _model.vibrationSwitchValue!,
                              onChanged: (newValue) async {
                                safeSetState(() =>
                                    _model.vibrationSwitchValue = newValue!);
                                if (newValue!) {
                                  FFAppState().isHapticAllowed = true;
                                  safeSetState(() {});
                                } else {
                                  FFAppState().isHapticAllowed = false;
                                  safeSetState(() {});
                                }
                              },
                              activeColor: FlutterFlowTheme.of(context).primary,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).tertiary,
                              inactiveTrackColor:
                                  FlutterFlowTheme.of(context).accent2,
                              inactiveThumbColor:
                                  FlutterFlowTheme.of(context).tertiary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                FFButtonWidget(
                  onPressed: () async {
                    FFAppState().sessionCounter = 0;
                    FFAppState().wordLearned = [];
                    FFAppState().wordsLearning = [];
                    FFAppState().exercises = [];
                    FFAppState().currentExercise = null!;
                    FFAppState().currentMistakes = 0;
                    FFAppState().sessionMistakes = 0;
                    FFAppState().hits = 0;
                    FFAppState().attempts = 0;
                    FFAppState().newWords = [];
                    safeSetState(() {});
                  },
                  text: 'Resetear lecciones',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'OpenDyslexic',
                          color: FlutterFlowTheme.of(context).tertiary,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
