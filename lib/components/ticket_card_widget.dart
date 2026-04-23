import '/components/button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TicketCardModel extends FlutterFlowModel<TicketCardWidget> {
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    buttonModel.dispose();
  }
}

class TicketCardWidget extends StatefulWidget {
  const TicketCardWidget({
    super.key,
    required this.event_name,
    required this.venue,
    required this.artist_img,
    required this.date_day,
    required this.date_month,
    required this.status,
    this.qr_data = '',
    this.ticket_id = '',
    this.seat_info = '',
    this.card_id = '',
  });

  final String event_name;
  final String venue;
  final String artist_img;
  final String date_day;
  final String date_month;
  final String status;
  final String qr_data;
  final String ticket_id;
  final String seat_info;
  final String card_id;

  @override
  State<TicketCardWidget> createState() => _TicketCardWidgetState();
}

class _TicketCardWidgetState extends State<TicketCardWidget> {
  late TicketCardModel _model;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TicketCardModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final isConfirmed = widget.status == 'Confirmed';

    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: theme.alternate),
      ),
      child: Column(
        children: [
          // Top section: image + event info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Date badge
                Container(
                  width: 56,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: theme.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.date_month,
                        style: GoogleFonts.poppins(
                          fontSize: 11, fontWeight: FontWeight.w700,
                          color: theme.primary,
                        ),
                      ),
                      Text(widget.date_day,
                        style: GoogleFonts.poppins(
                          fontSize: 22, fontWeight: FontWeight.w800,
                          color: theme.primaryText, height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),
                // Event info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.event_name,
                        style: GoogleFonts.poppins(
                          fontSize: 15, fontWeight: FontWeight.w700,
                          color: theme.primaryText,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(Icons.location_on_rounded, size: 13, color: theme.secondaryText),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(widget.venue,
                              style: GoogleFonts.urbanist(
                                fontSize: 12, color: theme.secondaryText,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      if (widget.seat_info.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Icon(Icons.event_seat_rounded, size: 13, color: theme.secondaryText),
                            const SizedBox(width: 4),
                            Text(widget.seat_info,
                              style: GoogleFonts.urbanist(fontSize: 12, color: theme.secondaryText),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                // Artist image
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    imageUrl: widget.artist_img,
                    width: 56, height: 56, fit: BoxFit.cover,
                    fadeInDuration: Duration.zero,
                    fadeOutDuration: Duration.zero,
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.alternate),
          // Bottom section: ticket id, status, detail
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    if (widget.ticket_id.isNotEmpty)
                      Text(widget.ticket_id,
                        style: GoogleFonts.poppins(
                          fontSize: 11, fontWeight: FontWeight.w600,
                          color: theme.secondaryText,
                          letterSpacing: 0.5,
                        ),
                      ),
                    if (widget.ticket_id.isNotEmpty) const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      decoration: BoxDecoration(
                        color: isConfirmed
                            ? theme.success.withValues(alpha: 0.15)
                            : theme.alternate,
                        borderRadius: BorderRadius.circular(9999),
                      ),
                      child: Text(widget.status,
                        style: GoogleFonts.poppins(
                          fontSize: 10, fontWeight: FontWeight.w600,
                          color: isConfirmed ? theme.success : theme.secondaryText,
                        ),
                      ),
                    ),
                  ],
                ),
                ButtonWidget(
                  content: 'Detail',
                  size: 'small',
                  variant: 'outline',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
