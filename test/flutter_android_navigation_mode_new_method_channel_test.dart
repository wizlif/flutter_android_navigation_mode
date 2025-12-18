import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode_new_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterAndroidNavigationModeNew platform = MethodChannelFlutterAndroidNavigationModeNew();
  const MethodChannel channel = MethodChannel('flutter_android_navigation_mode_new');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 0; // Return three-button navigation mode
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getNavigationMode', () async {
    expect(await platform.getNavigationMode(), 0);
  });
}
