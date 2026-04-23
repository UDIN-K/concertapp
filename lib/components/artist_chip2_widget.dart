import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArtistChip2Model extends FlutterFlowModel<ArtistChip2Widget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class ArtistChip2Widget extends StatefulWidget {
  const ArtistChip2Widget({
    super.key,
    required this.name,
    this.img = '',
    this.img_url = '',
  });

  final String name;
  final String img;
  /// Legacy parameter — falls back to [img] if empty.
  final String img_url;

  @override
  State<ArtistChip2Widget> createState() => _ArtistChip2WidgetState();
}

class _ArtistChip2WidgetState extends State<ArtistChip2Widget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final imageUrl = widget.img.isNotEmpty ? widget.img : widget.img_url;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: theme.primary, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999),
              child: CachedNetworkImage(
                imageUrl: imageUrl, fit: BoxFit.cover,
                fadeInDuration: Duration.zero, fadeOutDuration: Duration.zero,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(widget.name,
          style: GoogleFonts.urbanist(
            fontSize: 11, fontWeight: FontWeight.w600, color: theme.secondaryText,
          ),
        ),
      ],
    );
  }
}
