import '/components/button_widget.dart';
import '/components/feature_tag_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

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
    final theme = FlutterFlowTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: Stack(
          children: [
            // Background Gradient
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.6),
                  radius: 1.2,
                  colors: [
                    theme.primary.withValues(alpha: 0.3),
                    theme.primaryBackground,
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Spacer(flex: 3),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      alignment: WrapAlignment.center,
                      children: [
                        FeatureTagWidget(
                          icon: Icon(Icons.local_activity_rounded, color: theme.tertiary, size: 16),
                          label: 'Exclusive Access',
                        ),
                        FeatureTagWidget(
                          icon: Icon(Icons.confirmation_number_rounded, color: theme.tertiary, size: 16),
                          label: 'Fast Entry',
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Feel the Beat,\nLive the Vibe',
                      textAlign: TextAlign.center,
                      style: theme.displayLarge.override(
                        font: GoogleFonts.poppins(fontWeight: FontWeight.w900),
                        lineHeight: 1.1,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your all-access pass to the world\'s most electric concerts and festivals.',
                      textAlign: TextAlign.center,
                      style: theme.bodyLarge.override(
                        font: GoogleFonts.urbanist(),
                        color: theme.secondaryText,
                      ),
                    ),
                    const SizedBox(height: 48),
                    ButtonWidget(
                      content: 'Get Started',
                      full_width: true,
                      onPressed: () => Navigator.pushNamed(context, '/home'),
                    ),
                    const SizedBox(height: 16),
                    ButtonWidget(
                      content: 'I already have an account',
                      variant: 'ghost',
                      full_width: true,
                      onPressed: () => Navigator.pushNamed(context, '/loginSignup'),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for FeatureTag.
  late FeatureTagModel featureTagModel1;
  // Model for FeatureTag.
  late FeatureTagModel featureTagModel2;
  // Model for Button.
  late ButtonModel buttonModel1;
  // Model for Button.
  late ButtonModel buttonModel2;

  @override
  void initState(BuildContext context) {
    featureTagModel1 = createModel(context, () => FeatureTagModel());
    featureTagModel2 = createModel(context, () => FeatureTagModel());
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    featureTagModel1.dispose();
    featureTagModel2.dispose();
    buttonModel1.dispose();
    buttonModel2.dispose();
  }
}
