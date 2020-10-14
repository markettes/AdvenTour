//
// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//

import Flutter
import UIKit
import os.log
import heresdk

public class SwiftHereSdkPlugin : NSObject, FlutterPlugin, FlutterPlatformViewFactory{

    public static func register(with registrar : FlutterPluginRegistrar) {
        do {
            try SDKInitializer.initializeIfNecessary()
        } catch {
            fatalError("Failed to initialize HERE SDK. Cause: \(error)")
        }

        let instance = SwiftHereSdkPlugin(registrar)
        let channel = FlutterMethodChannel(
            name: "com.here.flutter/here_sdk",
            binaryMessenger: registrar.messenger(),
            codec: FlutterStandardMethodCodec.sharedInstance())

        weak var weakSelf: SwiftHereSdkPlugin? = instance
        channel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) in
            weakSelf?.onMethodCall(call, result)
        });
        registrar.register(instance, withId: "com.here.flutter/here_sdk")
    }

    public static func log(_ pattern : String, _ data : CVarArg){
        NSLog(pattern, data)
    }

    private var registrar: FlutterPluginRegistrar

    init(_ registrar: FlutterPluginRegistrar){
        self.registrar = registrar
    }

    public func onMethodCall(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        result(FlutterMethodNotImplemented)
    }

    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView{
        let mapView = MapView(frame: frame);
        return MapController(viewIdentifier: viewId, registrar: registrar, mapView: mapView)
    }
}

extension OSLog{
    private static var subsystem = Bundle.main.bundleIdentifier!

    /// Logs the view cycles like viewDidLoad.
    static let hsdk = OSLog(subsystem: subsystem, category: "hsdk")
}
