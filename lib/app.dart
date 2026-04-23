import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      initialRoute: isLoggedIn ? '/home' : '/onboarding',
      routes: {
        '/': (context) => const HomePage(),
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
