import '/components/artist_chip2_widget.dart';
import '/components/button_widget.dart';
import '/components/menu_item_widget.dart';
import '/components/profile_stat_widget.dart';
import '/components/ticket_card2_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserProfileWidget extends StatefulWidget {
  const UserProfileWidget({super.key});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late UserProfileModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    gradient: theme.primaryGradient,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Profile', style: theme.headlineMedium.override(color: Colors.white)),
                            const Icon(Icons.settings_rounded, color: Colors.white),
                          ],
                        ),
                        const SizedBox(height: 48),
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color: theme.secondaryBackground,
                            shape: BoxShape.circle,
                            border: Border.all(color: theme.primaryBackground, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.2),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: CachedNetworkImage(
                              imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Alex Rivera', style: theme.headlineMedium),
            Text('alex.rivera@example.com', style: theme.bodyMedium),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProfileStatWidget(label: 'Tickets', value: '12'),
                  ProfileStatWidget(label: 'Following', value: '48'),
                  ProfileStatWidget(label: 'Events', value: '24'),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Recent Tickets', style: theme.titleLarge),
                  const SizedBox(height: 16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TicketCard2Widget(title: 'Coldplay', date: '15 Nov'),
                        SizedBox(width: 12),
                        TicketCard2Widget(title: 'The Weeknd', date: '02 Dec'),
                        SizedBox(width: 12),
                        TicketCard2Widget(title: 'Lauv', date: '20 Jan'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text('Favorite Artists', style: theme.titleLarge),
                  const SizedBox(height: 16),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ArtistChip2Widget(name: 'Coldplay', img_url: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800'),
                        SizedBox(width: 16),
                        ArtistChip2Widget(name: 'The Weeknd', img_url: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800'),
                        SizedBox(width: 16),
                        ArtistChip2Widget(name: 'NIKI', img_url: 'https://images.unsplash.com/photo-1598387993281-cecf8b71a8f8?w=800'),
                        SizedBox(width: 16),
                        ArtistChip2Widget(name: 'Lauv', img_url: 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const MenuItemWidget(icon: Icon(Icons.person_outline_rounded, color: Color(0xFF6C5CE7)), label: 'Edit Profile'),
                  const MenuItemWidget(icon: Icon(Icons.notifications_none_rounded, color: Color(0xFF00D2FF)), label: 'Notifications'),
                  const MenuItemWidget(icon: Icon(Icons.security_rounded, color: Color(0xFFFF6B9D)), label: 'Security'),
                  const SizedBox(height: 32),
                  ButtonWidget(
                    content: 'Log Out',
                    variant: 'secondary',
                    full_width: true,
                    onPressed: () => Navigator.pushNamedAndRemoveUntil(context, '/onboarding', (route) => false),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
