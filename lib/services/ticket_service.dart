import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../models/concert.dart';
import '../models/ticket.dart';
import '../main.dart' show isFirebaseAvailable;

class TicketService {
  final _uuid = const Uuid();

  // Local mock tickets for offline/demo mode
  static final List<Ticket> _mockTickets = [];

  CollectionReference get _ticketsRef =>
      FirebaseFirestore.instance.collection('tickets');
  CollectionReference get _concertsRef =>
      FirebaseFirestore.instance.collection('concerts');

  // Buy a ticket
  Future<Ticket?> buyTicket(Concert concert, String userId) async {
    final ticketCode = 'TKT-${_uuid.v4().substring(0, 8).toUpperCase()}';

    if (!isFirebaseAvailable) {
      // Offline mock purchase
      final ticket = Ticket(
        id: 'mock-${_uuid.v4().substring(0, 8)}',
        concertId: concert.id,
        userId: userId,
        ticketCode: ticketCode,
        purchaseDate: DateTime.now(),
        status: 'active',
        concertName: concert.name,
        concertArtist: concert.artist,
        concertVenue: concert.venue,
        concertImageUrl: concert.imageUrl,
        concertDate: concert.date,
        price: concert.price,
      );
      _mockTickets.add(ticket);
      return ticket;
    }

    // Use a transaction to ensure atomicity
    return FirebaseFirestore.instance.runTransaction<Ticket?>((transaction) async {
      // Check available tickets
      final concertDoc = await transaction.get(_concertsRef.doc(concert.id));
      final availableTickets = concertDoc['availableTickets'] as int;

      if (availableTickets <= 0) {
        throw Exception('Tiket sudah habis!');
      }

      // Create ticket
      final ticketRef = _ticketsRef.doc();
      final ticket = Ticket(
        id: ticketRef.id,
        concertId: concert.id,
        userId: userId,
        ticketCode: ticketCode,
        purchaseDate: DateTime.now(),
        status: 'active',
        concertName: concert.name,
        concertArtist: concert.artist,
        concertVenue: concert.venue,
        concertImageUrl: concert.imageUrl,
        concertDate: concert.date,
        price: concert.price,
      );

      // Save ticket and update concert
      transaction.set(ticketRef, ticket.toMap());
      transaction.update(_concertsRef.doc(concert.id), {
        'availableTickets': availableTickets - 1,
      });

      return ticket;
    });
  }

  // Get tickets for a user
  Future<List<Ticket>> getMyTickets(String userId) async {
    if (!isFirebaseAvailable) {
      return _mockTickets.where((t) => t.userId == userId).toList();
    }
    final snapshot = await _ticketsRef
        .where('userId', isEqualTo: userId)
        .orderBy('purchaseDate', descending: true)
        .get();
    return snapshot.docs.map((doc) => Ticket.fromFirestore(doc)).toList();
  }

  // Cancel a ticket
  Future<void> cancelTicket(String ticketId, String concertId) async {
    if (!isFirebaseAvailable) {
      final idx = _mockTickets.indexWhere((t) => t.id == ticketId);
      if (idx >= 0) _mockTickets.removeAt(idx);
      return;
    }
    return FirebaseFirestore.instance.runTransaction((transaction) async {
      final ticketDoc = await transaction.get(_ticketsRef.doc(ticketId));
      if (!ticketDoc.exists) throw Exception('Tiket tidak ditemukan');

      final concertDoc = await transaction.get(_concertsRef.doc(concertId));
      final availableTickets = concertDoc['availableTickets'] as int;

      transaction.update(_ticketsRef.doc(ticketId), {'status': 'cancelled'});
      transaction.update(_concertsRef.doc(concertId), {
        'availableTickets': availableTickets + 1,
      });
    });
  }

  // Get ticket count for user
  Future<int> getTicketCount(String userId) async {
    if (!isFirebaseAvailable) {
      return _mockTickets
          .where((t) => t.userId == userId && t.status == 'active')
          .length;
    }
    final snapshot = await _ticketsRef
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'active')
        .get();
    return snapshot.docs.length;
  }

  // Get total spent by user
  Future<double> getTotalSpent(String userId) async {
    if (!isFirebaseAvailable) {
      double total = 0;
      for (final t in _mockTickets) {
        if (t.userId == userId &&
            (t.status == 'active' || t.status == 'used')) {
          total += t.price;
        }
      }
      return total;
    }
    final snapshot = await _ticketsRef
        .where('userId', isEqualTo: userId)
        .where('status', whereIn: ['active', 'used'])
        .get();
    double total = 0;
    for (final doc in snapshot.docs) {
      total += (doc['price'] ?? 0).toDouble();
    }
    return total;
  }
}
