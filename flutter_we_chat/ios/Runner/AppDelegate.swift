import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    
    // 注册获取电量的channel
    let controller = window.rootViewController as? FlutterViewController
    let batteryChannel = FlutterMethodChannel(name: "samples.flutter.io/battery", binaryMessenger: controller!.binaryMessenger)
    weak var weakSelf = self
    batteryChannel.setMethodCallHandler { (call, result) in
        if("getBatteryLevel" == call.method) {
            let batteryLevel = weakSelf?.getBatteryLevel()
            if(batteryLevel == -1) {
                result(FlutterError(code: "UNAVAILABLE", message: "Battery info unavailable", details: nil))
            } else {
                result(NSNumber(value: batteryLevel ?? 0.0))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
    
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    
    /// 获取电池电量
    func getBatteryLevel() -> Float {
        UIDevice.current.isBatteryMonitoringEnabled = true
        return UIDevice.current.batteryLevel
    }
}
