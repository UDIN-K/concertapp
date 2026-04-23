import '/components/button_widget.dart';
import '/components/ticket_card_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class MyTicketsWidget extends StatefulWidget {
  const MyTicketsWidget({super.key});

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
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Text('My Tickets', style: theme.headlineSmall),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const TicketCardWidget(
            title: 'Coldplay Concert',
            artist: 'Coldplay',
            date: '15 Nov 2026',
            location: 'GBK Stadium',
            status: 'Active',
            img_url: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
          ),
          const SizedBox(height: 16),
          const TicketCardWidget(
            title: 'The Weeknd Live',
            artist: 'The Weeknd',
            date: '02 Dec 2026',
            location: 'JIS Jakarta',
            status: 'Used',
            img_url: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800',
          ),
          const SizedBox(height: 48),
          ButtonWidget(
            content: 'Browse More Concerts',
            variant: 'outline',
            full_width: true,
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
        ],
      ),
    );
  }
}


class MyTicketsModel extends FlutterFlowModel<MyTicketsWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
