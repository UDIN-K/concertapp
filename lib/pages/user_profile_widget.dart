import '/components/artist_chip2_widget.dart';
import '/components/button_widget.dart';
import '/components/menu_item_widget.dart';
import '/components/profile_stat_widget.dart';
import '/components/ticket_card2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';

import 'user_profile_model.dart';
export 'user_profile_model.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  static String routeName = 'UserProfile';
  static String routePath = '/userProfile';

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserProfileModel());
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
              _buildProfileHeader(theme),
              _buildMyTickets(theme),
              _buildFavoriteArtists(theme),
              _buildAccountSettings(theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(FlutterFlowTheme theme) {
    return SizedBox(
      height: 340,
      child: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return FbmGradientShaderFill(
                width: constraints.maxWidth.isFinite ? constraints.maxWidth : 200.0,
                height: constraints.maxHeight.isFinite ? constraints.maxHeight : 200.0,
                params: ShaderParams(values: {
                  'gradientAngle': 135, 'gradientScale': 0.89, 'gradientOffset': 0,
                  'noiseIntensity': 0.32, 'ditherStrength': 2.51, 'ditherScale': 0.29,
                  'animSpeed': 1.46, 'octaves': 6.06, 'lacunarity': 2.35,
                  'persistence': 0.5, 'noiseScale': 6.36, 'colorCount': 7,
                  'softness': 0, 'exposure': 1, 'contrast': 1, 'bumpStrength': 0,
                  'lightDirX': 0.55, 'lightDirY': 0.45, 'lightDirZ': 1,
                  'lightIntensity': 1.15, 'ambient': 0.7, 'specular': 0.29,
                  'shininess': 40.76, 'metallic': 1, 'roughness': 1,
                  'edgeFade': 1.72, 'edgeFadeMode': 0, 'sharpness': 2.2,
                }, colors: {
                  'color0': theme.primaryBackground, 'color1': const Color(0xFF1A1A2E),
                  'color2': theme.primary, 'color3': const Color(0xFF0A0A0F),
                  'color4': const Color(0xFF0A0A0F), 'color5': const Color(0xFF0A0A0F),
                  'color6': theme.primaryBackground,
                  'color7': const Color(0x00808080), 'color8': const Color(0x00808080),
                  'color9': const Color(0x00808080),
                }),
                animationMode: ShaderAnimationMode.continuous, cache: false,
              );
            },
          ),
          Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Avatar with gradient border
                  Container(
                    width: 110, height: 110,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [theme.primary, theme.tertiary],
                        begin: const AlignmentDirectional(1, -1),
                        end: const AlignmentDirectional(-1, 1),
                      ),
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(9999),
                        child: Container(
                          decoration: BoxDecoration(
                            color: theme.secondaryBackground,
                            borderRadius: BorderRadius.circular(9999),
                          ),
                          child: CachedNetworkImage(
                            fadeInDuration: Duration.zero, fadeOutDuration: Duration.zero,
                            imageUrl: 'https://dimg.dreamflow.cloud/v1/image/stylish%20person%20with%20neon%20lighting%20portrait',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Name + handle
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Alex Rivers',
                        style: theme.headlineMedium.override(
                          font: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                          color: theme.primaryText, letterSpacing: 0.0,
                          fontWeight: FontWeight.w800, lineHeight: 1.2,
                        ),
                      ),
                      Text('@vibe_explorer',
                        style: theme.bodyMedium.override(
                          font: GoogleFonts.urbanist(), color: theme.tertiary,
                          letterSpacing: 0.0, lineHeight: 1.45,
                        ),
                      ),
                    ].divide(const SizedBox(height: 4)),
                  ),
                  // Stats card
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        width: 320,
                        decoration: BoxDecoration(
                          color: theme.surface40,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              wrapWithModel(model: _model.profileStatModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: const ProfileStatWidget(label: 'Events', value: '12')),
                              Container(width: 1, height: 24,
                                decoration: BoxDecoration(color: theme.divider20)),
                              wrapWithModel(model: _model.profileStatModel2,
                                updateCallback: () => safeSetState(() {}),
                                child: const ProfileStatWidget(label: 'Artists', value: '48')),
                              Container(width: 1, height: 24,
                                decoration: BoxDecoration(color: theme.divider20)),
                              wrapWithModel(model: _model.profileStatModel3,
                                updateCallback: () => safeSetState(() {}),
                                child: const ProfileStatWidget(label: 'Points', value: '2.4k')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 24)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyTickets(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Tiket Saya',
                style: theme.titleLarge.override(
                  font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  color: theme.primaryText, letterSpacing: 0.0,
                  fontWeight: FontWeight.bold, lineHeight: 1.25,
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
          wrapWithModel(model: _model.ticketCard2Model1,
            updateCallback: () => safeSetState(() {}),
            child: const TicketCard2Widget(
              artist: 'Midnight Odyssey', date: 'OCT 24, 2023',
              img: 'https://dimg.dreamflow.cloud/v1/image/neon%20concert%20stage%20crowd',
              venue: 'Cyber Arena, Jakarta',
            ),
          ),
          wrapWithModel(model: _model.ticketCard2Model2,
            updateCallback: () => safeSetState(() {}),
            child: const TicketCard2Widget(
              artist: 'Electric Dreamscape', date: 'NOV 12, 2023',
              img: 'https://dimg.dreamflow.cloud/v1/image/electronic%20music%20festival%20laser%20lights',
              venue: 'Starlight Stadium',
            ),
          ),
        ].divide(const SizedBox(height: 16)),
      ),
    );
  }

  Widget _buildFavoriteArtists(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
          child: Text('Favorite Artists',
            style: theme.titleLarge.override(
              font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
              color: theme.primaryText, letterSpacing: 0.0,
              fontWeight: FontWeight.bold, lineHeight: 1.25,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                wrapWithModel(model: _model.artistChip2Model1, updateCallback: () => safeSetState(() {}),
                  child: const ArtistChip2Widget(img: 'https://dimg.dreamflow.cloud/v1/image/the%20weeknd%20portrait%20neon', name: 'Weeknd')),
                wrapWithModel(model: _model.artistChip2Model2, updateCallback: () => safeSetState(() {}),
                  child: const ArtistChip2Widget(img: 'https://dimg.dreamflow.cloud/v1/image/dua%20lipa%20portrait%20blue', name: 'Dua Lipa')),
                wrapWithModel(model: _model.artistChip2Model3, updateCallback: () => safeSetState(() {}),
                  child: const ArtistChip2Widget(img: 'https://dimg.dreamflow.cloud/v1/image/drake%20portrait%20dark', name: 'Drake')),
                wrapWithModel(model: _model.artistChip2Model4, updateCallback: () => safeSetState(() {}),
                  child: const ArtistChip2Widget(img: 'https://dimg.dreamflow.cloud/v1/image/billie%20eilish%20portrait%20green', name: 'Billie')),
                wrapWithModel(model: _model.artistChip2Model5, updateCallback: () => safeSetState(() {}),
                  child: const ArtistChip2Widget(img: 'https://dimg.dreamflow.cloud/v1/image/travis%20scott%20portrait%20red', name: 'Travis')),
              ].divide(const SizedBox(width: 16)),
            ),
          ),
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }

  Widget _buildAccountSettings(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
            child: Text('Account Settings',
              style: theme.titleLarge.override(
                font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                color: theme.primaryText, letterSpacing: 0.0,
                fontWeight: FontWeight.bold, lineHeight: 1.25,
              ),
            ),
          ),
          wrapWithModel(model: _model.menuItemModel1, updateCallback: () => safeSetState(() {}),
            child: MenuItemWidget(color: theme.tertiary,
              icon: Icon(Icons.payments_rounded, color: theme.tertiary, size: 22),
              title: 'Payment Methods')),
          wrapWithModel(model: _model.menuItemModel2, updateCallback: () => safeSetState(() {}),
            child: MenuItemWidget(color: theme.primary,
              icon: Icon(Icons.notifications_active_rounded, color: theme.tertiary, size: 22),
              title: 'Notification Settings')),
          wrapWithModel(model: _model.menuItemModel3, updateCallback: () => safeSetState(() {}),
            child: MenuItemWidget(color: theme.success,
              icon: Icon(Icons.security_rounded, color: theme.tertiary, size: 22),
              title: 'Privacy & Security')),
          wrapWithModel(model: _model.menuItemModel4, updateCallback: () => safeSetState(() {}),
            child: MenuItemWidget(color: const Color(0xFFFFB800),
              icon: Icon(Icons.support_agent_rounded, color: theme.tertiary, size: 22),
              title: 'Help Center')),
          const SizedBox(height: 24),
          wrapWithModel(model: _model.buttonModel, updateCallback: () => safeSetState(() {}),
            child: ButtonWidget(
              content: 'Sign Out',
              icon: Icon(Icons.logout_rounded, color: theme.onPrimary, size: 16),
              icon_present: true, icon_end_present: false,
              variant: 'destructive', size: 'medium',
              full_width: true, loading: false, disabled: false,
              onPressed: () async {
                final navigator = Navigator.of(context);
                final messenger = ScaffoldMessenger.of(context);
                try {
                  await _authService.signOut();
                  navigator.pushNamedAndRemoveUntil('/onboarding', (route) => false);
                } catch (_) {
                  messenger.showSnackBar(
                    const SnackBar(content: Text('Failed to sign out. Please try again.')));
                }
              },
            ),
          ),
          const SizedBox(height: 32),
        ].divide(const SizedBox(height: 8)),
      ),
    );
  }
}
