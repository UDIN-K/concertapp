import 'dart:io';

void main() async {
  final dir = Directory('lib/pages');
  final pairs = [
    ('Checkout.dart', 'checkout_widget.dart', 'CheckoutModel', 'CheckoutWidget'),
    ('ConcertDetails.dart', 'concert_details_widget.dart', 'ConcertDetailsModel', 'ConcertDetailsWidget'),
    ('LoginSignup.dart', 'login_signup_widget.dart', 'LoginSignupModel', 'LoginSignupWidget'),
    ('MyTickets.dart', 'my_tickets_widget.dart', 'MyTicketsModel', 'MyTicketsWidget'),
    ('SearchExplore.dart', 'search_explore_widget.dart', 'SearchExploreModel', 'SearchExploreWidget'),
    ('SeatSelection.dart', 'seat_selection_widget.dart', 'SeatSelectionModel', 'SeatSelectionWidget'),
    ('UseProfile.dart', 'user_profile_widget.dart', 'UserProfileModel', 'UserProfileWidget'),
  ];

  for (final pair in pairs) {
    final modelFile = File('${dir.path}/${pair.$1}');
    final widgetFile = File('${dir.path}/${pair.$2}');

    if (await widgetFile.exists()) {
      String widgetContent = await widgetFile.readAsString();

      // Remove the import of the old file
      widgetContent = widgetContent.replaceAll("import '${pair.$1}';\n", '');

      // Create an empty model if it doesn't exist
      if (!widgetContent.contains('class ${pair.$3}')) {
        final emptyModel = '''
class ${pair.$3} extends FlutterFlowModel<${pair.$4}> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
''';
        widgetContent = '$widgetContent\n\n$emptyModel';
      }
      
      await widgetFile.writeAsString(widgetContent);
      print('Updated ${pair.$2} with model ${pair.$3}');
    }

    if (await modelFile.exists()) {
      await modelFile.delete();
      print('Deleted ${pair.$1}');
    }
  }
}
