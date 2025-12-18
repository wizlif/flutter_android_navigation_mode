import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode_new_platform_interface.dart';
import 'package:flutter_android_navigation_mode/flutter_android_navigation_mode_new_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAndroidNavigationModeNewPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAndroidNavigationModeNewPlatform {

  @override
  Future<int> getNavigationMode() => Future.value(0);
}

void main() {
  final FlutterAndroidNavigationModeNewPlatform initialPlatform = FlutterAndroidNavigationModeNewPlatform.instance;

  test('$MethodChannelFlutterAndroidNavigationModeNew is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAndroidNavigationModeNew>());
  });

  test('getNavigationMode returns three-button mode', () async {
    MockFlutterAndroidNavigationModeNewPlatform fakePlatform = MockFlutterAndroidNavigationModeNewPlatform();
    FlutterAndroidNavigationModeNewPlatform.instance = fakePlatform;

    expect(await FlutterAndroidNavigationModeNewPlatform.instance.getNavigationMode(), 0);
  });
}
