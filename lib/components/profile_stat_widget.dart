import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileStatModel extends FlutterFlowModel<ProfileStatWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class ProfileStatWidget extends StatefulWidget {
  const ProfileStatWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  State<ProfileStatWidget> createState() => _ProfileStatWidgetState();
}

class _ProfileStatWidgetState extends State<ProfileStatWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.value,
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: theme.primaryText,
          ),
        ),
        Text(
          widget.label,
          style: GoogleFonts.urbanist(
            fontSize: 12,
            color: theme.secondaryText,
          ),
        ),
      ],
    );
  }
}
