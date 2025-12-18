// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode_new.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getNavigationMode test', (WidgetTester tester) async {
    final DeviceNavigationMode mode = await AndroidNavigationMode.getNavigationMode;
    // The navigation mode should be one of the valid enum values
    expect(DeviceNavigationMode.values.contains(mode), true);
  });
}
