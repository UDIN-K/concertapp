import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SwitchModel extends FlutterFlowModel<SwitchWidget> {
  bool value = false;

  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({
    super.key,
    this.value = false,
    this.onChanged,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChanged?.call(_value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 52,
        height: 30,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: _value ? theme.primary : theme.alternate,
          borderRadius: BorderRadius.circular(9999),
        ),
        alignment: _value
            ? const AlignmentDirectional(1, 0)
            : const AlignmentDirectional(-1, 0),
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: theme.onPrimary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
