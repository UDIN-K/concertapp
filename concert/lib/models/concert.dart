import 'package:cloud_firestore/cloud_firestore.dart';

class Concert {
  final String id;
  final String name;
  final String artist;
  final String venue;
  final String description;
  final String imageUrl;
  final DateTime date;
  final double price;
  final int availableTickets;
  final int totalTickets;
  final String category;

  Concert({
    required this.id,
    required this.name,
    required this.artist,
    required this.venue,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.price,
    required this.availableTickets,
    required this.totalTickets,
    required this.category,
  });

  factory Concert.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Concert(
      id: doc.id,
      name: data['name'] ?? '',
      artist: data['artist'] ?? '',
      venue: data['venue'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      date: (data['date'] as Timestamp).toDate(),
      price: (data['price'] ?? 0).toDouble(),
      availableTickets: data['availableTickets'] ?? 0,
      totalTickets: data['totalTickets'] ?? 0,
      category: data['category'] ?? 'Other',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'artist': artist,
      'venue': venue,
      'description': description,
      'imageUrl': imageUrl,
      'date': Timestamp.fromDate(date),
      'price': price,
      'availableTickets': availableTickets,
      'totalTickets': totalTickets,
      'category': category,
    };
  }

  bool get isSoldOut => availableTickets <= 0;

  bool get isUpcoming => date.isAfter(DateTime.now());
}
