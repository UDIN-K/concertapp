import '/components/artist_chip_widget.dart';
import '/components/button_widget.dart';
import '/components/info_tag_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConcertDetailsWidget extends StatefulWidget {
  const ConcertDetailsWidget({super.key});

  @override
  State<ConcertDetailsWidget> createState() => _ConcertDetailsWidgetState();
}

class _ConcertDetailsWidgetState extends State<ConcertDetailsWidget> {
  late ConcertDetailsModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConcertDetailsModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'concert_img',
                  child: CachedNetworkImage(
                    imageUrl: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
                    width: double.infinity,
                    height: 400,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.4),
                        Colors.transparent,
                        theme.primaryBackground,
                      ],
                      stops: const [0.0, 0.5, 1.0],
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 12,
                          buttonSize: 44,
                          fillColor: theme.background60,
                          icon: Icon(Icons.chevron_left_rounded, color: theme.primaryText, size: 24),
                          onPressed: () => Navigator.pop(context),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 12,
                          buttonSize: 44,
                          fillColor: theme.background60,
                          icon: Icon(Icons.favorite_border_rounded, color: theme.primaryText, size: 24),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: theme.primary27,
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Text(
                      'POP CONCERT',
                      style: theme.labelSmall.override(
                        color: theme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Coldplay: Music of the Spheres',
                    style: theme.displayMedium.override(
                      font: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoTagWidget(
                        icon: Icon(Icons.calendar_today_rounded, color: theme.primary, size: 16),
                        label: 'DATE',
                        value: '15 Nov 2026',
                      ),
                      InfoTagWidget(
                        icon: Icon(Icons.access_time_rounded, color: theme.primary, size: 16),
                        label: 'TIME',
                        value: '19:00 WIB',
                      ),
                      InfoTagWidget(
                        icon: Icon(Icons.location_on_rounded, color: theme.primary, size: 16),
                        label: 'VENUE',
                        value: 'GBK Stadium',
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Text('Lineup', style: theme.titleLarge),
                  const SizedBox(height: 16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ArtistChipWidget(name: 'Coldplay', img_url: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800'),
                        SizedBox(width: 12),
                        ArtistChipWidget(name: 'Rahmania Astrini', img_url: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800'),
                        SizedBox(width: 12),
                        ArtistChipWidget(name: 'Special Guest', img_url: 'https://images.unsplash.com/photo-1598387993281-cecf8b71a8f8?w=800'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text('About Event', style: theme.titleLarge),
                  const SizedBox(height: 12),
                  Text(
                    'Experience the magic of Coldplay live! The Music of the Spheres World Tour brings you an unforgettable night filled with dazzling lights, iconic hits, and an eco-friendly concert experience like no other.',
                    style: theme.bodyMedium.override(lineHeight: 1.6),
                  ),
                  const SizedBox(height: 32),
                  Text('Location', style: theme.titleLarge),
                  const SizedBox(height: 16),
                  const SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: FlutterFlowGoogleMap(
                      initialLocation: LatLng(-6.2185, 106.8018),
                      initialZoom: 15,
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.primaryBackground,
          border: Border(top: BorderSide(color: theme.alternate)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price starting from', style: theme.labelSmall),
                  Text('Rp 1.500.000', style: theme.headlineMedium.override(color: theme.tertiary)),
                ],
              ),
            ),
            ButtonWidget(
              content: 'Buy Tickets',
              onPressed: () => Navigator.pushNamed(context, '/seatSelection'),
            ),
          ],
        ),
      ),
    );
  }
}


class ConcertDetailsModel extends FlutterFlowModel<ConcertDetailsWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
