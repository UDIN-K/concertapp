import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/splash_screen_widget.dart';
import 'pages/home_page.dart';
import 'pages/onboarding_widget.dart';
import 'pages/home_feed_widget.dart';
import 'pages/concert_details_widget.dart';
import 'pages/seat_selection_widget.dart';
import 'pages/checkout_widget.dart';
import 'pages/my_tickets_widget.dart';
import 'pages/search_explore_widget.dart';
import 'pages/user_profile_widget.dart';
import 'pages/login_signup_widget.dart';

class ConcertApp extends StatelessWidget {
  const ConcertApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = FirebaseAuth.instance.currentUser != null;

    return MaterialApp(
      title: 'ConcertTix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0A0F),
        canvasColor: const Color(0xFF0A0A0F),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: '/splash',
      routes: {
        '/': (context) => const SplashScreenWidget(),
        '/splash': (context) => const SplashScreenWidget(),
        '/home': (context) => const HomePage(),
        '/onboarding': (context) => const OnboardingWidget(),
        '/homeFeed': (context) => const HomeFeedWidget(),
        '/concertDetails': (context) => const ConcertDetailsWidget(),
        '/seatSelection': (context) => const SeatSelectionWidget(),
        '/checkout': (context) => const CheckoutWidget(),
        '/myTickets': (context) => const MyTicketsWidget(),
        '/searchExplore': (context) => const SearchExploreWidget(),
        '/userProfile': (context) => const UserProfileWidget(),
        '/loginSignup': (context) => const LoginSignupWidget(),
      },
    );
  }
}
