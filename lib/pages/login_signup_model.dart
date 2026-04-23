import '/components/button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'login_signup_widget.dart' show LoginSignupWidget;

class LoginSignupModel extends FlutterFlowModel<LoginSignupWidget> {
  late ButtonModel buttonModel1;
  late ButtonModel buttonModel2;
  late TextFieldModel textFieldModel1;
  late TextFieldModel textFieldModel2;

  @override
  void initState(BuildContext context) {
    buttonModel1 = createModel(context, () => ButtonModel());
    buttonModel2 = createModel(context, () => ButtonModel());
    textFieldModel1 = createModel(context, () => TextFieldModel());
    textFieldModel2 = createModel(context, () => TextFieldModel());
  }

  @override
  void dispose() {
    buttonModel1.dispose();
    buttonModel2.dispose();
    textFieldModel1.dispose();
    textFieldModel2.dispose();
  }
}
