import '/backend/schema/structs/index.dart';
import '/components/colllection_card/colllection_card_widget.dart';
import '/components/new_word_card/new_word_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_collections_model.dart';
export 'select_collections_model.dart';

class SelectCollectionsWidget extends StatefulWidget {
  const SelectCollectionsWidget({super.key});

  @override
  State<SelectCollectionsWidget> createState() =>
      _SelectCollectionsWidgetState();
}

class _SelectCollectionsWidgetState extends State<SelectCollectionsWidget> {
  late SelectCollectionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectCollectionsModel());

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
              Icons.arrow_back_outlined,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 24.0,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),
          title: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Colecciones',
              style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'OpenDyslexic',
                    color: FlutterFlowTheme.of(context).primaryText,
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Animales',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'OpenDyslexic',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Builder(
                          builder: (context) {
                            final animalCards = FFAppState()
                                .words
                                .where((e) => e.category == 1)
                                .toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: List.generate(animalCards.length,
                                    (animalCardsIndex) {
                                  final animalCardsItem =
                                      animalCards[animalCardsIndex];
                                  return Opacity(
                                    opacity: FFAppState()
                                                .wordLearned
                                                .where((e) =>
                                                    e.word ==
                                                    animalCardsItem.word)
                                                .toList()
                                                .length >
                                            0
                                        ? 1.0
                                        : 0.5,
                                    child: Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: NewWordCardWidget(
                                                    wordInfo: animalCardsItem,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.colllectionCardModels1
                                              .getModel(
                                            animalCardsIndex.toString(),
                                            animalCardsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ColllectionCardWidget(
                                            key: Key(
                                              'Key7g7_${animalCardsIndex.toString()}',
                                            ),
                                            cardInfo: animalCardsItem,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Vehículos',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'OpenDyslexic',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Builder(
                          builder: (context) {
                            final vehicleCards = FFAppState()
                                .words
                                .where((e) => e.category == 2)
                                .toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(vehicleCards.length,
                                    (vehicleCardsIndex) {
                                  final vehicleCardsItem =
                                      vehicleCards[vehicleCardsIndex];
                                  return Opacity(
                                    opacity: FFAppState()
                                                .wordLearned
                                                .where((e) =>
                                                    e.word ==
                                                    vehicleCardsItem.word)
                                                .toList()
                                                .length >
                                            0
                                        ? 1.0
                                        : 0.5,
                                    child: Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: NewWordCardWidget(
                                                    wordInfo: vehicleCardsItem,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.colllectionCardModels2
                                              .getModel(
                                            vehicleCardsIndex.toString(),
                                            vehicleCardsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ColllectionCardWidget(
                                            key: Key(
                                              'Key6fb_${vehicleCardsIndex.toString()}',
                                            ),
                                            cardInfo: vehicleCardsItem,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 16.0, 0.0, 0.0),
                        child: Text(
                          'Cocina',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: 'OpenDyslexic',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 18.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                        ),
                      ),
                    ),
                    ListView(
                      padding: EdgeInsets.zero,
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        Builder(
                          builder: (context) {
                            final kitchenCards = FFAppState()
                                .words
                                .where((e) => e.category == 3)
                                .toList();

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(kitchenCards.length,
                                    (kitchenCardsIndex) {
                                  final kitchenCardsItem =
                                      kitchenCards[kitchenCardsIndex];
                                  return Opacity(
                                    opacity: FFAppState()
                                                .wordLearned
                                                .where((e) =>
                                                    e.word ==
                                                    kitchenCardsItem.word)
                                                .toList()
                                                .length >
                                            0
                                        ? 1.0
                                        : 0.5,
                                    child: Builder(
                                      builder: (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
                                                backgroundColor:
                                                    Colors.transparent,
                                                alignment: AlignmentDirectional(
                                                        0.0, 0.0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                                child: GestureDetector(
                                                  onTap: () => FocusScope.of(
                                                          dialogContext)
                                                      .unfocus(),
                                                  child: NewWordCardWidget(
                                                    wordInfo: kitchenCardsItem,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: wrapWithModel(
                                          model: _model.colllectionCardModels3
                                              .getModel(
                                            kitchenCardsIndex.toString(),
                                            kitchenCardsIndex,
                                          ),
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: ColllectionCardWidget(
                                            key: Key(
                                              'Keyo3c_${kitchenCardsIndex.toString()}',
                                            ),
                                            cardInfo: kitchenCardsItem,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
