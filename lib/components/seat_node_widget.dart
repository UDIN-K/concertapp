import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

class SeatNodeModel extends FlutterFlowModel<SeatNodeWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class SeatNodeWidget extends StatefulWidget {
  const SeatNodeWidget({
    super.key,
    this.status = 'available',
  });

  final String status; // 'available', 'selected', 'taken'

  @override
  State<SeatNodeWidget> createState() => _SeatNodeWidgetState();
}

class _SeatNodeWidgetState extends State<SeatNodeWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    
    Color color;
    switch (widget.status) {
      case 'selected':
        color = theme.primary;
        break;
      case 'taken':
        color = theme.alternate;
        break;
      default:
        color = theme.secondaryBackground;
    }

    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        border: widget.status == 'available' 
          ? Border.all(color: theme.alternate)
          : null,
      ),
      child: widget.status == 'selected' 
        ? const Icon(Icons.check, size: 16, color: Colors.white)
        : null,
    );
  }
}
