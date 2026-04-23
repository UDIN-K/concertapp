import '/components/category_chip_widget.dart';
import '/components/event_item_widget.dart';
import '/components/featured_card_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_feed_model.dart';
export 'home_feed_model.dart';

class HomeFeedWidget extends StatefulWidget {
  const HomeFeedWidget({super.key});

  static String routeName = 'HomeFeed';
  static String routePath = '/homeFeed';

  @override
  State<HomeFeedWidget> createState() => _HomeFeedWidgetState();
}

class _HomeFeedWidgetState extends State<HomeFeedWidget> {
  late HomeFeedModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeFeedModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Find your vibe,',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.urbanist(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.45,
                                ),
                          ),
                          Text(
                            'Hey, Alex!',
                            style: FlutterFlowTheme.of(context)
                                .titleLarge
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                  lineHeight: 1.25,
                                ),
                          ),
                        ].divide(const SizedBox(height: 4)),
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(9999),
                          shape: BoxShape.rectangle,
                          border: Border.all(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 1,
                          ),
                        ),
                        alignment: const AlignmentDirectional(0, 0),
                        child: Icon(
                          Icons.person_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
                child: wrapWithModel(
                  model: _model.textFieldModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TextFieldWidget(
                    label: false,
                    helper: false,
                    hint: 'Search artists, venues, or cities',
                    value: '',
                    leading_icon: Icon(
                      Icons.search_rounded,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16,
                    ),
                    leading_icon_present: true,
                    trailing_icon_present: false,
                    bg: FlutterFlowTheme.of(context).secondaryBackground,
                    radius: 24.0,
                    variant: 'filled',
                    error: false,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          wrapWithModel(
                            model: _model.categoryChipModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: CategoryChipWidget(
                              icon: Icon(
                                Icons.confirmation_number_rounded,
                                color: FlutterFlowTheme.of(context).onPrimary,
                                size: 18,
                              ),
                              label: 'All Events',
                              selected: true,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.categoryChipModel2,
                            updateCallback: () => safeSetState(() {}),
                            child: CategoryChipWidget(
                              icon: Icon(
                                Icons.electric_bolt_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18,
                              ),
                              label: 'Rock',
                              selected: false,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.categoryChipModel3,
                            updateCallback: () => safeSetState(() {}),
                            child: CategoryChipWidget(
                              icon: Icon(
                                Icons.favorite_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18,
                              ),
                              label: 'Pop',
                              selected: false,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.categoryChipModel4,
                            updateCallback: () => safeSetState(() {}),
                            child: CategoryChipWidget(
                              icon: Icon(
                                Icons.piano_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18,
                              ),
                              label: 'Jazz',
                              selected: false,
                            ),
                          ),
                          wrapWithModel(
                            model: _model.categoryChipModel5,
                            updateCallback: () => safeSetState(() {}),
                            child: CategoryChipWidget(
                              icon: Icon(
                                Icons.graphic_eq_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 18,
                              ),
                              label: 'EDM',
                              selected: false,
                            ),
                          ),
                        ].divide(const SizedBox(width: 16)),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Featured Events',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w800,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                                lineHeight: 1.25,
                              ),
                        ),
                        Text(
                          'See All',
                          style: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .fontStyle,
                                lineHeight: 1.3,
                              ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.featuredCardModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: FeaturedCardWidget(
                                  date: 'Oct 24 - Madison Square Garden',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/cyberpunk%20concert%20stage%20purple%20lights',
                                  tag: 'TRENDING',
                                  title: 'Midnight Neon Tour',
                                  onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.featuredCardModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: FeaturedCardWidget(
                                  date: 'Nov 02 - Red Rocks Amphitheatre',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/acoustic%20singer%20on%20stage%20outdoor%20forest',
                                  tag: 'SELLING FAST',
                                  title: 'Acoustic Forest Sessions',
                                  onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                                ),
                              ),
                              wrapWithModel(
                                model: _model.featuredCardModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: FeaturedCardWidget(
                                  date: 'Dec 15 - Warehouse 7',
                                  img_desc:
                                      'https://dimg.dreamflow.cloud/v1/image/dark%20techno%20club%20laser%20lights',
                                  tag: 'NEW',
                                  title: 'Techno Pulse 2024',
                                  onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                                ),
                              ),
                            ].divide(const SizedBox(width: 24)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(const SizedBox(height: 16)),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Upcoming Near You',
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            font: GoogleFonts.poppins(
                              fontWeight: FontWeight.w800,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w800,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleLarge
                                .fontStyle,
                            lineHeight: 1.25,
                          ),
                    ),
                    wrapWithModel(
                      model: _model.eventItemModel1,
                      updateCallback: () => safeSetState(() {}),
                      child: EventItemWidget(
                        img_desc:
                            'https://dimg.dreamflow.cloud/v1/image/jazz%20band%20performing',
                        location: 'Blue Note Club',
                        price: 'From \$45',
                        title: 'The Midnight Echoes',
                        onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.eventItemModel2,
                      updateCallback: () => safeSetState(() {}),
                      child: EventItemWidget(
                        img_desc:
                            'https://dimg.dreamflow.cloud/v1/image/edm%20festival%20crowd',
                        location: 'Stadium Arena',
                        price: 'From \$89',
                        title: 'Electric Dreamland',
                        onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.eventItemModel3,
                      updateCallback: () => safeSetState(() {}),
                      child: EventItemWidget(
                        img_desc:
                            'https://dimg.dreamflow.cloud/v1/image/choir%20performance',
                        location: 'The Grand Hall',
                        price: 'From \$60',
                        title: 'Vocal Harmony Night',
                        onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.eventItemModel4,
                      updateCallback: () => safeSetState(() {}),
                      child: EventItemWidget(
                        img_desc:
                            'https://dimg.dreamflow.cloud/v1/image/soul%20singer%20microphone',
                        location: 'Soul Lounge',
                        price: 'From \$55',
                        title: 'Rhythm & Blues Gala',
                        onTap: () => Navigator.pushNamed(context, '/concertDetails'),
                      ),
                    ),
                  ].divide(const SizedBox(height: 16)),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
