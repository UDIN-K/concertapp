import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
    this.artist = '',
    this.venue = '',
    this.img = '',
    this.title = '',
  });

  final String date;
  final String artist;
  final String venue;
  final String img;
  /// Legacy parameter — falls back to [artist].
  final String title;

  @override
  State<TicketCard2Widget> createState() => _TicketCard2WidgetState();
}

class _TicketCard2WidgetState extends State<TicketCard2Widget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final displayTitle = widget.artist.isNotEmpty ? widget.artist : widget.title;
    final hasImage = widget.img.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.alternate),
      ),
      child: Row(
        children: [
          if (hasImage)
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
              child: SizedBox(
                width: 80, height: 80,
                child: CachedNetworkImage(
                  imageUrl: widget.img, fit: BoxFit.cover,
                  fadeInDuration: Duration.zero, fadeOutDuration: Duration.zero,
                ),
              ),
            ),
          if (!hasImage)
            Container(
              width: 80, height: 80,
              decoration: BoxDecoration(
                color: theme.primary.withValues(alpha: 0.1),
                borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
              ),
              child: Icon(Icons.confirmation_number_rounded, color: theme.primary, size: 28),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(displayTitle,
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w700, color: theme.primaryText,
                    ),
                  ),
                  if (widget.venue.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(widget.venue,
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.urbanist(fontSize: 12, color: theme.secondaryText),
                    ),
                  ],
                  const SizedBox(height: 4),
                  Text(widget.date,
                    style: GoogleFonts.poppins(
                      fontSize: 11, fontWeight: FontWeight.w500, color: theme.tertiary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
