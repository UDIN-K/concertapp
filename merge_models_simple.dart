import 'dart:io';

void main() async {
  final dir = Directory('lib/pages');
  final pairs = [
    ('Checkout.dart', 'checkout_widget.dart', 'CheckoutModel'),
    ('ConcertDetails.dart', 'concert_details_widget.dart', 'ConcertDetailsModel'),
    ('HomeFeed.dart', 'home_feed_widget.dart', 'HomeFeedModel'),
    ('LoginSignup.dart', 'login_signup_widget.dart', 'LoginSignupModel'),
    ('MyTickets.dart', 'my_tickets_widget.dart', 'MyTicketsModel'),
    ('Onboarding.dart', 'onboarding_widget.dart', 'OnboardingModel'),
    ('SearchExplore.dart', 'search_explore_widget.dart', 'SearchExploreModel'),
    ('SeatSelection.dart', 'seat_selection_widget.dart', 'SeatSelectionModel'),
    ('UseProfile.dart', 'user_profile_widget.dart', 'UserProfileModel'),
  ];

  for (final pair in pairs) {
    final modelFile = File('${dir.path}/${pair.$1}');
    final widgetFile = File('${dir.path}/${pair.$2}');

    if (!await modelFile.exists() || !await widgetFile.exists()) continue;

    String modelContent = await modelFile.readAsString();
    String widgetContent = await widgetFile.readAsString();

    int classIdx = modelContent.indexOf('class ${pair.$3}');
    if (classIdx == -1) {
      print('Could not find ${pair.$3} in ${pair.$1}');
      continue;
    }
    
    String fullModelClassStr = modelContent.substring(classIdx);

    // Remove old model from widget
    int oldIdx = widgetContent.indexOf('class ${pair.$3}');
    if (oldIdx != -1) {
      widgetContent = widgetContent.substring(0, oldIdx);
    }
    
    // Add import for dart:async if ConcertDetailsModel
    if (pair.$3 == 'ConcertDetailsModel' && !widgetContent.contains('dart:async')) {
      widgetContent = "import 'dart:async';\n$widgetContent";
    }

    widgetContent = '$widgetContent\n\n$fullModelClassStr';
    
    await widgetFile.writeAsString(widgetContent);
    await modelFile.delete();
    print('Merged ${pair.$1}');
  }
}
