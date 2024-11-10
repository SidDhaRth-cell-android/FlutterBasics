package com.example.flutter09

import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import org.json.JSONObject

class MainActivity : FlutterActivity() {

  private val CHANNEL = "com.flutter09"


  override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine)
    MethodChannel(
      flutterEngine.dartExecutor.binaryMessenger,
      CHANNEL
    ).setMethodCallHandler { call, result ->
      if (call.method == "display") {
        // SDK invoke
        val paymentGateay = PaymentGateway()
        paymentGateay.launch()
        result.success("sjkfbksdabf")
      } else {
        result.notImplemented()
      }
    }
    super.configureFlutterEngine(flutterEngine)

  }

}
