import 'package:flutter/material.dart';

class ConcertDetailsPage extends StatefulWidget {
  const ConcertDetailsPage({super.key});
  @override
  State<ConcertDetailsPage> createState() => _ConcertDetailsPageState();
}

class _ConcertDetailsPageState extends State<ConcertDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('ConcertDetails')),
    );
  }
}
