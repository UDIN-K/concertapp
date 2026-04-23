import '/components/button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../services/auth_service.dart';

import 'login_signup_model.dart';
export 'login_signup_model.dart';

class LoginSignupWidget extends StatefulWidget {
  const LoginSignupWidget({super.key});

  static String routeName = 'LoginSignup';
  static String routePath = '/loginSignup';

  @override
  State<LoginSignupWidget> createState() => _LoginSignupWidgetState();
}

class _LoginSignupWidgetState extends State<LoginSignupWidget> {
  late LoginSignupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLogin = true;
  bool isLoading = false;
  String email = '';
  String password = '';
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSignupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_authService.isLoggedIn) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // ── Auth Logic (preserved from original) ──────────────────────────

  Future<void> _submit() async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    if (!isLogin && password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password must be at least 6 characters')),
      );
      return;
    }
    setState(() => isLoading = true);
    try {
      if (isLogin) {
        await _authService.signInWithEmailAndPassword(email.trim(), password);
      } else {
        await _authService.signUpWithEmailAndPassword(email.trim(), password);
      }
      if (mounted) Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_mapAuthError(e, isGoogle: false))),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Authentication failed. Please try again.')),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  Future<void> _googleSignIn() async {
    setState(() => isLoading = true);
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null && mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Redirecting to Google sign-in...')),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(_mapAuthError(e, isGoogle: true))),
        );
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Google Sign-In failed. Please try again.')),
        );
      }
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

  String _mapAuthError(FirebaseAuthException e, {required bool isGoogle}) {
    switch (e.code) {
      case 'invalid-email': return 'Invalid email format.';
      case 'user-not-found': return 'Email is not registered yet.';
      case 'wrong-password':
      case 'invalid-credential': return 'Email or password is incorrect.';
      case 'email-already-in-use': return 'This email is already registered. Try login instead.';
      case 'weak-password': return 'Password is too weak. Use at least 6 characters.';
      case 'operation-not-allowed':
        return isGoogle
            ? 'Google Sign-In is not enabled in Firebase Auth provider settings.'
            : 'Email/Password auth is not enabled in Firebase Auth provider settings.';
      case 'unauthorized-domain': return 'This domain is not authorized. Add localhost in Firebase Auth authorized domains.';
      case 'popup-blocked': return 'Popup blocked by browser. Allow popups for this site and try again.';
      case 'account-exists-with-different-credential': return 'An account already exists with the same email using a different sign-in method.';
      case 'popup-closed-by-user':
      case 'web-context-cancelled': return 'Google Sign-In was cancelled.';
      case 'network-request-failed': return 'Network error. Check your connection and try again.';
      case 'too-many-requests': return 'Too many attempts. Please try again later.';
      default: return e.message ?? 'Authentication error: ${e.code}';
    }
  }

  // ── UI (FlutterFlow design) ───────────────────────────────────────

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
                padding: const EdgeInsetsDirectional.fromSTEB(24, 32, 24, 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildLogo(theme),
                    _buildTabSwitcher(theme),
                    _buildGoogleButton(theme),
                    _buildFormFields(theme),
                    _buildSubmitSection(theme),
                    // Subtle gradient line
                    SizedBox(
                      height: 1,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return FbmGradientShaderFill(
                            width: constraints.maxWidth.isFinite ? constraints.maxWidth : 200.0,
                            height: 1,
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
                              'color0': theme.primaryBackground, 'color1': theme.primaryBackground,
                              'color2': const Color(0x330066FF), 'color3': theme.primaryBackground,
                              'color4': theme.primaryBackground, 'color5': theme.primaryBackground,
                              'color6': theme.primaryBackground,
                              'color7': const Color(0x00808080), 'color8': const Color(0x00808080),
                              'color9': const Color(0x00808080),
                            }),
                            animationMode: ShaderAnimationMode.continuous, cache: false,
                          );
                        },
                      ),
                    ),
                  ].divide(const SizedBox(height: 32)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80, height: 80,
          decoration: BoxDecoration(
            color: theme.secondaryBackground, borderRadius: BorderRadius.circular(32),
          ),
          alignment: const AlignmentDirectional(0, 0),
          child: Icon(Icons.music_note_rounded, color: theme.primary, size: 48),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('TixConcert',
              style: theme.headlineMedium.override(
                font: GoogleFonts.poppins(), color: theme.primaryText,
                letterSpacing: 0.0, lineHeight: 1.2,
              ),
            ),
            Text('Tiket konser impianmu ada di sini',
              style: theme.bodySmall.override(
                font: GoogleFonts.urbanist(), color: theme.secondaryText,
                letterSpacing: 0.0, lineHeight: 1.4,
              ),
            ),
          ].divide(const SizedBox(height: 4)),
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }

  Widget _buildTabSwitcher(FlutterFlowTheme theme) {
    return Container(
      decoration: BoxDecoration(
        color: theme.secondaryBackground, borderRadius: BorderRadius.circular(32),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            _buildTab(theme, 'Masuk', isLogin),
            const SizedBox(width: 8),
            _buildTab(theme, 'Daftar', !isLogin),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(FlutterFlowTheme theme, String label, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => isLogin = label == 'Masuk'),
        child: Container(
          decoration: BoxDecoration(
            color: selected ? theme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
          alignment: const AlignmentDirectional(0, 0),
          child: Text(label,
            style: theme.labelLarge.override(
              font: GoogleFonts.poppins(),
              color: selected ? theme.onPrimary : theme.secondaryText,
              letterSpacing: 0.0, lineHeight: 1.3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGoogleButton(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        wrapWithModel(model: _model.buttonModel1,
          updateCallback: () => safeSetState(() {}),
          child: ButtonWidget(
            content: 'Masuk dengan Google',
            icon: Icon(Icons.g_mobiledata_rounded, color: theme.primaryText, size: 20),
            icon_present: true, icon_end_present: false,
            variant: 'outline', size: 'large',
            full_width: true, loading: false, disabled: isLoading,
            onPressed: _googleSignIn,
          ),
        ),
        Row(
          children: [
            Expanded(child: Divider(height: 16, thickness: 1, color: theme.alternate)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('atau',
                style: theme.labelSmall.override(
                  font: GoogleFonts.poppins(), color: theme.onPrimary,
                  letterSpacing: 0.0, lineHeight: 1.2,
                ),
              ),
            ),
            Expanded(child: Divider(height: 16, thickness: 1, color: theme.alternate)),
          ],
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }

  Widget _buildFormFields(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Email field
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email',
              style: theme.labelMedium.override(
                font: GoogleFonts.poppins(), color: theme.primaryText,
                letterSpacing: 0.0, lineHeight: 1.3,
              ),
            ),
            wrapWithModel(model: _model.textFieldModel1,
              updateCallback: () => safeSetState(() {}),
              child: TextFieldWidget(
                label: false, helper: false,
                hint: 'nama@email.com', value: '',
                leading_icon: Icon(Icons.mail_rounded, color: theme.primaryText, size: 16),
                leading_icon_present: true, trailing_icon_present: false,
                bg: theme.secondaryBackground, radius: 24.0, variant: 'filled', error: false,
                onChanged: (val) => email = val,
              ),
            ),
          ].divide(const SizedBox(height: 8)),
        ),
        // Password field
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kata Sandi',
              style: theme.labelMedium.override(
                font: GoogleFonts.poppins(), color: theme.primaryText,
                letterSpacing: 0.0, lineHeight: 1.3,
              ),
            ),
            wrapWithModel(model: _model.textFieldModel2,
              updateCallback: () => safeSetState(() {}),
              child: TextFieldWidget(
                label: false, helper: false,
                hint: '••••••••', value: '',
                leading_icon: Icon(Icons.lock_rounded, color: theme.primaryText, size: 16),
                leading_icon_present: true,
                trailing_icon: Icon(Icons.visibility_off_rounded, color: theme.primaryText, size: 16),
                trailing_icon_present: true,
                bg: theme.secondaryBackground, radius: 24.0, variant: 'filled', error: false,
                obscureText: true,
                onChanged: (val) => password = val,
              ),
            ),
            if (isLogin)
              Align(
                alignment: const AlignmentDirectional(1, -1),
                child: Text('Lupa kata sandi?',
                  style: theme.labelSmall.override(
                    font: GoogleFonts.poppins(), color: theme.primary,
                    letterSpacing: 0.0, lineHeight: 1.2,
                  ),
                ),
              ),
          ].divide(const SizedBox(height: 8)),
        ),
      ].divide(const SizedBox(height: 24)),
    );
  }

  Widget _buildSubmitSection(FlutterFlowTheme theme) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        wrapWithModel(model: _model.buttonModel2,
          updateCallback: () => safeSetState(() {}),
          child: ButtonWidget(
            content: isLogin ? 'Masuk Sekarang' : 'Daftar Sekarang',
            icon_present: false, icon_end_present: false,
            variant: 'primary', size: 'large',
            full_width: true, loading: isLoading, disabled: isLoading,
            onPressed: _submit,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isLogin ? 'Belum punya akun?' : 'Sudah punya akun?',
              style: theme.bodySmall.override(
                font: GoogleFonts.urbanist(), color: theme.secondaryText,
                letterSpacing: 0.0, lineHeight: 1.4,
              ),
            ),
            const SizedBox(width: 4),
            GestureDetector(
              onTap: () => setState(() => isLogin = !isLogin),
              child: Text(isLogin ? 'Daftar di sini' : 'Masuk di sini',
                style: theme.labelSmall.override(
                  font: GoogleFonts.poppins(), color: theme.primary,
                  letterSpacing: 0.0, lineHeight: 1.2,
                ),
              ),
            ),
          ],
        ),
      ].divide(const SizedBox(height: 16)),
    );
  }
}
