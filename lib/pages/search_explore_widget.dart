import '/components/concert_card_widget.dart';
import '/components/genre_chip_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class SearchExploreWidget extends StatefulWidget {
  const SearchExploreWidget({super.key});

  @override
  State<SearchExploreWidget> createState() => _SearchExploreWidgetState();
}

class _SearchExploreWidgetState extends State<SearchExploreWidget> {
  late SearchExploreModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchExploreModel());
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
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Explore', style: theme.headlineLarge),
                  const SizedBox(height: 16),
                  const TextFieldWidget(
                    hint: 'Search events...',
                    variant: 'filled',
                    leading_icon_present: true,
                    leading_icon: Icon(Icons.search_rounded, size: 20),
                  ),
                ],
              ),
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  GenreChipWidget(label: 'All', selected: true),
                  SizedBox(width: 8),
                  GenreChipWidget(label: 'Pop'),
                  SizedBox(width: 8),
                  GenreChipWidget(label: 'Rock'),
                  SizedBox(width: 8),
                  GenreChipWidget(label: 'Jazz'),
                  SizedBox(width: 8),
                  GenreChipWidget(label: 'Electronic'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(24),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75,
                children: const [
                  ConcertCardWidget(
                    title: 'Lauv Concert',
                    location: 'Beach City',
                    price: 'Rp 1.2jt',
                    img_url: 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800',
                  ),
                  ConcertCardWidget(
                    title: 'Bruno Mars',
                    location: 'JIS Jakarta',
                    price: 'Rp 2.5jt',
                    img_url: 'https://images.unsplash.com/photo-1514525253361-bee8d48700ef?w=800',
                  ),
                  ConcertCardWidget(
                    title: 'NIKI: Buzz',
                    location: 'Ancol',
                    price: 'Rp 1.5jt',
                    img_url: 'https://images.unsplash.com/photo-1598387993281-cecf8b71a8f8?w=800',
                  ),
                  ConcertCardWidget(
                    title: 'Keshi Tour',
                    location: 'Istora',
                    price: 'Rp 1.1jt',
                    img_url: 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=800',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchExploreModel extends FlutterFlowModel<SearchExploreWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
