import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'category_model.dart';
export 'category_model.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  late CategoryModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.148,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'La categoría que estás aprendiendo es: ',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).labelLarge.override(
                    fontFamily: 'OpenDyslexic',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
            Text(
              '${() {
                if (FFAppState().category == 1) {
                  return 'Animales';
                } else if (FFAppState().category == 2) {
                  return 'Vehiculos';
                } else if (FFAppState().category == 3) {
                  return 'Utencilios de Cocina';
                } else {
                  return '';
                }
              }()}',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'OpenDyslexic',
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.bold,
                    useGoogleFonts: false,
                  ),
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  () {
                    if (FFAppState().category == 1) {
                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/0bv1bj0h7zlm/animales.png';
                    } else if (FFAppState().category == 2) {
                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/ycsan4yrzhba/vehiculos.png';
                    } else if (FFAppState().category == 3) {
                      return 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/stracciatella-wdjp4d/assets/zz3au8hev2pj/Cocina.png';
                    } else {
                      return '';
                    }
                  }(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  Navigator.pop(context);
                },
                text: 'Continuar',
                options: FFButtonOptions(
                  height: 40.0,
                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).tertiary,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'OpenDyslexic',
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                  elevation: 0.0,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
