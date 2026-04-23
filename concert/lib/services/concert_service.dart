import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/concert.dart';

class ConcertService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _concertsRef => _firestore.collection('concerts');

  // Get all concerts
  Future<List<Concert>> getConcerts() async {
    final snapshot =
        await _concertsRef.orderBy('date', descending: false).get();
    return snapshot.docs.map((doc) => Concert.fromFirestore(doc)).toList();
  }

  // Get upcoming concerts
  Future<List<Concert>> getUpcomingConcerts() async {
    final snapshot = await _concertsRef
        .where('date', isGreaterThan: Timestamp.now())
        .orderBy('date')
        .get();
    return snapshot.docs.map((doc) => Concert.fromFirestore(doc)).toList();
  }

  // Get concerts by category
  Future<List<Concert>> getConcertsByCategory(String category) async {
    final snapshot = await _concertsRef
        .where('category', isEqualTo: category)
        .orderBy('date')
        .get();
    return snapshot.docs.map((doc) => Concert.fromFirestore(doc)).toList();
  }

  // Get concert by ID
  Future<Concert?> getConcertById(String id) async {
    final doc = await _concertsRef.doc(id).get();
    if (!doc.exists) return null;
    return Concert.fromFirestore(doc);
  }

  // Search concerts
  Future<List<Concert>> searchConcerts(String query) async {
    final allConcerts = await getConcerts();
    final lowerQuery = query.toLowerCase();
    return allConcerts.where((concert) {
      return concert.name.toLowerCase().contains(lowerQuery) ||
          concert.artist.toLowerCase().contains(lowerQuery) ||
          concert.venue.toLowerCase().contains(lowerQuery);
    }).toList();
  }

  // Seed dummy data if collection is empty
  Future<void> seedDummyData() async {
    final snapshot = await _concertsRef.limit(1).get();
    if (snapshot.docs.isNotEmpty) return;

    final dummyConcerts = [
      Concert(
        id: '',
        name: 'Coldplay: Music of the Spheres',
        artist: 'Coldplay',
        venue: 'Gelora Bung Karno Stadium, Jakarta',
        description:
            'Experience the magic of Coldplay live! The Music of the Spheres World Tour brings you an unforgettable night filled with dazzling lights, iconic hits, and an eco-friendly concert experience like no other.',
        imageUrl: 'https://images.unsplash.com/photo-1540039155733-5bb30b53aa14?w=800',
        date: DateTime.now().add(const Duration(days: 30)),
        price: 1500000,
        availableTickets: 150,
        totalTickets: 200,
        category: 'Pop',
      ),
      Concert(
        id: '',
        name: 'Ed Sheeran: Mathematics Tour',
        artist: 'Ed Sheeran',
        venue: 'Jakarta International Stadium',
        description:
            'Ed Sheeran brings his Mathematics Tour to Jakarta! Enjoy an intimate yet grand performance featuring his greatest hits from +, ×, ÷, =, and - albums.',
        imageUrl: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=800',
        date: DateTime.now().add(const Duration(days: 45)),
        price: 1200000,
        availableTickets: 200,
        totalTickets: 250,
        category: 'Pop',
      ),
      Concert(
        id: '',
        name: 'Metallica: M72 World Tour',
        artist: 'Metallica',
        venue: 'Stadion Madya Senayan, Jakarta',
        description:
            'The kings of metal are back! Metallica brings their legendary M72 World Tour. Prepare for an explosive night of thrashing riffs and timeless anthems.',
        imageUrl: 'https://images.unsplash.com/photo-1598387993281-cecf8b71a8f8?w=800',
        date: DateTime.now().add(const Duration(days: 60)),
        price: 2000000,
        availableTickets: 80,
        totalTickets: 100,
        category: 'Rock',
      ),
      Concert(
        id: '',
        name: 'BLACKPINK: Born Pink Encore',
        artist: 'BLACKPINK',
        venue: 'Indonesia Convention Exhibition, BSD',
        description:
            'BLACKPINK is back with the Born Pink Encore! Watch Jisoo, Jennie, Rosé, and Lisa perform their biggest hits in a spectacular stage production.',
        imageUrl: 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?w=800',
        date: DateTime.now().add(const Duration(days: 20)),
        price: 2500000,
        availableTickets: 50,
        totalTickets: 300,
        category: 'K-Pop',
      ),
      Concert(
        id: '',
        name: 'Java Jazz Festival 2026',
        artist: 'Various Artists',
        venue: 'JIExpo Kemayoran, Jakarta',
        description:
            'Southeast Asia\'s largest jazz festival returns! Featuring international and local jazz legends across multiple stages over three unforgettable days.',
        imageUrl: 'https://images.unsplash.com/photo-1511192336575-5a79af67a629?w=800',
        date: DateTime.now().add(const Duration(days: 15)),
        price: 800000,
        availableTickets: 500,
        totalTickets: 500,
        category: 'Jazz',
      ),
      Concert(
        id: '',
        name: 'DWP X: Djakarta Warehouse Project',
        artist: 'Various DJs',
        venue: 'GWK Cultural Park, Bali',
        description:
            'Asia\'s biggest electronic dance music festival! Three days of non-stop beats from world-class DJs in the stunning setting of GWK Cultural Park.',
        imageUrl: 'https://images.unsplash.com/photo-1574391884720-bbc3740c59d1?w=800',
        date: DateTime.now().add(const Duration(days: 90)),
        price: 3500000,
        availableTickets: 1000,
        totalTickets: 1000,
        category: 'EDM',
      ),
      Concert(
        id: '',
        name: 'Tulus: Manusia Tour',
        artist: 'Tulus',
        venue: 'Istora Senayan, Jakarta',
        description:
            'Tulus mengajak Anda dalam perjalanan musikal penuh emosi. Nikmati lagu-lagu terbaik dari album Manusia dan album sebelumnya dalam konser spektakuler.',
        imageUrl: 'https://images.unsplash.com/photo-1501386761578-eac5c94b800a?w=800',
        date: DateTime.now().add(const Duration(days: 10)),
        price: 600000,
        availableTickets: 300,
        totalTickets: 350,
        category: 'Pop',
      ),
      Concert(
        id: '',
        name: 'Guns N\' Roses: Asia Tour',
        artist: 'Guns N\' Roses',
        venue: 'Gelora Bung Karno Stadium, Jakarta',
        description:
            'The most dangerous band in the world returns to Jakarta! Axl Rose, Slash, and Duff McKagan bring their legendary rock anthems to GBK Stadium.',
        imageUrl: 'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?w=800',
        date: DateTime.now().add(const Duration(days: 75)),
        price: 1800000,
        availableTickets: 120,
        totalTickets: 150,
        category: 'Rock',
      ),
    ];

    final batch = _firestore.batch();
    for (final concert in dummyConcerts) {
      final docRef = _concertsRef.doc();
      batch.set(docRef, concert.toMap());
    }
    await batch.commit();
  }
}
