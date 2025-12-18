package com.flutter_android_navigation_mode

import android.view.ViewConfiguration
import android.content.Context
import android.provider.Settings
import android.os.Build
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FlutterAndroidNavigationModePlugin */
class FlutterAndroidNavigationModePlugin :
    FlutterPlugin,
    MethodCallHandler {
    // The MethodChannel that will the communication between Flutter and native Android
    //
    // This local reference serves to register the plugin with the Flutter Engine and unregister it
    // when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_android_navigation_mode")
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(
        call: MethodCall,
        result: Result
    ) {
        when (call.method) {
            "getNavigationMode" -> {
                val navigationMode = when {
                    Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q -> {
                        getNavigationMode()
                    }
                    Build.VERSION.SDK_INT >= Build.VERSION_CODES.P -> {
                        getNavigationModeForPie()
                    }
                    else -> {
                        getLegacyNavigationMode()
                    }
                }
                result.success(navigationMode)
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun getNavigationMode(): Int {
        return try {
            val resources = context.resources
            val resourceId = resources.getIdentifier(
                "config_navBarInteractionMode",
                "integer",
                "android"
            )
            if (resourceId != 0) {
                resources.getInteger(resourceId)
            } else {
                Settings.Secure.getInt(
                    context.contentResolver,
                    "navigation_mode",
                    0
                )
            }
        } catch (e: Exception) {
            0 // default: 3-button navigation
        }
    }

    // Android 9
    private fun getNavigationModeForPie(): Int {
        return try {
            Settings.Secure.getInt(
                context.contentResolver,
                "navigation_mode",
                0
            )
        } catch (e: Exception) {
            0
        }
    }

    // Android legacy
    private fun getLegacyNavigationMode(): Int {
        return try {
            if (hasNavigationBar()) {
                0 // 3-button navigation
            } else {
                2 // Gesture navigation
            }
        } catch (e: Exception) {
            0 // default: 3-button navigation
        }
    }

    private fun hasNavigationBar(): Boolean {
        val resources = context.resources
        val resourceId = resources.getIdentifier("config_showNavigationBar", "bool", "android")
        return if (resourceId > 0) {
            resources.getBoolean(resourceId)
        } else {
            ViewConfiguration.get(context).hasPermanentMenuKey().not()
        }
    }

    companion object {
        const val NAVIGATION_MODE_THREE_BUTTONS = 0
        const val NAVIGATION_MODE_TWO_BUTTONS = 1
        const val NAVIGATION_MODE_GESTURES = 2
    }
}
