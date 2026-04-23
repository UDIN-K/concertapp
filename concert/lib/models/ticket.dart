import 'package:cloud_firestore/cloud_firestore.dart';

class Ticket {
  final String id;
  final String concertId;
  final String userId;
  final String ticketCode;
  final DateTime purchaseDate;
  final String status; // 'active', 'used', 'cancelled'
  final String concertName;
  final String concertArtist;
  final String concertVenue;
  final String concertImageUrl;
  final DateTime concertDate;
  final double price;

  Ticket({
    required this.id,
    required this.concertId,
    required this.userId,
    required this.ticketCode,
    required this.purchaseDate,
    required this.status,
    required this.concertName,
    required this.concertArtist,
    required this.concertVenue,
    required this.concertImageUrl,
    required this.concertDate,
    required this.price,
  });

  factory Ticket.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Ticket(
      id: doc.id,
      concertId: data['concertId'] ?? '',
      userId: data['userId'] ?? '',
      ticketCode: data['ticketCode'] ?? '',
      purchaseDate: (data['purchaseDate'] as Timestamp).toDate(),
      status: data['status'] ?? 'active',
      concertName: data['concertName'] ?? '',
      concertArtist: data['concertArtist'] ?? '',
      concertVenue: data['concertVenue'] ?? '',
      concertImageUrl: data['concertImageUrl'] ?? '',
      concertDate: (data['concertDate'] as Timestamp).toDate(),
      price: (data['price'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'concertId': concertId,
      'userId': userId,
      'ticketCode': ticketCode,
      'purchaseDate': Timestamp.fromDate(purchaseDate),
      'status': status,
      'concertName': concertName,
      'concertArtist': concertArtist,
      'concertVenue': concertVenue,
      'concertImageUrl': concertImageUrl,
      'concertDate': Timestamp.fromDate(concertDate),
      'price': price,
    };
  }

  bool get isActive => status == 'active';
  bool get isUsed => status == 'used';
  bool get isCancelled => status == 'cancelled';
}
