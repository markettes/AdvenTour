/*
 * Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 *
 * This software and other materials contain proprietary information
 * controlled by HERE and are protected by applicable copyright legislation.
 * Any use and utilization of this software and other materials and
 * disclosure to any third parties is conditional upon having a separate
 * agreement with HERE for the access, use, utilization or disclosure of this
 * software. In the absence of such agreement, the use of the software is not
 * allowed.
 */

package com.here.here_sdk

import android.content.Context
import android.os.Build
import android.util.Log
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import com.here.sdk.mapview.MapController
import com.here.sdk.mapview.MapView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.PluginRegistry.Registrar
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

@RequiresApi(Build.VERSION_CODES.ICE_CREAM_SANDWICH)
class HereSdkPlugin() :
        FlutterPlugin,
        ActivityAware,
        PlatformViewFactory(StandardMessageCodec.INSTANCE),
        MethodChannel.MethodCallHandler {
    var registrar: Registrar? = null

    // Android embedding v1 implementation
    constructor(registrar: Registrar) : this() {
        this.registrar = registrar
    }

    companion object {
        @JvmStatic
        fun registerWith(registrar: Registrar) {
            val channel = MethodChannel(registrar.messenger(), "com.here.flutter/here_sdk")

            val hereSdkPlugin = HereSdkPlugin(registrar)
            channel.setMethodCallHandler(hereSdkPlugin)
            registrar.platformViewRegistry()
                    .registerViewFactory("com.here.flutter/here_sdk", hereSdkPlugin)
        }
    }

    // Android embedding v2 implementation
    private lateinit var channel : MethodChannel
    var pluginBinding : FlutterPlugin.FlutterPluginBinding? = null
    var activityBinding : ActivityPluginBinding? = null
    private var controllers : MutableList<MapController> = mutableListOf<MapController>()

    fun removeMapController(controller : MapController) {
        controllers.remove(controller)
        if (activityBinding != null) {
            controller.detachActivity(activityBinding!!.getActivity())
        }
    }

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        pluginBinding = flutterPluginBinding
        channel = MethodChannel(pluginBinding!!.getBinaryMessenger(), "com.here.flutter/here_sdk")
        channel.setMethodCallHandler(this)

        pluginBinding!!.getPlatformViewRegistry()
                .registerViewFactory("com.here.flutter/here_sdk", this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        pluginBinding = null
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(@NonNull binding : ActivityPluginBinding) {
        activityBinding = binding
        for (c in controllers) {
            c.attachActivity(activityBinding!!.getActivity())
        }
    }

    override fun onDetachedFromActivityForConfigChanges() {
        for (c in controllers) {
            c.detachActivity(activityBinding!!.getActivity())
        }
        activityBinding = null
    }

    override fun onReattachedToActivityForConfigChanges(@NonNull binding : ActivityPluginBinding) {
        activityBinding = binding
        for (c in controllers) {
            c.attachActivity(activityBinding!!.getActivity())
        }
    }

    override fun onDetachedFromActivity() {
        for (c in controllers) {
            c.detachActivity(activityBinding!!.getActivity())
        }
        activityBinding = null
    }

    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView {
        return MapController(viewId, this, MapView(context))
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            else -> result.notImplemented()
        }
    }
}
