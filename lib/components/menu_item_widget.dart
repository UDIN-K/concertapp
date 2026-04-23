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
    this.title = '',
    this.label = '',
    this.color,
    this.trailing,
  });

  final Widget icon;
  final String title;
  /// Legacy parameter — falls back to [title].
  final String label;
  final Color? color;
  final Widget? trailing;

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final displayLabel = widget.title.isNotEmpty ? widget.title : widget.label;
    final bgColor = widget.color?.withValues(alpha: 0.12) ?? theme.secondaryBackground;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: widget.icon,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(displayLabel,
              style: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w600, color: theme.primaryText,
              ),
            ),
          ),
          widget.trailing ?? Icon(Icons.chevron_right_rounded, color: theme.secondaryText, size: 20),
        ],
      ),
    );
  }
}
