import 'dart:io';

void main() async {
  final dir = Directory('lib/pages');
  final pairs = [
    ('Checkout.dart', 'checkout_widget.dart'),
    ('ConcertDetails.dart', 'concert_details_widget.dart'),
    ('HomeFeed.dart', 'home_feed_widget.dart'),
    ('LoginSignup.dart', 'login_signup_widget.dart'),
    ('MyTickets.dart', 'my_tickets_widget.dart'),
    ('Onboarding.dart', 'onboarding_widget.dart'),
    ('SearchExplore.dart', 'search_explore_widget.dart'),
    ('SeatSelection.dart', 'seat_selection_widget.dart'),
    ('UseProfile.dart', 'user_profile_widget.dart'),
  ];

  for (final pair in pairs) {
    final modelFile = File('${dir.path}/${pair.$1}');
    final widgetFile = File('${dir.path}/${pair.$2}');

    if (!await modelFile.exists() || !await widgetFile.exists()) {
      print('Skipping ${pair.$1} - files not found');
      continue;
    }

    String modelContent = await modelFile.readAsString();
    String widgetContent = await widgetFile.readAsString();

    // Extract just the class definition from the model file
    final classMatch = RegExp(r'class [A-Za-z0-9_]+Model extends FlutterFlowModel.*?{.*', dotAll: true).firstMatch(modelContent);
    if (classMatch == null) {
      print('Could not find model class in ${pair.$1}');
      continue;
    }
    
    final modelClassStr = classMatch.group(0)!;

    // Remove the import of the model file from the widget file
    widgetContent = widgetContent.replaceAll("import '${pair.$1}';\n", '');

    // Append the model class to the end of the widget file
    final newWidgetContent = '$widgetContent\n\n$modelClassStr';
    
    await widgetFile.writeAsString(newWidgetContent);
    await modelFile.delete();
    print('Merged ${pair.$1} into ${pair.$2} and deleted ${pair.$1}');
  }
}
