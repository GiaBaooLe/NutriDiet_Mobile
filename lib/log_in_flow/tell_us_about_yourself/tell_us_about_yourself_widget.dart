import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/components/appbar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tell_us_about_yourself_model.dart';

export 'tell_us_about_yourself_model.dart';

class TellUsAboutYourselfWidget extends StatefulWidget {
  const TellUsAboutYourselfWidget({super.key});

  @override
  State<TellUsAboutYourselfWidget> createState() =>
      _TellUsAboutYourselfWidgetState();
}

class _TellUsAboutYourselfWidgetState extends State<TellUsAboutYourselfWidget> {
  late TellUsAboutYourselfModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedGenderIndex = 0; // Mặc định chọn Male
  final List<String> genderOptions = ["Nam", "Nữ"];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TellUsAboutYourselfModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              wrapWithModel(
                model: _model.appbarModel,
                updateCallback: () => safeSetState(() {}),
                child: const AppbarWidget(title: 'Giới thiệu về bạn'),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Vui lòng chọn giới tính của bạn',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'figtree',
                            fontSize: 16.0,
                            useGoogleFonts: false,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 150,
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      child: CupertinoPicker(
                        itemExtent: 40,
                        magnification: 1.2,
                        squeeze: 1.2,
                        useMagnifier: true,
                        onSelectedItemChanged: (index) {
                          setState(() {
                            selectedGenderIndex = index;
                          });
                        },
                        children: genderOptions.map((gender) {
                          return Center(
                            child: Text(
                              gender,
                              style: FlutterFlowTheme.of(context).bodyLarge,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: FFButtonWidget(
                        onPressed: () {
                          print(
                              'Selected gender: ${genderOptions[selectedGenderIndex]}');
                          context.pushNamed('Select_date_of_birth');
                        },
                        text: 'Tiếp tục',
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 54.0,
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'figtree',
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
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
