import '/components/button_widget.dart';
import '/components/seat_node_widget.dart';
import '/components/section_chip_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SeatSelectionWidget extends StatefulWidget {
  const SeatSelectionWidget({super.key});

  @override
  State<SeatSelectionWidget> createState() => _SeatSelectionWidgetState();
}

class _SeatSelectionWidgetState extends State<SeatSelectionWidget> {
  late SeatSelectionModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SeatSelectionModel());
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
        title: Text('Select Seats', style: theme.headlineSmall),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24),
          // Stage
          Container(
            width: 300,
            height: 40,
            decoration: BoxDecoration(
              color: theme.secondaryBackground,
              borderRadius: BorderRadius.circular(9999),
              border: Border.all(color: theme.primary.withValues(alpha: 0.3)),
              boxShadow: [
                BoxShadow(
                  color: theme.primary.withValues(alpha: 0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Center(
              child: Text(
                'STAGE',
                style: theme.labelSmall.override(
                  font: GoogleFonts.poppins(fontWeight: FontWeight.w800),
                  letterSpacing: 8,
                  color: theme.secondaryText,
                ),
              ),
            ),
          ),
          const SizedBox(height: 48),
          // Seat Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: 48,
                itemBuilder: (context, index) {
                  String status = 'available';
                  if (index % 7 == 0) status = 'taken';
                  if (index == 18 || index == 19) status = 'selected';
                  return SeatNodeWidget(status: status);
                },
              ),
            ),
          ),
          // Legend
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildLegendItem(theme, 'Available', theme.secondaryBackground),
                _buildLegendItem(theme, 'Selected', theme.primary),
                _buildLegendItem(theme, 'Taken', theme.alternate),
              ],
            ),
          ),
          // Section Selection
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                Expanded(child: SectionChipWidget(label: 'CAT 1', price: 'Rp 2.5jt', selected: true)),
                SizedBox(width: 12),
                Expanded(child: SectionChipWidget(label: 'CAT 2', price: 'Rp 1.8jt')),
                SizedBox(width: 12),
                Expanded(child: SectionChipWidget(label: 'CAT 3', price: 'Rp 1.2jt')),
              ],
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.primaryBackground,
          border: Border(top: BorderSide(color: theme.alternate)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2 Seats Selected', style: theme.labelSmall),
                  Text('Rp 5.000.000', style: theme.headlineMedium.override(color: theme.tertiary)),
                ],
              ),
            ),
            ButtonWidget(
              content: 'Checkout',
              onPressed: () => Navigator.pushNamed(context, '/checkout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(FlutterFlowTheme theme, String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
            border: color == theme.secondaryBackground ? Border.all(color: theme.alternate) : null,
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: theme.bodySmall),
      ],
    );
  }
}


class SeatSelectionModel extends FlutterFlowModel<SeatSelectionWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
