import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChipModel extends FlutterFlowModel<CategoryChipWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class CategoryChipWidget extends StatefulWidget {
  const CategoryChipWidget({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final Widget icon;
  final String label;
  final bool selected;

  @override
  State<CategoryChipWidget> createState() => _CategoryChipWidgetState();
}

class _CategoryChipWidgetState extends State<CategoryChipWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: widget.selected ? theme.primary : theme.secondaryBackground,
        borderRadius: BorderRadius.circular(9999),
        border: widget.selected
            ? null
            : Border.all(color: theme.alternate),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon,
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: widget.selected ? theme.onPrimary : theme.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
