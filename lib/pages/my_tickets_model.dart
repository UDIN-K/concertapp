import '/components/button_widget.dart';
import '/components/ticket_card_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'my_tickets_widget.dart' show MyTicketsWidget;

class MyTicketsModel extends FlutterFlowModel<MyTicketsWidget> {
  late TicketCardModel ticketCardModel1;
  late TicketCardModel ticketCardModel2;
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    ticketCardModel1 = createModel(context, () => TicketCardModel());
    ticketCardModel2 = createModel(context, () => TicketCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    ticketCardModel1.dispose();
    ticketCardModel2.dispose();
    buttonModel.dispose();
  }
}
