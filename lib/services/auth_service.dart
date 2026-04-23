import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../models/app_user.dart';
import '../main.dart' show isFirebaseAvailable;

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Demo user for offline mode
  static const _demoUser = AppUser(
    uid: 'demo-user-001',
    displayName: 'Demo User',
    email: 'demo@concerttix.app',
    photoUrl: '',
  );

  // Current user stream
  Stream<User?> get authStateChanges {
    if (!isFirebaseAvailable) return Stream.value(null);
    return FirebaseAuth.instance.authStateChanges();
  }

  // Get current user
  User? get currentUser {
    if (!isFirebaseAvailable) return null;
    return FirebaseAuth.instance.currentUser;
  }

  // Get current AppUser
  AppUser? get currentAppUser {
    if (!isFirebaseAvailable) return _demoUser;
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    return AppUser(
      uid: user.uid,
      displayName: user.displayName ?? 'User',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
    );
  }

  // Check if user is logged in (or in demo mode)
  bool get isLoggedIn {
    if (!isFirebaseAvailable) return true; // Always "logged in" in demo mode
    return FirebaseAuth.instance.currentUser != null;
  }

  // Sign in with Email and Password
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    if (!isFirebaseAvailable) return null; // Demo mode
    return await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  // Sign up with Email and Password
  Future<UserCredential?> signUpWithEmailAndPassword(String email, String password) async {
    if (!isFirebaseAvailable) return null; // Demo mode
    return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  }

  // Sign in with Google
  Future<UserCredential?> signInWithGoogle() async {
    if (!isFirebaseAvailable) return null; // Demo mode
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return null;
      
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  // Sign out
  Future<void> signOut() async {
    if (!isFirebaseAvailable) return; // Demo mode
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
