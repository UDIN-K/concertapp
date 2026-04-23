import '/components/button_widget.dart';
import '/components/feature_tag_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  static String routeName = 'Onboarding';
  static String routePath = '/onboarding';

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // Slide data
  static const List<_SlideData> _slides = [
    _SlideData(
      image: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800&q=80',
      title: 'Feel the Beat,\nLive the Vibe',
      subtitle: 'Your all-access pass to the world\'s most electric concerts and festivals.',
      tags: ['Exclusive Access', 'Fast Entry'],
    ),
    _SlideData(
      image: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800&q=80',
      title: 'Discover\nAmazing Artists',
      subtitle: 'Browse thousands of live events from your favorite artists around the world.',
      tags: ['Top Artists', 'Live Shows'],
    ),
    _SlideData(
      image: 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800&q=80',
      title: 'Book Tickets\nInstantly',
      subtitle: 'Secure your spot in seconds with our seamless booking experience.',
      tags: ['Instant Booking', 'Secure Payment'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());
  }

  @override
  void dispose() {
    _pageController.dispose();
    _model.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final isLastPage = _currentPage == _slides.length - 1;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: theme.primaryBackground,
        body: Stack(
          fit: StackFit.expand,
          children: [
            // ── Layer 1: Animated gradient background ──
            Positioned.fill(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return FbmGradientShaderFill(
                    width: constraints.maxWidth.isFinite
                        ? constraints.maxWidth : 200.0,
                    height: constraints.maxHeight.isFinite
                        ? constraints.maxHeight
                        : MediaQuery.sizeOf(context).height,
                    params: ShaderParams(
                      colors: {
                        'color0': theme.primaryBackground,
                        'color1': theme.primary,
                        'color2': const Color(0xFF1A1A2E),
                      },
                    ),
                    animationMode: ShaderAnimationMode.continuous,
                  );
                },
              ),
            ),

            // ── Layer 2: PageView (image + content slides) ──
            Column(
              children: [
                // Image area — top 45%
                Expanded(
                  flex: 45,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    itemCount: _slides.length,
                    itemBuilder: (context, index) {
                      return ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.white.withValues(alpha: 0.8),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.6, 1.0],
                        ).createShader(bounds),
                        blendMode: BlendMode.dstIn,
                        child: CachedNetworkImage(
                          imageUrl: _slides[index].image,
                          fit: BoxFit.cover,
                          placeholder: (_, __) => Container(
                            color: theme.secondaryBackground,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: theme.primary, strokeWidth: 2,
                              ),
                            ),
                          ),
                          errorWidget: (_, __, ___) => Container(
                            color: theme.secondaryBackground,
                            child: Icon(Icons.music_note,
                                color: theme.primary, size: 64),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Content area — bottom 55%
                Expanded(
                  flex: 55,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Feature tags (animated per page)
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Wrap(
                            key: ValueKey(_currentPage),
                            spacing: 16,
                            runSpacing: 8,
                            alignment: WrapAlignment.center,
                            children: _slides[_currentPage].tags.map((tag) {
                              final icons = {
                                'Exclusive Access': Icons.local_activity_rounded,
                                'Fast Entry': Icons.confirmation_number_rounded,
                                'Top Artists': Icons.star_rounded,
                                'Live Shows': Icons.live_tv_rounded,
                                'Instant Booking': Icons.flash_on_rounded,
                                'Secure Payment': Icons.shield_rounded,
                              };
                              return FeatureTagWidget(
                                icon: Icon(
                                  icons[tag] ?? Icons.check_circle_rounded,
                                  color: theme.tertiary,
                                  size: 16,
                                ),
                                label: tag,
                              );
                            }).toList(),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Title (animated per page)
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            _slides[_currentPage].title,
                            key: ValueKey('title_$_currentPage'),
                            textAlign: TextAlign.center,
                            style: theme.headlineLarge.override(
                              font: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w900),
                              color: theme.primaryText,
                              fontWeight: FontWeight.w900,
                              lineHeight: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Subtitle
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: Text(
                            _slides[_currentPage].subtitle,
                            key: ValueKey('sub_$_currentPage'),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: theme.bodyLarge.override(
                              font: GoogleFonts.urbanist(),
                              color: theme.secondaryText,
                              lineHeight: 1.5,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Page dots
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_slides.length, (i) {
                            final isActive = i == _currentPage;
                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              width: isActive ? 24 : 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? theme.tertiary
                                    : theme.secondaryBackground,
                                borderRadius: BorderRadius.circular(9999),
                              ),
                            );
                          }),
                        ),

                        const Spacer(),

                        // Buttons — change based on page
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: isLastPage
                              ? Column(
                                  key: const ValueKey('login_buttons'),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    wrapWithModel(
                                      model: _model.buttonModel1,
                                      updateCallback: () =>
                                          safeSetState(() {}),
                                      child: ButtonWidget(
                                        content: 'Login / Sign Up',
                                        icon_present: false,
                                        icon_end_present: false,
                                        variant: 'primary',
                                        size: 'large',
                                        full_width: true,
                                        loading: false,
                                        disabled: false,
                                        onPressed: () =>
                                            Navigator.pushReplacementNamed(
                                                context, '/loginSignup'),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  key: const ValueKey('next_buttons'),
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    wrapWithModel(
                                      model: _model.buttonModel1,
                                      updateCallback: () =>
                                          safeSetState(() {}),
                                      child: ButtonWidget(
                                        content: 'Next',
                                        icon_present: false,
                                        icon_end_present: false,
                                        variant: 'primary',
                                        size: 'large',
                                        full_width: true,
                                        loading: false,
                                        disabled: false,
                                        onPressed: _nextPage,
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.buttonModel2,
                                      updateCallback: () =>
                                          safeSetState(() {}),
                                      child: ButtonWidget(
                                        content: 'Skip',
                                        icon_present: false,
                                        icon_end_present: false,
                                        variant: 'ghost',
                                        size: 'medium',
                                        full_width: true,
                                        loading: false,
                                        disabled: false,
                                        onPressed: () =>
                                            Navigator.pushReplacementNamed(
                                                context, '/loginSignup'),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 12)),
                                ),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SlideData {
  final String image;
  final String title;
  final String subtitle;
  final List<String> tags;

  const _SlideData({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.tags,
  });
}
