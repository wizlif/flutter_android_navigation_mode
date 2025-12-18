import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_android_navigation_mode_new_method_channel.dart';

abstract class FlutterAndroidNavigationModeNewPlatform extends PlatformInterface {
  /// Constructs a FlutterAndroidNavigationModeNewPlatform.
  FlutterAndroidNavigationModeNewPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAndroidNavigationModeNewPlatform _instance = MethodChannelFlutterAndroidNavigationModeNew();

  /// The default instance of [FlutterAndroidNavigationModeNewPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAndroidNavigationModeNew].
  static FlutterAndroidNavigationModeNewPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAndroidNavigationModeNewPlatform] when
  /// they register themselves.
  static set instance(FlutterAndroidNavigationModeNewPlatform instance) {
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
