import 'package:flutter/material.dart';

class MyTicketsPage extends StatefulWidget {
  const MyTicketsPage({super.key});
  @override
  State<MyTicketsPage> createState() => _MyTicketsPageState();
}

class _MyTicketsPageState extends State<MyTicketsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('MyTickets')),
    );
  }
}
