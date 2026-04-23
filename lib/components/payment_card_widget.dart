import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentCardModel extends FlutterFlowModel<PaymentCardWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class PaymentCardWidget extends StatefulWidget {
  const PaymentCardWidget({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final Widget icon;
  final String label;
  final bool selected;

  @override
  State<PaymentCardWidget> createState() => _PaymentCardWidgetState();
}

class _PaymentCardWidgetState extends State<PaymentCardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.selected ? theme.primary : theme.alternate,
          width: widget.selected ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          widget.icon,
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.label,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: theme.primaryText,
              ),
            ),
          ),
          if (widget.selected)
            Icon(Icons.check_circle_rounded, color: theme.primary, size: 20),
        ],
      ),
    );
  }
}
