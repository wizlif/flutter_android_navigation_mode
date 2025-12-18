import Flutter
import UIKit

public class FlutterAndroidNavigationModeNewPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_android_navigation_mode_new", binaryMessenger: registrar.messenger())
    let instance = FlutterAndroidNavigationModeNewPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getNavigationMode":
      // iOS doesn't have Android navigation modes, return -1 to indicate not applicable
      result(-1)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
