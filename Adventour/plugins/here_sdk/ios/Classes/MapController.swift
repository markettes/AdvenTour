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

import heresdk

class MapController:NSObject, FlutterPlatformView{

    private(set) var viewId: Int64
    private var registrar: FlutterPluginRegistrar
    private let mapView: MapView
    private var mapViewInternalPointer: UInt64 = 0;

    init(viewIdentifier viewId: Int64, registrar: FlutterPluginRegistrar, mapView: MapView) {
        self.registrar = registrar
        self.viewId = viewId
        let channel = FlutterMethodChannel(
            name: "com.here.flutter/here_sdk_\(viewId)",
            binaryMessenger: registrar.messenger(),
            codec: FlutterStandardMethodCodec.sharedInstance())
        self.mapView = mapView
        super.init();
        weak var weakSelf: MapController? = self
        channel.setMethodCallHandler({ (call: FlutterMethodCall, result: @escaping FlutterResult) in
            weakSelf?.onMethodCall(call, result)
        });
    }

    func view() -> UIView {
        return mapView
    }

    public func onMethodCall(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
        if (call.method == "initialize") {
            mapViewInternalPointer = self.getMapViewInternalPointer();
            result(mapViewInternalPointer);
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func getMapViewInternalPointer()-> UInt64 {
        var  ptr: UInt64 = 0
        defer {
            if (ptr == 0) {
                print("Internal error when trying to initialize map");
            }
        }

        guard let mapViewInternalOptional = Mirror(reflecting: mapView)
            .children.filter({$0.label == "mapViewInternal"}).first?.value else {
                return ptr
        }

        guard let mapViewInternal = Mirror(reflecting: mapViewInternalOptional)
            .children.filter({$0.label == "some"}).first?.value else {
                return ptr
        }

        guard let cInstance = Mirror(reflecting: mapViewInternal)
            .children.filter({$0.label == "c_instance"}).first?.value else {
                return ptr
        }

        guard let instanceAddress = cInstance as? Int64 else {
            return ptr
        }

        ptr = UInt64(instanceAddress);
        return ptr;
    }
}
