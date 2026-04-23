import '/components/category_chip_widget.dart';
import '/components/event_item_widget.dart';
import '/components/featured_card_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class HomeFeedWidget extends StatefulWidget {
  const HomeFeedWidget({super.key});

  @override
  State<HomeFeedWidget> createState() => _HomeFeedWidgetState();
}

class _HomeFeedWidgetState extends State<HomeFeedWidget> {
  late HomeFeedModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeFeedModel());
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back,', style: theme.bodyMedium),
                        Text('Alex Rivera', style: theme.headlineLarge),
                      ],
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.secondaryBackground,
                        shape: BoxShape.circle,
                        border: Border.all(color: theme.alternate),
                      ),
                      child: Icon(Icons.notifications_none_rounded, color: theme.primaryText),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFieldWidget(
                  hint: 'Search concerts, artists...',
                  variant: 'filled',
                  leading_icon_present: true,
                  leading_icon: Icon(Icons.search_rounded, color: theme.secondaryText, size: 20),
                ),
              ),
              const SizedBox(height: 24),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    const CategoryChipWidget(icon: Icon(Icons.apps_rounded, size: 16, color: Colors.white), label: 'All', selected: true),
                    const SizedBox(width: 12),
                    CategoryChipWidget(icon: Icon(Icons.music_note_rounded, size: 16, color: theme.primary), label: 'Pop'),
                    const SizedBox(width: 12),
                    CategoryChipWidget(icon: Icon(Icons.flash_on_rounded, size: 16, color: theme.primary), label: 'Rock'),
                    const SizedBox(width: 12),
                    CategoryChipWidget(icon: Icon(Icons.nightlife_rounded, size: 16, color: theme.primary), label: 'EDM'),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured Events', style: theme.titleLarge),
                    Text('See All', style: theme.bodyMedium.override(color: theme.primary, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    FeaturedCardWidget(
                      title: 'Coldplay: Music of the Spheres',
                      date: 'Nov 15, 2026 • GBK Stadium',
                      tag: 'BEST SELLER',
                      img_desc: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
                    ),
                    SizedBox(width: 16),
                    FeaturedCardWidget(
                      title: 'The Weeknd: After Hours',
                      date: 'Dec 02, 2026 • JIS Jakarta',
                      tag: 'TRENDING',
                      img_desc: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text('Upcoming Near You', style: theme.titleLarge),
              ),
              const SizedBox(height: 16),
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  const EventItemWidget(
                    title: 'Lauv: Between Albums',
                    location: 'Beach City Stadium',
                    price: 'Rp 1.200.000',
                    img_desc: 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800',
                  ),
                  const SizedBox(height: 12),
                  const EventItemWidget(
                    title: 'Bruno Mars Live',
                    location: 'Jakarta Intl Stadium',
                    price: 'Rp 2.500.000',
                    img_desc: 'https://images.unsplash.com/photo-1514525253361-bee8d48700ef?w=800',
                  ),
                ].divide(const SizedBox(height: 12)),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}


class HomeFeedModel extends FlutterFlowModel<HomeFeedWidget> {
  ///  State fields for stateful widgets in this page.

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
