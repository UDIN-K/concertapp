import '/components/button_widget.dart';
import '/components/feature_tag_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_palette/material_palette.dart';

import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  static String routeName = 'Onboarding';
  static String routePath = '/onboarding';

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          alignment: const AlignmentDirectional(-1, -1),
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite
                      ? constraints.maxWidth
                      : 200.0,
                  height: constraints.maxHeight.isFinite
                      ? constraints.maxHeight
                      : MediaQuery.sizeOf(context).height,
                  params: ShaderParams(
                    values: {
                      'gradientAngle': 145,
                      'gradientScale': 0.89,
                      'gradientOffset': 0,
                      'noiseIntensity': 0.32,
                      'ditherStrength': 2.51,
                      'ditherScale': 0.29,
                      'animSpeed': 1.46,
                      'octaves': 6.06,
                      'lacunarity': 2.35,
                      'persistence': 0.5,
                      'noiseScale': 6.36,
                      'colorCount': 7,
                      'softness': 0,
                      'exposure': 1,
                      'contrast': 1,
                      'bumpStrength': 0,
                      'lightDirX': 0.55,
                      'lightDirY': 0.45,
                      'lightDirZ': 1,
                      'lightIntensity': 1.15,
                      'ambient': 0.7,
                      'specular': 0.29,
                      'shininess': 40.76,
                      'metallic': 1,
                      'roughness': 1,
                      'edgeFade': 1.72,
                      'edgeFadeMode': 0,
                      'sharpness': 2.2,
                    },
                    colors: {
                      'color0': FlutterFlowTheme.of(context).primaryBackground,
                      'color1': FlutterFlowTheme.of(context).primaryBackground,
                      'color2': FlutterFlowTheme.of(context).primary,
                      'color3': FlutterFlowTheme.of(context).primaryBackground,
                      'color4': const Color(0xFF1A1A2E),
                      'color5': FlutterFlowTheme.of(context).primaryBackground,
                      'color6': Colors.black,
                      'color7': const Color(0x00808080),
                      'color8': const Color(0x00808080),
                      'color9': const Color(0x00808080),
                    },
                  ),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            const SizedBox.shrink(),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.start,
                        direction: Axis.horizontal,
                        runAlignment: WrapAlignment.start,
                        verticalDirection: VerticalDirection.down,
                        clipBehavior: Clip.none,
                        children: [
                          wrapWithModel(
                            model: _model.featureTagModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: FeatureTagWidget(
                              icon: Icon(
                                Icons.local_activity_rounded,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 16,
                              ),
                              label: 'Exclusive Access',
                            ),
                          ),
                          wrapWithModel(
                            model: _model.featureTagModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: FeatureTagWidget(
                              icon: Icon(
                                Icons.confirmation_number_rounded,
                                color: FlutterFlowTheme.of(context).tertiary,
                                size: 16,
                              ),
                              label: 'Fast Entry',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Feel the Beat,\nLive the Vibe',
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w900,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                                lineHeight: 1.1,
                              ),
                        ),
                        Text(
                          'Your all-access pass to the world\'s most electric concerts and festivals.',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                                font: GoogleFonts.urbanist(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyLarge
                                      .fontStyle,
                                ),
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .fontStyle,
                                lineHeight: 1.5,
                              ),
                        ),
                      ].divide(const SizedBox(height: 16)),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 24,
                          height: 8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).tertiary,
                            borderRadius: BorderRadius.circular(9999),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(9999),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(9999),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ].divide(const SizedBox(width: 8)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        wrapWithModel(
                          model: _model.buttonModel1,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            content: 'Get Started',
                            icon_present: false,
                            icon_end_present: false,
                            variant: 'primary',
                            size: 'large',
                            full_width: true,
                            loading: false,
                            disabled: false,
                            onPressed: () => Navigator.pushNamed(context, '/home'),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.buttonModel2,
                          updateCallback: () => safeSetState(() {}),
                          child: ButtonWidget(
                            content: 'I already have an account',
                            icon_present: false,
                            icon_end_present: false,
                            variant: 'ghost',
                            size: 'medium',
                            full_width: true,
                            loading: false,
                            disabled: false,
                            onPressed: () =>
                                Navigator.pushNamed(context, '/loginSignup'),
                          ),
                        ),
                      ].divide(const SizedBox(height: 16)),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ].divide(const SizedBox(height: 24)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
