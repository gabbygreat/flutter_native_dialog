package com.example.native_dialog_flutter

import android.app.AlertDialog
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import android.content.Context
import android.app.Dialog;
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.view.WindowManager
import android.provider.Settings;

/** NativeDialogFlutterPlugin */
class NativeDialogFlutterPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel
  private lateinit var context: Context

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    context = flutterPluginBinding.getApplicationContext();
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "native_dialog_flutter")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "showTestDialog") {
      val builder = AlertDialog.Builder(context)
      builder.setTitle("Alert")
      builder.setMessage("Hi, My name is GabbyGreat")
      builder.setPositiveButton("OK") { dialog, which ->
        // Do something when OK button is clicked
      }
      val dialog = builder.create()
      dialog.window?.setType(WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY);
      if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(context)) {
          // Request the permission to display overlays
          var intent =  Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
          intent.data = Uri.parse("package:" + context.packageName);
          intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
          context.startActivity(intent);
      } else {
          // Permission is already granted, display the dialog
          dialog.show();
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
