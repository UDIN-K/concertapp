import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreChipModel extends FlutterFlowModel<GenreChipWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class GenreChipWidget extends StatefulWidget {
  const GenreChipWidget({
    super.key,
    required this.label,
    this.selected = false,
  });

  final String label;
  final bool selected;

  @override
  State<GenreChipWidget> createState() => _GenreChipWidgetState();
}

class _GenreChipWidgetState extends State<GenreChipWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: widget.selected ? theme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: widget.selected ? theme.primary : theme.alternate,
        ),
      ),
      child: Text(
        widget.label,
        style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: widget.selected ? theme.onPrimary : theme.secondaryText,
        ),
      ),
    );
  }
}
