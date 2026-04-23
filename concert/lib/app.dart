import 'package:flutter/material.dart';
import 'config/theme.dart';
import 'pages/home_page.dart';
import 'pages/onboarding.dart';
import 'pages/home_feed.dart';
import 'pages/concert_details.dart';
import 'pages/seat_selection.dart';
import 'pages/checkout.dart';
import 'pages/my_tickets.dart';
import 'pages/search_explore.dart';
import 'pages/user_profile.dart';
import 'pages/login_signup.dart';

class ConcertApp extends StatelessWidget {
  const ConcertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ConcertTix',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: '/onboarding',
      routes: {
        '/': (context) => const HomePage(),
        '/home': (context) => const HomePage(),
        '/onboarding': (context) => const OnboardingPage(),
        '/homeFeed': (context) => const HomeFeedPage(),
        '/concertDetails': (context) => const ConcertDetailsPage(),
        '/seatSelection': (context) => const SeatSelectionPage(),
        '/checkout': (context) => const CheckoutPage(),
        '/myTickets': (context) => const MyTicketsPage(),
        '/searchExplore': (context) => const SearchExplorePage(),
        '/userProfile': (context) => const UserProfilePage(),
        '/loginSignup': (context) => const LoginSignupPage(),
      },
    );
  }
}
