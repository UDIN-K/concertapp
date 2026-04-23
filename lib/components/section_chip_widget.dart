import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SectionChipModel extends FlutterFlowModel<SectionChipWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class SectionChipWidget extends StatefulWidget {
  const SectionChipWidget({
    super.key,
    required this.label,
    required this.price,
    this.selected = false,
  });

  final String label;
  final String price;
  final bool selected;

  @override
  State<SectionChipWidget> createState() => _SectionChipWidgetState();
}

class _SectionChipWidgetState extends State<SectionChipWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: widget.selected ? theme.primary : theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: widget.selected ? theme.primary : theme.alternate,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: widget.selected ? theme.onPrimary : theme.primaryText,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            widget.price,
            style: GoogleFonts.urbanist(
              fontSize: 12,
              color: widget.selected ? theme.onPrimary.withValues(alpha: 0.8) : theme.tertiary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
