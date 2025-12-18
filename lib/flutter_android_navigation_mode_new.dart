import 'dart:io';

import 'flutter_android_navigation_mode_new_platform_interface.dart';

/// Enum representing the device navigation mode.
enum DeviceNavigationMode {
  /// Two-button navigation (back + home pill)
  twoButton,

  /// Three-button navigation (back, home, recent)
  threeButton,

  /// Full screen gesture navigation
  fullScreenGesture,

  /// Navigation mode not applicable (e.g., iOS)
  none,
}

/// A Flutter plugin to obtain Android System Navigation UI mode.
class AndroidNavigationMode {
  /// Returns the current device navigation mode.
  ///
  /// On Android:
  /// - [DeviceNavigationMode.threeButton]: Traditional 3-button navigation
  /// - [DeviceNavigationMode.twoButton]: 2-button navigation with gesture back
  /// - [DeviceNavigationMode.fullScreenGesture]: Full gesture navigation
  ///
  /// On iOS and other platforms:
  /// - [DeviceNavigationMode.none]: Not applicable
  static Future<DeviceNavigationMode> get getNavigationMode async {
    try {
      if (Platform.isIOS) {
        return DeviceNavigationMode.none;
      }

      final int mode = await FlutterAndroidNavigationModeNewPlatform.instance.getNavigationMode();

      switch (mode) {
        case 0:
          return DeviceNavigationMode.threeButton;
        case 1:
          return DeviceNavigationMode.twoButton;
        case 2:
          return DeviceNavigationMode.fullScreenGesture;
        default:
          return DeviceNavigationMode.none;
      }
    } catch (error) {
      return DeviceNavigationMode.none;
    }
  }
}
