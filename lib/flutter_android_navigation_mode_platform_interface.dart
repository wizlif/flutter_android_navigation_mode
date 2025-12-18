import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_android_navigation_mode_method_channel.dart';

abstract class FlutterAndroidNavigationModePlatform extends PlatformInterface {
  /// Constructs a FlutterAndroidNavigationModePlatform.
  FlutterAndroidNavigationModePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAndroidNavigationModePlatform _instance = MethodChannelFlutterAndroidNavigationMode();

  /// The default instance of [FlutterAndroidNavigationModePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAndroidNavigationMode].
  static FlutterAndroidNavigationModePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAndroidNavigationModePlatform] when
  /// they register themselves.
  static set instance(FlutterAndroidNavigationModePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Returns the current navigation mode as an integer.
  /// - 0: Three-button navigation
  /// - 1: Two-button navigation
  /// - 2: Gesture navigation (full screen)
  /// - -1: Not applicable (iOS)
  Future<int> getNavigationMode() {
    throw UnimplementedError('getNavigationMode() has not been implemented.');
  }
}
