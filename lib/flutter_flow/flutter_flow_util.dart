import 'package:flutter/material.dart';

// Base FlutterFlowModel class
abstract class FlutterFlowModel<T extends Widget> {
  // Child models tracked for disposal
  final List<FlutterFlowModel> _childModels = [];

  void initState(BuildContext context);
  void dispose() {
    for (final model in _childModels) {
      model.dispose();
    }
  }

  S createModel<S extends FlutterFlowModel>(
      BuildContext context, S Function() factory) {
    final model = factory();
    model.initState(context);
    _childModels.add(model);
    return model;
  }
}

// Create a model instance
T createModel<T extends FlutterFlowModel>(
    BuildContext context, T Function() factory) {
  final model = factory();
  model.initState(context);
  return model;
}

// Wrap widget with its model
Widget wrapWithModel<T extends FlutterFlowModel>({
  required T model,
  required VoidCallback updateCallback,
  required Widget child,
}) {
  return child;
}

// Safe setState helper
void safeSetState(VoidCallback fn) => fn();

// Extension on List to add divide helper (SizedBox spacers between children)
extension ListDivideExt on List<Widget> {
  List<Widget> divide(Widget divider) {
    if (length <= 1) return this;
    final divided = <Widget>[];
    for (int i = 0; i < length; i++) {
      divided.add(this[i]);
      if (i < length - 1) divided.add(divider);
    }
    return divided;
  }
}
