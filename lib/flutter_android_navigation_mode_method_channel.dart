import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_android_navigation_mode_platform_interface.dart';

/// An implementation of [FlutterAndroidNavigationModePlatform] that uses method channels.
class MethodChannelFlutterAndroidNavigationMode extends FlutterAndroidNavigationModePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android_navigation_mode');

  @override
  Future<int> getNavigationMode() async {
    final mode = await methodChannel.invokeMethod<int>('getNavigationMode');
    return mode ?? -1;
  }
}
