import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTagModel extends FlutterFlowModel<InfoTagWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class InfoTagWidget extends StatefulWidget {
  const InfoTagWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final Widget icon;
  final String label;
  final String value;

  @override
  State<InfoTagWidget> createState() => _InfoTagWidgetState();
}

class _InfoTagWidgetState extends State<InfoTagWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.icon,
            const SizedBox(width: 6),
            Text(
              widget.label,
              style: theme.labelSmall.override(
                font: GoogleFonts.urbanist(),
                color: theme.secondaryText,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          widget.value,
          style: theme.bodyMedium.override(
            font: GoogleFonts.poppins(fontWeight: FontWeight.w700),
            color: theme.primaryText,
          ),
        ),
      ],
    );
  }
}
