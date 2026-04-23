import '/components/button_widget.dart';
import '/components/feature_tag_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'onboarding_widget.dart' show OnboardingWidget;

class OnboardingModel extends FlutterFlowModel<OnboardingWidget> {
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
