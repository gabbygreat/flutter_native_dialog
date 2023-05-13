import Flutter
import UIKit

public class NativeDialogFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_dialog_flutter", binaryMessenger: registrar.messenger())
    let instance = NativeDialogFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
     case "showTestDialog":
      DispatchQueue.main.async {
      let alert = UIAlertController(title: "Alert", message: "Hi, My name is GabbyGreat", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
