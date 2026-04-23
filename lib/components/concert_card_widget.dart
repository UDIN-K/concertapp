import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ConcertCardModel extends FlutterFlowModel<ConcertCardWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class ConcertCardWidget extends StatefulWidget {
  const ConcertCardWidget({
    super.key,
    required this.title,
    required this.venue,
    required this.price,
    required this.img_desc,
    this.date = '',
    this.rating = '',
    // Legacy compatibility
    this.img_url,
    this.location,
  });

  final String title;
  final String venue;
  final String price;
  final String img_desc;
  final String date;
  final String rating;
  final String? img_url;
  final String? location;

  @override
  State<ConcertCardWidget> createState() => _ConcertCardWidgetState();
}

class _ConcertCardWidgetState extends State<ConcertCardWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final imageUrl = widget.img_desc.isNotEmpty ? widget.img_desc : (widget.img_url ?? '');

    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.alternate),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(20)),
            child: SizedBox(
              width: 100, height: 100,
              child: CachedNetworkImage(
                imageUrl: imageUrl, fit: BoxFit.cover,
                fadeInDuration: Duration.zero, fadeOutDuration: Duration.zero,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(widget.title,
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.w700, color: theme.primaryText,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(Icons.location_on_rounded, size: 12, color: theme.secondaryText),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(widget.venue,
                          maxLines: 1, overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.urbanist(fontSize: 12, color: theme.secondaryText),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.price,
                        style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.w700, color: theme.tertiary,
                        ),
                      ),
                      if (widget.date.isNotEmpty)
                        Text(widget.date,
                          style: GoogleFonts.poppins(
                            fontSize: 11, fontWeight: FontWeight.w500, color: theme.secondaryText,
                          ),
                        ),
                      if (widget.rating.isNotEmpty)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rounded, size: 14, color: theme.tertiary),
                            const SizedBox(width: 2),
                            Text(widget.rating,
                              style: GoogleFonts.poppins(
                                fontSize: 11, fontWeight: FontWeight.w600, color: theme.primaryText,
                              ),
                            ),
                          ],
                        ),
                    ],
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
