import '/components/concert_card_widget.dart';
import '/components/genre_chip_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

import 'search_explore_widget.dart' show SearchExploreWidget;

class SearchExploreModel extends FlutterFlowModel<SearchExploreWidget> {
  late TextFieldModel textFieldModel;
  late GenreChipModel genreChipModel1;
  late GenreChipModel genreChipModel2;
  late GenreChipModel genreChipModel3;
  late GenreChipModel genreChipModel4;
  late GenreChipModel genreChipModel5;
  late ConcertCardModel concertCardModel1;
  late ConcertCardModel concertCardModel2;
  late ConcertCardModel concertCardModel3;

  @override
  void initState(BuildContext context) {
    textFieldModel = createModel(context, () => TextFieldModel());
    genreChipModel1 = createModel(context, () => GenreChipModel());
    genreChipModel2 = createModel(context, () => GenreChipModel());
    genreChipModel3 = createModel(context, () => GenreChipModel());
    genreChipModel4 = createModel(context, () => GenreChipModel());
    genreChipModel5 = createModel(context, () => GenreChipModel());
    concertCardModel1 = createModel(context, () => ConcertCardModel());
    concertCardModel2 = createModel(context, () => ConcertCardModel());
    concertCardModel3 = createModel(context, () => ConcertCardModel());
  }

  @override
  void dispose() {
    textFieldModel.dispose();
    genreChipModel1.dispose();
    genreChipModel2.dispose();
    genreChipModel3.dispose();
    genreChipModel4.dispose();
    genreChipModel5.dispose();
    concertCardModel1.dispose();
    concertCardModel2.dispose();
    concertCardModel3.dispose();
  }
}
