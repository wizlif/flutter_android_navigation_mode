import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode_platform_interface.dart';
import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAndroidNavigationModePlatform
    with MockPlatformInterfaceMixin
    implements FlutterAndroidNavigationModePlatform {

  @override
  Future<int> getNavigationMode() => Future.value(0);
}

void main() {
  final FlutterAndroidNavigationModePlatform initialPlatform = FlutterAndroidNavigationModePlatform.instance;

  test('$MethodChannelFlutterAndroidNavigationMode is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAndroidNavigationMode>());
  });

  test('getNavigationMode returns three-button mode', () async {
    MockFlutterAndroidNavigationModePlatform fakePlatform = MockFlutterAndroidNavigationModePlatform();
    FlutterAndroidNavigationModePlatform.instance = fakePlatform;

    expect(await FlutterAndroidNavigationModePlatform.instance.getNavigationMode(), 0);
  });
}
