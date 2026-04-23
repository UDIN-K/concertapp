import '/components/button_widget.dart';
import '/components/payment_card_widget.dart';
import '/components/summary_row_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'checkout_widget.dart' show CheckoutWidget;

class CheckoutModel extends FlutterFlowModel<CheckoutWidget> {
  // Model for SummaryRow.
  late SummaryRowModel summaryRowModel1;
  late SummaryRowModel summaryRowModel2;
  late SummaryRowModel summaryRowModel3;
  // Model for PaymentCard.
  late PaymentCardModel paymentCardModel1;
  late PaymentCardModel paymentCardModel2;
  late PaymentCardModel paymentCardModel3;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    summaryRowModel1 = createModel(context, () => SummaryRowModel());
    summaryRowModel2 = createModel(context, () => SummaryRowModel());
    summaryRowModel3 = createModel(context, () => SummaryRowModel());
    paymentCardModel1 = createModel(context, () => PaymentCardModel());
    paymentCardModel2 = createModel(context, () => PaymentCardModel());
    paymentCardModel3 = createModel(context, () => PaymentCardModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    summaryRowModel1.dispose();
    summaryRowModel2.dispose();
    summaryRowModel3.dispose();
    paymentCardModel1.dispose();
    paymentCardModel2.dispose();
    paymentCardModel3.dispose();
    buttonModel.dispose();
  }
}
