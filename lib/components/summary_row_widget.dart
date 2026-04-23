import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryRowModel extends FlutterFlowModel<SummaryRowWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class SummaryRowWidget extends StatefulWidget {
  const SummaryRowWidget({
    super.key,
    required this.label,
    required this.value,
    this.is_total = false,
  });

  final String label;
  final String value;
  final bool is_total;

  @override
  State<SummaryRowWidget> createState() => _SummaryRowWidgetState();
}

class _SummaryRowWidgetState extends State<SummaryRowWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.urbanist(
              fontSize: widget.is_total ? 16 : 14,
              fontWeight: widget.is_total ? FontWeight.w700 : FontWeight.w500,
              color: widget.is_total ? theme.primaryText : theme.secondaryText,
            ),
          ),
          Text(
            widget.value,
            style: GoogleFonts.poppins(
              fontSize: widget.is_total ? 18 : 14,
              fontWeight: FontWeight.w700,
              color: widget.is_total ? theme.tertiary : theme.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
