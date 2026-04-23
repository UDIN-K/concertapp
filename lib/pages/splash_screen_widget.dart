import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';
import 'dart:async';

import 'splash_screen_model.dart';
export 'splash_screen_model.dart';

class SplashScreenWidget extends StatefulWidget {
  const SplashScreenWidget({super.key});

  static String routeName = 'SplashScreen';
  static String routePath = '/splash';

  @override
  State<SplashScreenWidget> createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  late SplashScreenModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashScreenModel());
    
    // Timer to navigate after 2.5 seconds
    Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        if (_authService.isLoggedIn) {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    final user = _authService.currentAppUser;
    
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Animated gradient background
          Positioned.fill(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite ? constraints.maxWidth : 200.0,
                  height: constraints.maxHeight.isFinite ? constraints.maxHeight : MediaQuery.sizeOf(context).height,
                  params: ShaderParams(
                    colors: {
                      'color0': theme.primaryBackground,
                      'color1': theme.primaryBackground,
                      'color2': const Color(0x330066FF),
                      'color3': theme.primaryBackground,
                      'color4': theme.primaryBackground,
                      'color5': theme.primaryBackground,
                      'color6': theme.primaryBackground,
                    },
                  ),
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
          ),
          
          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Container(
                width: 100, height: 100,
                decoration: BoxDecoration(
                  color: theme.secondaryBackground,
                  borderRadius: BorderRadius.circular(32),
                ),
                alignment: const AlignmentDirectional(0, 0),
                child: Icon(Icons.music_note_rounded, color: theme.primary, size: 60),
              ),
              const SizedBox(height: 24),
              // App Name
              Text('TixConcert',
                style: theme.headlineLarge.override(
                  font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                  color: theme.primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              
              // Loading indicator
              SizedBox(
                width: 24, height: 24,
                child: CircularProgressIndicator(
                  color: theme.tertiary,
                  strokeWidth: 2,
                ),
              ),
              
              const SizedBox(height: 32),
              
              // Logged in text
              if (_authService.isLoggedIn && user != null)
                Text('Logged in as ${user.displayName}',
                  style: theme.bodyMedium.override(
                    font: GoogleFonts.urbanist(fontWeight: FontWeight.w600),
                    color: theme.tertiary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
