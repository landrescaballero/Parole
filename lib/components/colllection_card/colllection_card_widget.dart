import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'colllection_card_model.dart';
export 'colllection_card_model.dart';

class ColllectionCardWidget extends StatefulWidget {
  const ColllectionCardWidget({
    super.key,
    required this.cardInfo,
  });

  final WordStruct? cardInfo;

  @override
  State<ColllectionCardWidget> createState() => _ColllectionCardWidgetState();
}

class _ColllectionCardWidgetState extends State<ColllectionCardWidget> {
  late ColllectionCardModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ColllectionCardModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        width: 160.0,
        height: 240.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x34090F13),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  widget!.cardInfo!.image,
                  width: 90.0,
                  height: 90.0,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget!.cardInfo?.word,
                    'Parola',
                  ),
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        fontFamily: 'OpenDyslexic',
                        color: FlutterFlowTheme.of(context).tertiary,
                        fontSize: 18.0,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
