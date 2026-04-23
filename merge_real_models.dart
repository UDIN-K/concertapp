import 'dart:io';

void main() async {
  final dir = Directory('lib/pages');
  final pairs = [
    ('Checkout.dart', 'checkout_widget.dart', 'CheckoutModel'),
    ('ConcertDetails.dart', 'concert_details_widget.dart', 'ConcertDetailsModel'),
    ('LoginSignup.dart', 'login_signup_widget.dart', 'LoginSignupModel'),
    ('MyTickets.dart', 'my_tickets_widget.dart', 'MyTicketsModel'),
    ('SearchExplore.dart', 'search_explore_widget.dart', 'SearchExploreModel'),
    ('SeatSelection.dart', 'seat_selection_widget.dart', 'SeatSelectionModel'),
    ('UseProfile.dart', 'user_profile_widget.dart', 'UserProfileModel'),
    ('HomePage.dart', 'home_page_widget.dart', 'HomePageModel'), // Not sure if HomePage has a model, but let's check
  ];

  for (final pair in pairs) {
    final modelFile = File('${dir.path}/${pair.$1}');
    final widgetFile = File('${dir.path}/${pair.$2}');

    if (!await modelFile.exists() || !await widgetFile.exists()) {
      continue;
    }

    String modelContent = await modelFile.readAsString();
    String widgetContent = await widgetFile.readAsString();

    // Extract the model class from the model file
    final classMatch = RegExp('class ${pair.$3} extends FlutterFlowModel.*?{.*', dotAll: true).firstMatch(modelContent);
    if (classMatch == null) {
      print('Could not find model class in ${pair.$1}');
      await modelFile.delete();
      continue;
    }
    
    final fullModelClassStr = classMatch.group(0)!;

    // Remove the old empty model class from the widget file
    widgetContent = widgetContent.replaceFirst(RegExp(r'class ${pair.$3} extends FlutterFlowModel.*?{.*?}', dotAll: true), '');
    
    // Append the full model class to the widget file
    widgetContent = '$widgetContent\n\n$fullModelClassStr';
    
    await widgetFile.writeAsString(widgetContent);
    await modelFile.delete();
    print('Merged full model from ${pair.$1} into ${pair.$2} and deleted ${pair.$1}');
  }
}
