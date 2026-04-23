import '/components/button_widget.dart';
import '/components/seat_node_widget.dart';
import '/components/section_chip_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'seat_selection_widget.dart' show SeatSelectionWidget;

class SeatSelectionModel extends FlutterFlowModel<SeatSelectionWidget> {
  // Model for SeatNode.
  late SeatNodeModel seatNodeModel1;
  late SeatNodeModel seatNodeModel2;
  late SeatNodeModel seatNodeModel3;
  late SeatNodeModel seatNodeModel4;
  late SeatNodeModel seatNodeModel5;
  late SeatNodeModel seatNodeModel6;
  late SeatNodeModel seatNodeModel7;
  late SeatNodeModel seatNodeModel8;
  late SeatNodeModel seatNodeModel9;
  late SeatNodeModel seatNodeModel10;
  late SeatNodeModel seatNodeModel11;
  late SeatNodeModel seatNodeModel12;
  late SeatNodeModel seatNodeModel13;
  late SeatNodeModel seatNodeModel14;
  late SeatNodeModel seatNodeModel15;
  late SeatNodeModel seatNodeModel16;
  late SeatNodeModel seatNodeModel17;
  late SeatNodeModel seatNodeModel18;
  late SeatNodeModel seatNodeModel19;
  late SeatNodeModel seatNodeModel20;
  late SeatNodeModel seatNodeModel21;
  late SeatNodeModel seatNodeModel22;
  late SeatNodeModel seatNodeModel23;
  late SeatNodeModel seatNodeModel24;
  late SeatNodeModel seatNodeModel25;
  late SeatNodeModel seatNodeModel26;
  late SeatNodeModel seatNodeModel27;
  late SeatNodeModel seatNodeModel28;
  late SeatNodeModel seatNodeModel29;
  late SeatNodeModel seatNodeModel30;
  late SeatNodeModel seatNodeModel31;
  late SeatNodeModel seatNodeModel32;
  late SeatNodeModel seatNodeModel33;
  late SeatNodeModel seatNodeModel34;
  late SeatNodeModel seatNodeModel35;
  late SeatNodeModel seatNodeModel36;
  late SeatNodeModel seatNodeModel37;
  late SeatNodeModel seatNodeModel38;
  late SeatNodeModel seatNodeModel39;
  late SeatNodeModel seatNodeModel40;
  late SeatNodeModel seatNodeModel41;
  // Model for SectionChip.
  late SectionChipModel sectionChipModel1;
  late SectionChipModel sectionChipModel2;
  late SectionChipModel sectionChipModel3;
  // Model for Button.
  late ButtonModel buttonModel;

  List<SeatNodeModel> get seatNodeModels => [
    seatNodeModel1,
    seatNodeModel2,
    seatNodeModel3,
    seatNodeModel4,
    seatNodeModel5,
    seatNodeModel6,
    seatNodeModel7,
    seatNodeModel8,
    seatNodeModel9,
    seatNodeModel10,
    seatNodeModel11,
    seatNodeModel12,
    seatNodeModel13,
    seatNodeModel14,
    seatNodeModel15,
    seatNodeModel16,
    seatNodeModel17,
    seatNodeModel18,
    seatNodeModel19,
    seatNodeModel20,
    seatNodeModel21,
    seatNodeModel22,
    seatNodeModel23,
    seatNodeModel24,
    seatNodeModel25,
    seatNodeModel26,
    seatNodeModel27,
    seatNodeModel28,
    seatNodeModel29,
    seatNodeModel30,
    seatNodeModel31,
    seatNodeModel32,
    seatNodeModel33,
    seatNodeModel34,
    seatNodeModel35,
    seatNodeModel36,
    seatNodeModel37,
    seatNodeModel38,
    seatNodeModel39,
    seatNodeModel40,
    seatNodeModel41,
  ];

  @override
  void initState(BuildContext context) {
    seatNodeModel1 = createModel(context, () => SeatNodeModel());
    seatNodeModel2 = createModel(context, () => SeatNodeModel());
    seatNodeModel3 = createModel(context, () => SeatNodeModel());
    seatNodeModel4 = createModel(context, () => SeatNodeModel());
    seatNodeModel5 = createModel(context, () => SeatNodeModel());
    seatNodeModel6 = createModel(context, () => SeatNodeModel());
    seatNodeModel7 = createModel(context, () => SeatNodeModel());
    seatNodeModel8 = createModel(context, () => SeatNodeModel());
    seatNodeModel9 = createModel(context, () => SeatNodeModel());
    seatNodeModel10 = createModel(context, () => SeatNodeModel());
    seatNodeModel11 = createModel(context, () => SeatNodeModel());
    seatNodeModel12 = createModel(context, () => SeatNodeModel());
    seatNodeModel13 = createModel(context, () => SeatNodeModel());
    seatNodeModel14 = createModel(context, () => SeatNodeModel());
    seatNodeModel15 = createModel(context, () => SeatNodeModel());
    seatNodeModel16 = createModel(context, () => SeatNodeModel());
    seatNodeModel17 = createModel(context, () => SeatNodeModel());
    seatNodeModel18 = createModel(context, () => SeatNodeModel());
    seatNodeModel19 = createModel(context, () => SeatNodeModel());
    seatNodeModel20 = createModel(context, () => SeatNodeModel());
    seatNodeModel21 = createModel(context, () => SeatNodeModel());
    seatNodeModel22 = createModel(context, () => SeatNodeModel());
    seatNodeModel23 = createModel(context, () => SeatNodeModel());
    seatNodeModel24 = createModel(context, () => SeatNodeModel());
    seatNodeModel25 = createModel(context, () => SeatNodeModel());
    seatNodeModel26 = createModel(context, () => SeatNodeModel());
    seatNodeModel27 = createModel(context, () => SeatNodeModel());
    seatNodeModel28 = createModel(context, () => SeatNodeModel());
    seatNodeModel29 = createModel(context, () => SeatNodeModel());
    seatNodeModel30 = createModel(context, () => SeatNodeModel());
    seatNodeModel31 = createModel(context, () => SeatNodeModel());
    seatNodeModel32 = createModel(context, () => SeatNodeModel());
    seatNodeModel33 = createModel(context, () => SeatNodeModel());
    seatNodeModel34 = createModel(context, () => SeatNodeModel());
    seatNodeModel35 = createModel(context, () => SeatNodeModel());
    seatNodeModel36 = createModel(context, () => SeatNodeModel());
    seatNodeModel37 = createModel(context, () => SeatNodeModel());
    seatNodeModel38 = createModel(context, () => SeatNodeModel());
    seatNodeModel39 = createModel(context, () => SeatNodeModel());
    seatNodeModel40 = createModel(context, () => SeatNodeModel());
    seatNodeModel41 = createModel(context, () => SeatNodeModel());
    sectionChipModel1 = createModel(context, () => SectionChipModel());
    sectionChipModel2 = createModel(context, () => SectionChipModel());
    sectionChipModel3 = createModel(context, () => SectionChipModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    for (final model in seatNodeModels) {
      model.dispose();
    }
    sectionChipModel1.dispose();
    sectionChipModel2.dispose();
    sectionChipModel3.dispose();
    buttonModel.dispose();
  }
}
