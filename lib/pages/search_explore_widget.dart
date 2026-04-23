import '/components/concert_card_widget.dart';
import '/components/genre_chip_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'search_explore_model.dart';
export 'search_explore_model.dart';

class SearchExploreWidget extends StatefulWidget {
  const SearchExploreWidget({super.key});

  static String routeName = 'SearchExplore';
  static String routePath = '/searchExplore';

  @override
  State<SearchExploreWidget> createState() => _SearchExploreWidgetState();
}

class _SearchExploreWidgetState extends State<SearchExploreWidget> {
  late SearchExploreModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchExploreModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header + Search
              _buildHeaderSection(theme),
              // Genre chips
              _buildGenreSection(theme),
              // Trending concerts
              _buildTrendingSection(theme),
              // City & Date filter card
              _buildFilterCard(theme),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore Events',
                    style: theme.headlineMedium.override(
                      font: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                      color: theme.primaryText, letterSpacing: 0.0,
                      fontWeight: FontWeight.w800, lineHeight: 1.2,
                    ),
                  ),
                  Text('Find your next vibe',
                    style: theme.bodyMedium.override(
                      font: GoogleFonts.urbanist(), color: theme.secondaryText,
                      letterSpacing: 0.0, lineHeight: 1.45,
                    ),
                  ),
                ],
              ),
              // Avatar
              Container(
                width: 48, height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9999),
                  border: Border.all(color: theme.primary, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: 40, height: 40,
                    decoration: BoxDecoration(
                      color: theme.secondaryBackground, shape: BoxShape.circle,
                    ),
                    alignment: const AlignmentDirectional(0, 0),
                    child: Text('JD',
                      textAlign: TextAlign.center, maxLines: 1,
                      style: theme.labelMedium.override(
                        font: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                        color: theme.primaryText, fontSize: 15.2,
                        letterSpacing: 0.0, fontWeight: FontWeight.w600, lineHeight: 1.3,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Search bar + filter button
          Row(
            children: [
              Expanded(
                child: wrapWithModel(
                  model: _model.textFieldModel,
                  updateCallback: () => safeSetState(() {}),
                  child: TextFieldWidget(
                    label: false, helper: false,
                    hint: 'Search artists, venues...', value: '',
                    leading_icon: Icon(Icons.search_rounded, color: theme.primaryText, size: 16),
                    leading_icon_present: true, trailing_icon_present: false,
                    bg: theme.secondaryBackground, radius: 24.0, variant: 'filled', error: false,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Container(
                width: 56, height: 56,
                decoration: BoxDecoration(
                  color: theme.primary, borderRadius: BorderRadius.circular(32),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Icon(Icons.tune_rounded, color: theme.onPrimary, size: 24),
              ),
            ],
          ),
        ].divide(const SizedBox(height: 24)),
      ),
    );
  }

  Widget _buildGenreSection(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          child: Text('Popular Genres',
            style: theme.titleMedium.override(
              font: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
              color: theme.primaryText, letterSpacing: 0.0,
              fontWeight: FontWeight.bold, lineHeight: 1.3,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                wrapWithModel(model: _model.genreChipModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: const GenreChipWidget(label: 'All', selected: true)),
                wrapWithModel(model: _model.genreChipModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: const GenreChipWidget(label: 'Rock', selected: false)),
                wrapWithModel(model: _model.genreChipModel3,
                  updateCallback: () => safeSetState(() {}),
                  child: const GenreChipWidget(label: 'Techno', selected: false)),
                wrapWithModel(model: _model.genreChipModel4,
                  updateCallback: () => safeSetState(() {}),
                  child: const GenreChipWidget(label: 'Hip Hop', selected: false)),
                wrapWithModel(model: _model.genreChipModel5,
                  updateCallback: () => safeSetState(() {}),
                  child: const GenreChipWidget(label: 'Jazz', selected: false)),
              ].divide(const SizedBox(width: 16)),
            ),
          ),
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }

  Widget _buildTrendingSection(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Trending Near You',
                  style: theme.titleMedium.override(
                    font: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
                    color: theme.primaryText, letterSpacing: 0.0,
                    fontWeight: FontWeight.bold, lineHeight: 1.3,
                  ),
                ),
                Text('See All',
                  style: theme.labelLarge.override(
                    font: GoogleFonts.poppins(), color: theme.primary,
                    letterSpacing: 0.0, lineHeight: 1.3,
                  ),
                ),
              ],
            ),
          ),
          wrapWithModel(model: _model.concertCardModel1,
            updateCallback: () => safeSetState(() {}),
            child: ConcertCardWidget(
              date: 'OCT 24',
              img_desc: 'https://dimg.dreamflow.cloud/v1/image/electronic%20music%20concert%20with%20neon%20lights%20and%20laser%20show',
              price: '\$89', rating: '4.9',
              title: 'Neon Jungle Tour', venue: 'Stadium Jakarta',
              onTap: () => Navigator.pushNamed(context, '/concertDetails'),
            ),
          ),
          const SizedBox(height: 12),
          wrapWithModel(model: _model.concertCardModel2,
            updateCallback: () => safeSetState(() {}),
            child: ConcertCardWidget(
              date: 'OCT 28',
              img_desc: 'https://dimg.dreamflow.cloud/v1/image/jazz%20band%20performing%20in%20a%20moody%20dimly%20lit%20club',
              price: '\$45', rating: '4.8',
              title: 'Midnight Jazz Sessions', venue: 'The Blue Note',
              onTap: () => Navigator.pushNamed(context, '/concertDetails'),
            ),
          ),
          const SizedBox(height: 12),
          wrapWithModel(model: _model.concertCardModel3,
            updateCallback: () => safeSetState(() {}),
            child: ConcertCardWidget(
              date: 'NOV 02',
              img_desc: 'https://dimg.dreamflow.cloud/v1/image/crowd%20at%20a%20massive%20outdoor%20music%20festival%20at%20sunset',
              price: '\$120', rating: '4.7',
              title: 'Rhythm & Bass Festival', venue: 'Ecopark Ancol',
              onTap: () => Navigator.pushNamed(context, '/concertDetails'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterCard(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 24),
      child: Container(
        decoration: BoxDecoration(
          color: theme.secondaryBackground,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: theme.alternate, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFilterColumn(theme, 'City', 'Jakarta, ID',
                  Icons.keyboard_arrow_down_rounded),
              Container(width: 1, height: 30,
                decoration: BoxDecoration(color: theme.alternate)),
              _buildFilterColumn(theme, 'Date Range', 'This Weekend',
                  Icons.event_rounded),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterColumn(FlutterFlowTheme theme, String label,
      String value, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
          style: theme.labelSmall.override(
            font: GoogleFonts.poppins(), color: theme.secondaryText,
            letterSpacing: 0.0, lineHeight: 1.2,
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value,
              style: theme.bodyMedium.override(
                font: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
                color: theme.primaryText, letterSpacing: 0.0,
                fontWeight: FontWeight.w600, lineHeight: 1.45,
              ),
            ),
            const SizedBox(width: 4),
            Icon(icon, color: theme.primary, size: 18),
          ],
        ),
      ].divide(const SizedBox(height: 4)),
    );
  }
}
