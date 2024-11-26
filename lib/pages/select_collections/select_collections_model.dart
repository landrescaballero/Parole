import '/backend/schema/structs/index.dart';
import '/components/colllection_card/colllection_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'select_collections_widget.dart' show SelectCollectionsWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectCollectionsModel extends FlutterFlowModel<SelectCollectionsWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for ColllectionCard dynamic component.
  late FlutterFlowDynamicModels<ColllectionCardModel> colllectionCardModels1;
  // Models for ColllectionCard dynamic component.
  late FlutterFlowDynamicModels<ColllectionCardModel> colllectionCardModels2;
  // Models for ColllectionCard dynamic component.
  late FlutterFlowDynamicModels<ColllectionCardModel> colllectionCardModels3;

  @override
  void initState(BuildContext context) {
    colllectionCardModels1 =
        FlutterFlowDynamicModels(() => ColllectionCardModel());
    colllectionCardModels2 =
        FlutterFlowDynamicModels(() => ColllectionCardModel());
    colllectionCardModels3 =
        FlutterFlowDynamicModels(() => ColllectionCardModel());
  }

  @override
  void dispose() {
    colllectionCardModels1.dispose();
    colllectionCardModels2.dispose();
    colllectionCardModels3.dispose();
  }
}
