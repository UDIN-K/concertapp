import '/components/button_widget.dart';
import '/components/payment_card_widget.dart';
import '/components/summary_row_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({super.key});

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderRadius: 12,
          buttonSize: 44,
          icon: Icon(Icons.chevron_left_rounded, color: theme.primaryText, size: 24),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Checkout', style: theme.headlineSmall),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.secondaryBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.alternate),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Coldplay Concert', style: theme.titleMedium),
                        Text('CAT 1 • Row A • Seat 18, 19', style: theme.bodySmall),
                        const SizedBox(height: 8),
                        Text('Rp 5.000.000', style: theme.titleMedium.override(color: theme.tertiary)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text('Payment Method', style: theme.titleLarge),
            const SizedBox(height: 16),
            const PaymentCardWidget(
              icon: Icon(Icons.account_balance_wallet_rounded, color: Color(0xFF6C5CE7)),
              label: 'Digital Wallet (DANA/OVO)',
              selected: true,
            ),
            const SizedBox(height: 12),
            const PaymentCardWidget(
              icon: Icon(Icons.credit_card_rounded, color: Color(0xFF00D2FF)),
              label: 'Credit Card',
            ),
            const SizedBox(height: 12),
            const PaymentCardWidget(
              icon: Icon(Icons.account_balance_rounded, color: Color(0xFFFF6B9D)),
              label: 'Bank Transfer',
            ),
            const SizedBox(height: 32),
            Text('Order Summary', style: theme.titleLarge),
            const SizedBox(height: 16),
            const SummaryRowWidget(label: 'Price (2 tickets)', value: 'Rp 5.000.000'),
            const SummaryRowWidget(label: 'Service Fee', value: 'Rp 50.000'),
            const SummaryRowWidget(label: 'Tax (10%)', value: 'Rp 500.000'),
            const Divider(height: 32),
            const SummaryRowWidget(label: 'Total Payment', value: 'Rp 5.550.000', is_total: true),
            const SizedBox(height: 48),
            ButtonWidget(
              content: 'Pay Now',
              full_width: true,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Payment Successful!')),
                );
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}


class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
