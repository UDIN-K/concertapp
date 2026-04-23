import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuItemModel extends FlutterFlowModel<MenuItemWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class MenuItemWidget extends StatefulWidget {
  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.label,
    this.trailing,
  });

  final Widget icon;
  final String label;
  final Widget? trailing;

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: theme.secondaryBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: widget.icon,
          ),
          const SizedBox(width: 16),
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
          widget.trailing ?? Icon(Icons.chevron_right_rounded, color: theme.secondaryText, size: 20),
        ],
      ),
    );
  }
}
