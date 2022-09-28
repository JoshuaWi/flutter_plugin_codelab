package com.example.flutter_plugin_codelab

import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FlutterPluginCodelabPlugin */
class FlutterPluginCodelabPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var synth: Synth

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_plugin_codelab")
    channel.setMethodCallHandler(this)
    synth = Synth()
    synth.start()
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
        "getPlatformVersion" -> {
          result.success("Android ${android.os.Build.VERSION.RELEASE}")
        }
        "onKeyDown" -> {
          try {
            val arguments = call.arguments as List<*>
            val numKeysDown = synth.keyDown(arguments[0] as Int)
            result.success(numKeysDown)
          } catch (ex: Exception) {
            result.error("1", ex.message, ex.stackTrace)
          }
        }
      "onKeyUp" -> {
        try {
          val arguments = call.arguments as List<*>
          val numKeysDown = synth.keyUp(arguments[0] as Int)
          result.success(numKeysDown)
        } catch (ex: java.lang.Exception) {
          result.error("1", ex.message, ex.stackTrace)
        }
      }
        else -> {
          result.notImplemented()
        }
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
