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
    
    // 计算两个数的和
    let METHOD_CHANNEL = "com.zhunjiee.flutter/android"
    let  METHOD_CHANNEL_ADD = "numberAdd"
    let methodChannel = FlutterMethodChannel(name: METHOD_CHANNEL, binaryMessenger: controller!.binaryMessenger)
    methodChannel.setMethodCallHandler { (call, result) in
        if (call.method == METHOD_CHANNEL_ADD) {
            let dict: [String: Any]  = call.arguments as! [String : Any]
            let num1 = (dict["num1"] as? NSNumber)?.intValue ?? 0
            let num2 = (dict["num2"] as? NSNumber)?.intValue ?? 0
            
            result(NSNumber(value: num1 + num2))
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
