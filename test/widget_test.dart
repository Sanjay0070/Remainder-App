import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Test ReminderApp widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: ReminderApp(),
    ));

    // Find dropdown button for selecting day
    expect(find.byType(DropdownButtonFormField), findsNWidgets(2)); // Expecting two dropdowns in your ReminderApp widget

    // Find text widget displaying selected time
    expect(find.text('Selected Time: '), findsOneWidget);

    // Find dropdown button for selecting activity
    expect(find.byType(DropdownButtonFormField), findsNWidgets(2)); // Expecting two dropdowns in your ReminderApp widget

    // Find button for setting reminder
    expect(find.byType(ElevatedButton), findsOneWidget); // Expecting one ElevatedButton in your ReminderApp widget
  });
}
