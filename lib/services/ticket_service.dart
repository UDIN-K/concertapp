import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import '../models/concert.dart';
import '../models/ticket.dart';

class TicketService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _uuid = const Uuid();

  CollectionReference get _ticketsRef => _firestore.collection('tickets');
  CollectionReference get _concertsRef => _firestore.collection('concerts');

  // Buy a ticket
  Future<Ticket?> buyTicket(Concert concert, String userId) async {
    // Use a transaction to ensure atomicity
    return _firestore.runTransaction<Ticket?>((transaction) async {
      // Check available tickets
      final concertDoc = await transaction.get(_concertsRef.doc(concert.id));
      final availableTickets = concertDoc['availableTickets'] as int;

      if (availableTickets <= 0) {
        throw Exception('Tiket sudah habis!');
      }

      // Generate ticket code
      final ticketCode = 'TKT-${_uuid.v4().substring(0, 8).toUpperCase()}';

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
    final snapshot = await _ticketsRef
        .where('userId', isEqualTo: userId)
        .orderBy('purchaseDate', descending: true)
        .get();
    return snapshot.docs.map((doc) => Ticket.fromFirestore(doc)).toList();
  }

  // Cancel a ticket
  Future<void> cancelTicket(String ticketId, String concertId) async {
    return _firestore.runTransaction((transaction) async {
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
    final snapshot = await _ticketsRef
        .where('userId', isEqualTo: userId)
        .where('status', isEqualTo: 'active')
        .get();
    return snapshot.docs.length;
  }

  // Get total spent by user
  Future<double> getTotalSpent(String userId) async {
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
