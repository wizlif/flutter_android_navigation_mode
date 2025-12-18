// This is a basic Flutter widget test.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_android_navigation_mode_example/main.dart';

void main() {
  testWidgets('Verify Navigation Mode UI', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the navigation mode label is displayed.
    expect(find.text('Navigation Mode:'), findsOneWidget);
  });
}
