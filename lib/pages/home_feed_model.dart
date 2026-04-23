import '/components/category_chip_widget.dart';
import '/components/event_item_widget.dart';
import '/components/featured_card_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'home_feed_widget.dart' show HomeFeedWidget;

class HomeFeedModel extends FlutterFlowModel<HomeFeedWidget> {
  // Model for TextField.
  late TextFieldModel textFieldModel;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel1;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel2;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel3;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel4;
  // Model for CategoryChip.
  late CategoryChipModel categoryChipModel5;
  // Model for FeaturedCard.
  late FeaturedCardModel featuredCardModel1;
  // Model for FeaturedCard.
  late FeaturedCardModel featuredCardModel2;
  // Model for FeaturedCard.
  late FeaturedCardModel featuredCardModel3;
  // Model for EventItem.
  late EventItemModel eventItemModel1;
  // Model for EventItem.
  late EventItemModel eventItemModel2;
  // Model for EventItem.
  late EventItemModel eventItemModel3;
  // Model for EventItem.
  late EventItemModel eventItemModel4;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    categoryChipModel1 = createModel(context, () => CategoryChipModel());
    categoryChipModel2 = createModel(context, () => CategoryChipModel());
    categoryChipModel3 = createModel(context, () => CategoryChipModel());
    categoryChipModel4 = createModel(context, () => CategoryChipModel());
    categoryChipModel5 = createModel(context, () => CategoryChipModel());
    featuredCardModel1 = createModel(context, () => FeaturedCardModel());
    featuredCardModel2 = createModel(context, () => FeaturedCardModel());
    featuredCardModel3 = createModel(context, () => FeaturedCardModel());
    eventItemModel1 = createModel(context, () => EventItemModel());
    eventItemModel2 = createModel(context, () => EventItemModel());
    eventItemModel3 = createModel(context, () => EventItemModel());
    eventItemModel4 = createModel(context, () => EventItemModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    categoryChipModel1.dispose();
    categoryChipModel2.dispose();
    categoryChipModel3.dispose();
    categoryChipModel4.dispose();
    categoryChipModel5.dispose();
    featuredCardModel1.dispose();
    featuredCardModel2.dispose();
    featuredCardModel3.dispose();
    eventItemModel1.dispose();
    eventItemModel2.dispose();
    eventItemModel3.dispose();
    eventItemModel4.dispose();
  }
}
