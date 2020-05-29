import UIKit
import Flutter

import NetworkExtension
import SystemConfiguration.CaptiveNetwork

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let wifiChannel = FlutterMethodChannel(name: "wifi", binaryMessenger: controller.binaryMessenger)

    wifiChannel.setMethodCallHandler({
      [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
      guard call.method == "connectDevice" else {
        result(FlutterMethodNotImplemented)
        return
      }

      guard let args = call.arguments else {
        result(FlutterMethodNotImplemented)
        return
      }

      if let _args = args as? [String: String],
         let _serial = _args["serial"] as? String {
        if #available(iOS 11.0, *) {
          let configuration = NEHotspotConfiguration.init(ssid: _serial)
          configuration.joinOnce = false

          /* Alert the OS that the user wants to connect to the WiFi */
          NEHotspotConfigurationManager.shared.apply(configuration) { (error) in
            if (error != nil) {
              if (error?.localizedDescription == "already associated.") {
                // already paired
                result(true)
              }
              else {
                // abort
                result(false)
              }
            }
            else {
              // success
              result(true)
            }
          }
        }
      }
    })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
