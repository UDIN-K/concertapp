import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app.dart';
import 'services/concert_service.dart';

/// Global flag to indicate whether Firebase initialized successfully.
/// Services can check this to fall back to local mock data.
bool isFirebaseAvailable = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Try to initialize Firebase, but don't crash if it fails
  // (e.g. when using placeholder API keys during development)
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    isFirebaseAvailable = true;
    debugPrint('✅ Firebase initialized successfully');

    // Seed the database with initial concert data if empty
    await ConcertService().seedDummyData();
  } catch (e) {
    isFirebaseAvailable = false;
    debugPrint('⚠️ Firebase initialization failed: $e');
    debugPrint('   Running in offline/demo mode with local data.');
  }

  runApp(const ConcertApp());
}
