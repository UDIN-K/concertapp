import 'package:flutter/material.dart';

class SeatSelectionPage extends StatefulWidget {
  const SeatSelectionPage({super.key});
  @override
  State<SeatSelectionPage> createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('SeatSelection')),
    );
  }
}
