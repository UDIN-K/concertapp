import '/components/artist_chip_widget.dart';
import '/components/button_widget.dart';
import '/components/info_tag_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'package:flutter/material.dart';

import 'concert_details_widget.dart' show ConcertDetailsWidget;

class ConcertDetailsModel extends FlutterFlowModel<ConcertDetailsWidget> {
  // Model for InfoTag.
  late InfoTagModel infoTagModel1;
  // Model for InfoTag.
  late InfoTagModel infoTagModel2;
  // Model for InfoTag.
  late InfoTagModel infoTagModel3;
  // Model for ArtistChip.
  late ArtistChipModel artistChipModel1;
  // Model for ArtistChip.
  late ArtistChipModel artistChipModel2;
  // Model for ArtistChip.
  late ArtistChipModel artistChipModel3;
  // Model for ArtistChip.
  late ArtistChipModel artistChipModel4;
  // State field(s) for map.
  Completer<GoogleMapController>? mapGoogleMapsController;
  LatLng? mapGoogleMapsCenter;
  // Model for Button.
  late ButtonModel buttonModel;

  @override
  void initState(BuildContext context) {
    infoTagModel1 = createModel(context, () => InfoTagModel());
    infoTagModel2 = createModel(context, () => InfoTagModel());
    infoTagModel3 = createModel(context, () => InfoTagModel());
    artistChipModel1 = createModel(context, () => ArtistChipModel());
    artistChipModel2 = createModel(context, () => ArtistChipModel());
    artistChipModel3 = createModel(context, () => ArtistChipModel());
    artistChipModel4 = createModel(context, () => ArtistChipModel());
    buttonModel = createModel(context, () => ButtonModel());
  }

  @override
  void dispose() {
    infoTagModel1.dispose();
    infoTagModel2.dispose();
    infoTagModel3.dispose();
    artistChipModel1.dispose();
    artistChipModel2.dispose();
    artistChipModel3.dispose();
    artistChipModel4.dispose();
    buttonModel.dispose();
  }
}
