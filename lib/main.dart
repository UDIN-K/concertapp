import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'services/concert_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  debugPrint('✅ Firebase initialized successfully');

  // Keep startup resilient when Firestore rules block writes in web/dev.
  try {
    await ConcertService().seedDummyData();
  } on FirebaseException catch (e) {
    if (e.code == 'permission-denied') {
      debugPrint(
        '⚠️ Firestore write denied by security rules. Skipping seed data.',
      );
    } else {
      debugPrint('⚠️ Firestore setup warning [${e.code}]: ${e.message}');
    }
  } catch (e) {
    debugPrint('⚠️ Unexpected startup warning while seeding data: $e');
  }

  runApp(const ConcertApp());
}
