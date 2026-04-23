import '/components/button_widget.dart';
import '/components/payment_card_widget.dart';
import '/components/summary_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'checkout_model.dart';
export 'checkout_model.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

  static String routeName = 'Checkout';
  static String routePath = '/checkout';

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
  late CheckoutModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CheckoutModel());
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
        body: Stack(
          alignment: const AlignmentDirectional(-1, -1),
          children: [
            // Gradient shader background
            LayoutBuilder(
              builder: (context, constraints) {
                return FbmGradientShaderFill(
                  width: constraints.maxWidth.isFinite ? constraints.maxWidth : 200.0,
                  height: constraints.maxHeight.isFinite ? constraints.maxHeight : 200.0,
                  params: ShaderParams(values: {
                    'gradientAngle': 180, 'gradientScale': 0.89, 'gradientOffset': 0,
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
                  animationMode: ShaderAnimationMode.continuous,
                  cache: false,
                );
              },
            ),
            // Scrollable content
            SingleChildScrollView(
              primary: false,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 140),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 100),
                        // Event card with image
                        _buildEventCard(theme),
                        // Order summary
                        _buildOrderSummary(theme),
                        // Payment methods
                        _buildPaymentMethods(theme),
                        // SSL notice
                        _buildSecurityNotice(theme),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Top blur header
            _buildTopHeader(theme),
            // Bottom payment bar
            _buildBottomBar(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 20, color: theme.primary27, offset: const Offset(0, 8)),
            ],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Stack(
            alignment: const AlignmentDirectional(-1, -1),
            children: [
              CachedNetworkImage(
                fadeInDuration: Duration.zero,
                fadeOutDuration: Duration.zero,
                imageUrl: 'https://dimg.dreamflow.cloud/v1/image/concert%20stage%20lights%20purple%20and%20blue%20crowd',
                height: 180, width: double.infinity, fit: BoxFit.cover,
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1),
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xCC000000), Colors.transparent],
                      stops: [0, 1],
                      begin: AlignmentDirectional(0, 1),
                      end: AlignmentDirectional(0, -1),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: theme.primary,
                            borderRadius: BorderRadius.circular(9999),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(10, 4, 10, 4),
                            child: Text('VIP ACCESS',
                              style: theme.labelSmall.override(
                                font: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                                color: theme.onPrimary, letterSpacing: 0.0,
                                fontWeight: FontWeight.bold, lineHeight: 1.2,
                              ),
                            ),
                          ),
                        ),
                        Text('The After Hours Tour',
                          style: theme.titleLarge.override(
                            font: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                            color: theme.primaryText, letterSpacing: 0.0,
                            fontWeight: FontWeight.w800, lineHeight: 1.25,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded, color: theme.primary, size: 14),
                            const SizedBox(width: 8),
                            Text('Madison Square Garden, NY',
                              style: theme.labelSmall.override(
                                font: GoogleFonts.poppins(), color: theme.primaryText80,
                                letterSpacing: 0.0, lineHeight: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ].divide(const SizedBox(height: 4)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Order Summary',
            style: theme.titleMedium.override(
              font: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
              color: theme.primaryText, letterSpacing: 0.0,
              fontWeight: FontWeight.bold, lineHeight: 1.3,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(32),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: theme.surface40,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: theme.alternate, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      wrapWithModel(model: _model.summaryRowModel1,
                        updateCallback: () => safeSetState(() {}),
                        child: const SummaryRowWidget(label: 'VIP Standing x 2', value: 'Rp 4.5M'),
                      ),
                      wrapWithModel(model: _model.summaryRowModel2, updateCallback: () => safeSetState(() {}),
                        child: const SummaryRowWidget(label: 'Service Fee', value: 'Rp 125k'),
                      ),
                      wrapWithModel(model: _model.summaryRowModel3, updateCallback: () => safeSetState(() {}),
                        child: const SummaryRowWidget(label: 'Tax (VAT)', value: 'Rp 80k'),
                      ),
                      Divider(height: 16, thickness: 1, color: theme.alternate),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Pembayaran',
                              style: theme.titleMedium.override(
                                font: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
                                color: theme.primaryText, letterSpacing: 0.0,
                                fontWeight: FontWeight.bold, lineHeight: 1.3,
                              ),
                            ),
                            Text('Rp 4.7M',
                              style: theme.titleMedium.override(
                                font: GoogleFonts.urbanist(fontWeight: FontWeight.w800),
                                color: theme.primary, letterSpacing: 0.0,
                                fontWeight: FontWeight.w800, lineHeight: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ].divide(const SizedBox(height: 8)),
                  ),
                ),
              ),
            ),
          ),
        ].divide(const SizedBox(height: 16)),
      ),
    );
  }

  Widget _buildPaymentMethods(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Payment Method',
            style: theme.titleMedium.override(
              font: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
              color: theme.primaryText, letterSpacing: 0.0,
              fontWeight: FontWeight.bold, lineHeight: 1.3,
            ),
          ),
          wrapWithModel(model: _model.paymentCardModel1,
            updateCallback: () => safeSetState(() {}),
            child: PaymentCardWidget(
              detail: 'Saldo: Rp 12.4M',
              icon: Icon(Icons.account_balance_wallet_rounded, color: theme.primaryText, size: 24),
              name: 'Vibe Wallet', selected: true,
            ),
          ),
          wrapWithModel(model: _model.paymentCardModel2,
            updateCallback: () => safeSetState(() {}),
            child: PaymentCardWidget(
              detail: '•••• 8821',
              icon: Icon(Icons.credit_card_rounded, color: theme.primaryText, size: 24),
              name: 'Mastercard', selected: false,
            ),
          ),
          wrapWithModel(model: _model.paymentCardModel3,
            updateCallback: () => safeSetState(() {}),
            child: PaymentCardWidget(
              detail: 'Instant Checkout',
              icon: Icon(Icons.apple_rounded, color: theme.primaryText, size: 24),
              name: 'Apple Pay', selected: false,
            ),
          ),
        ].divide(const SizedBox(height: 16)),
      ),
    );
  }

  Widget _buildSecurityNotice(FlutterFlowTheme theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.verified_user_rounded, color: theme.success, size: 16),
          const SizedBox(width: 8),
          Text('Secure 256-bit SSL Encrypted Payment',
            style: theme.labelSmall.override(
              font: GoogleFonts.poppins(), color: theme.secondaryText,
              letterSpacing: 0.0, lineHeight: 1.2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopHeader(FlutterFlowTheme theme) {
    return Align(
      alignment: const AlignmentDirectional(0, -1),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: SizedBox(
            height: 100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(24, 40, 24, 0),
                  child: SizedBox(
                    height: 59,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FlutterFlowIconButton(
                          borderRadius: 16, buttonSize: 40,
                          fillColor: theme.secondaryBackground,
                          icon: Icon(Icons.arrow_back_ios_new_rounded, color: theme.primaryText, size: 20),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text('Pembayaran',
                          style: theme.titleMedium.override(
                            font: GoogleFonts.urbanist(fontWeight: FontWeight.bold),
                            letterSpacing: 0.0, fontWeight: FontWeight.bold, lineHeight: 1.3,
                          ),
                        ),
                        FlutterFlowIconButton(
                          borderRadius: 8, buttonSize: 40,
                          fillColor: Colors.transparent,
                          icon: Icon(Icons.more_horiz_rounded, color: theme.primaryText, size: 24),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(height: 1, decoration: BoxDecoration(color: theme.alternate)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomBar(FlutterFlowTheme theme) {
    return Align(
      alignment: const AlignmentDirectional(0, 1),
      child: Container(
        height: 120,
        decoration: BoxDecoration(color: theme.secondaryBackground),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 1, decoration: BoxDecoration(color: theme.alternate)),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
              child: SizedBox(
                height: 87,
                child: Row(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total', style: GoogleFonts.urbanist(fontSize: 12, color: theme.secondaryText)),
                        Text('Rp 4.7M',
                          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w800, color: theme.primaryText),
                        ),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Expanded(
                      child: wrapWithModel(
                        model: _model.buttonModel,
                        updateCallback: () => safeSetState(() {}),
                        child: ButtonWidget(
                          content: 'Pay Now',
                          icon: Icon(Icons.lock_rounded, color: theme.onPrimary, size: 16),
                          icon_present: true, icon_end_present: false,
                          variant: 'primary', size: 'large',
                          full_width: true, loading: false, disabled: false,
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Payment Successful!')),
                            );
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
