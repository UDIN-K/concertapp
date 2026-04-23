import 'package:flutter/material.dart';

class SearchExplorePage extends StatefulWidget {
  const SearchExplorePage({super.key});
  @override
  State<SearchExplorePage> createState() => _SearchExplorePageState();
}

class _SearchExplorePageState extends State<SearchExplorePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SearchExplore')),
    );
  }
}
