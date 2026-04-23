import '/components/button_widget.dart';
import '/components/ticket_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_tickets_model.dart';
export 'my_tickets_model.dart';

class MyTicketsWidget extends StatefulWidget {
  const MyTicketsWidget({super.key});

  static String routeName = 'MyTickets';
  static String routePath = '/myTickets';

  @override
  State<MyTicketsWidget> createState() => _MyTicketsWidgetState();
}

class _MyTicketsWidgetState extends State<MyTicketsWidget> {
  late MyTicketsModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyTicketsModel());
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
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header row
                    _buildHeader(theme),
                    // Filter tabs
                    _buildFilterTabs(theme),
                    // Ticket cards + CTA
                    _buildTicketList(theme),
                  ].divide(const SizedBox(height: 24)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(FlutterFlowTheme theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tiket Saya',
              style: theme.headlineLarge.override(
                font: GoogleFonts.poppins(fontWeight: FontWeight.w900),
                color: theme.primaryText, letterSpacing: 0.0,
                fontWeight: FontWeight.w900, lineHeight: 1.1,
              ),
            ),
            Text('You have 3 upcoming events',
              style: theme.bodyMedium.override(
                font: GoogleFonts.urbanist(), color: theme.secondaryText,
                letterSpacing: 0.0, lineHeight: 1.45,
              ),
            ),
          ].divide(const SizedBox(height: 4)),
        ),
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9999),
            border: Border.all(color: theme.tertiary, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: CachedNetworkImage(
                fadeInDuration: Duration.zero, fadeOutDuration: Duration.zero,
                imageUrl: 'https://dimg.dreamflow.cloud/v1/image/cool%20trendy%20person%20with%20neon%20lighting',
                width: 44, height: 44, fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilterTabs(FlutterFlowTheme theme) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTab(theme, 'Upcoming', selected: true, showIcon: true),
          _buildTab(theme, 'Past Events'),
          _buildTab(theme, 'Listed'),
        ].divide(const SizedBox(width: 8)),
      ),
    );
  }

  Widget _buildTab(FlutterFlowTheme theme, String label,
      {bool selected = false, bool showIcon = false}) {
    return Container(
      height: 34,
      decoration: BoxDecoration(
        color: selected ? theme.tertiary : theme.secondaryBackground,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: theme.alternate, width: 1),
      ),
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showIcon)
              Icon(Icons.check_rounded,
                color: selected ? theme.primaryBackground : theme.secondaryText,
                size: 16),
            if (showIcon) const SizedBox(width: 6),
            Text(label,
              style: theme.labelMedium.override(
                font: GoogleFonts.poppins(), fontSize: 14,
                color: selected ? theme.primaryBackground : theme.secondaryText,
                letterSpacing: 0.0, lineHeight: 1.3,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketList(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        wrapWithModel(
          model: _model.ticketCardModel1,
          updateCallback: () => safeSetState(() {}),
          child: const TicketCardWidget(
            artist_img: 'https://dimg.dreamflow.cloud/v1/image/techno%20dj%20performing%20in%20neon%20club',
            card_id: 't1', date_day: '24', date_month: 'OCT',
            event_name: 'Neon Pulse Tour',
            qr_data: 'https://vibepass.com/t/88291',
            seat_info: 'Section A, Row 12', status: 'Confirmed',
            ticket_id: 'VP-88291', venue: 'Cyberdome Arena',
          ),
        ),
        wrapWithModel(
          model: _model.ticketCardModel2,
          updateCallback: () => safeSetState(() {}),
          child: const TicketCardWidget(
            artist_img: 'https://dimg.dreamflow.cloud/v1/image/indie%20rock%20band%20on%20stage%20with%20purple%20lights',
            card_id: 't2', date_day: '02', date_month: 'NOV',
            event_name: 'Midnight Echoes',
            qr_data: 'https://vibepass.com/t/99102',
            seat_info: 'General Admission', status: 'Confirmed',
            ticket_id: 'VP-99102', venue: 'The Echo Lounge',
          ),
        ),
        // "Explore more" CTA card
        Container(
          decoration: BoxDecoration(
            color: theme.surface40,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: theme.alternate, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.confirmation_number_rounded, color: theme.onSurface, size: 48),
                Text('Looking for more?',
                  style: theme.titleMedium.override(
                    font: GoogleFonts.urbanist(), color: theme.secondaryText,
                    letterSpacing: 0.0, lineHeight: 1.3,
                  ),
                ),
                wrapWithModel(
                  model: _model.buttonModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ButtonWidget(
                    content: 'Explore Concerts',
                    icon: Icon(Icons.search_rounded, color: theme.primaryText, size: 16),
                    icon_present: true, icon_end_present: false,
                    variant: 'outline', size: 'medium',
                    full_width: false, loading: false, disabled: false,
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                  ),
                ),
              ].divide(const SizedBox(height: 16)),
            ),
          ),
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }
}
