import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketCard2Model extends FlutterFlowModel<TicketCard2Widget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class TicketCard2Widget extends StatefulWidget {
  const TicketCard2Widget({
    super.key,
    required this.date,
    required this.title,
  });

  final String date;
  final String title;

  @override
  State<TicketCard2Widget> createState() => _TicketCard2WidgetState();
}

class _TicketCard2WidgetState extends State<TicketCard2Widget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.alternate),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.confirmation_number_rounded, color: theme.primary, size: 20),
          ),
          const SizedBox(height: 12),
          Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: theme.primaryText,
            ),
          ),
          Text(
            widget.date,
            style: GoogleFonts.urbanist(
              fontSize: 11,
              color: theme.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
