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
    required this.artist,
    required this.date,
    required this.img_url,
    required this.location,
    required this.status,
    required this.title,
  });

  final String artist;
  final String date;
  final String img_url;
  final String location;
  final String status;
  final String title;

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
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: theme.alternate),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CachedNetworkImage(
                      imageUrl: widget.img_url,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: theme.primaryText,
                        ),
                      ),
                      Text(
                        widget.artist,
                        style: GoogleFonts.urbanist(
                          fontSize: 12,
                          color: theme.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: widget.status == 'Active' 
                      ? theme.success.withValues(alpha: 0.15)
                      : theme.alternate,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                  child: Text(
                    widget.status,
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: widget.status == 'Active' ? theme.success : theme.secondaryText,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: theme.alternate),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_today_rounded, size: 14, color: theme.secondaryText),
                        const SizedBox(width: 6),
                        Text(
                          widget.date,
                          style: GoogleFonts.urbanist(fontSize: 12, color: theme.secondaryText),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on_rounded, size: 14, color: theme.secondaryText),
                        const SizedBox(width: 6),
                        Text(
                          widget.location,
                          style: GoogleFonts.urbanist(fontSize: 12, color: theme.secondaryText),
                        ),
                      ],
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
