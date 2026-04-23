import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureTagModel extends FlutterFlowModel<FeatureTagWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class FeatureTagWidget extends StatefulWidget {
  const FeatureTagWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  final Widget icon;
  final String label;

  @override
  State<FeatureTagWidget> createState() => _FeatureTagWidgetState();
}

class _FeatureTagWidgetState extends State<FeatureTagWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(
          color: FlutterFlowTheme.of(context).alternate.withValues(alpha: 0.5),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          widget.icon,
          const SizedBox(width: 8),
          Text(
            widget.label,
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                ),
          ),
        ],
      ),
    );
  }
}
