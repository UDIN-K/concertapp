import '/components/artist_chip2_widget.dart';
import '/components/button_widget.dart';
import '/components/menu_item_widget.dart';
import '/components/profile_stat_widget.dart';
import '/components/ticket_card2_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'user_profile_widget.dart' show UserProfileWidget;

class UserProfileModel extends FlutterFlowModel<UserProfileWidget> {
  late ProfileStatModel profileStatModel1;
  late ProfileStatModel profileStatModel2;
  late ProfileStatModel profileStatModel3;
  late TicketCard2Model ticketCard2Model1;
  late TicketCard2Model ticketCard2Model2;
  late ArtistChip2Model artistChip2Model1;
  late ArtistChip2Model artistChip2Model2;
  late ArtistChip2Model artistChip2Model3;
  late ArtistChip2Model artistChip2Model4;
  late ArtistChip2Model artistChip2Model5;
  late MenuItemModel menuItemModel1;
  late MenuItemModel menuItemModel2;
  late MenuItemModel menuItemModel3;
  late MenuItemModel menuItemModel4;
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    profileStatModel1 = createModel(context, () => ProfileStatModel());
    profileStatModel2 = createModel(context, () => ProfileStatModel());
    profileStatModel3 = createModel(context, () => ProfileStatModel());
    ticketCard2Model1 = createModel(context, () => TicketCard2Model());
    ticketCard2Model2 = createModel(context, () => TicketCard2Model());
    artistChip2Model1 = createModel(context, () => ArtistChip2Model());
    artistChip2Model2 = createModel(context, () => ArtistChip2Model());
    artistChip2Model3 = createModel(context, () => ArtistChip2Model());
    artistChip2Model4 = createModel(context, () => ArtistChip2Model());
    artistChip2Model5 = createModel(context, () => ArtistChip2Model());
    menuItemModel1 = createModel(context, () => MenuItemModel());
    menuItemModel2 = createModel(context, () => MenuItemModel());
    menuItemModel3 = createModel(context, () => MenuItemModel());
    menuItemModel4 = createModel(context, () => MenuItemModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    profileStatModel1.dispose();
    profileStatModel2.dispose();
    profileStatModel3.dispose();
    ticketCard2Model1.dispose();
    ticketCard2Model2.dispose();
    artistChip2Model1.dispose();
    artistChip2Model2.dispose();
    artistChip2Model3.dispose();
    artistChip2Model4.dispose();
    artistChip2Model5.dispose();
    menuItemModel1.dispose();
    menuItemModel2.dispose();
    menuItemModel3.dispose();
    menuItemModel4.dispose();
    buttonModel.dispose();
  }
}
