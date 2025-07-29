import Flutter
import UIKit
import FCUUID

public class DeviceIdPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_device_uuid", binaryMessenger: registrar.messenger())
        let instance = DeviceIdPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "uuid":
            let rawUuid = FCUUID.uuidForDevice() as String
            // If the UUID is 32 characters (no dashes), format it with dashes
            if rawUuid.count == 32 {
                let formattedUuid = "\(rawUuid.prefix(8))-\(rawUuid.dropFirst(8).prefix(4))-\(rawUuid.dropFirst(12).prefix(4))-\(rawUuid.dropFirst(16).prefix(4))-\(rawUuid.dropFirst(20))"
                result(formattedUuid)
            } else {
                result(rawUuid)
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
