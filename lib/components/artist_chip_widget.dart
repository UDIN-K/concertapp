import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ArtistChipModel extends FlutterFlowModel<ArtistChipWidget> {
  @override
  void initState(BuildContext context) {}
  @override
  void dispose() {}
}

class ArtistChipWidget extends StatefulWidget {
  const ArtistChipWidget({
    super.key,
    required this.name,
    required this.img_url,
  });

  final String name;
  final String img_url;

  @override
  State<ArtistChipWidget> createState() => _ArtistChipWidgetState();
}

class _ArtistChipWidgetState extends State<ArtistChipWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: theme.alternate),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9999),
              child: CachedNetworkImage(
                imageUrl: widget.img_url,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Icon(Icons.person, size: 16, color: theme.primary),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            widget.name,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: theme.primaryText,
            ),
          ),
        ],
      ),
    );
  }
}
