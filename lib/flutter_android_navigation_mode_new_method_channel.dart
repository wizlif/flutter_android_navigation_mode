import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_android_navigation_mode_new_platform_interface.dart';

/// An implementation of [FlutterAndroidNavigationModeNewPlatform] that uses method channels.
class MethodChannelFlutterAndroidNavigationModeNew extends FlutterAndroidNavigationModeNewPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android_navigation_mode_new');

  @override
  Future<int> getNavigationMode() async {
    final mode = await methodChannel.invokeMethod<int>('getNavigationMode');
    return mode ?? -1;
  }
}
