package com.example.one_signal_flutter

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val MY_CHANNEL = "demoChannel"
    var methodChannelResult: MethodChannel.Result? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, MY_CHANNEL)
            .setMethodCallHandler{ call, result ->
                methodChannelResult = result
                if(call.method == "callMethod"){
                    result.success("Call Native method success")
                }

            }
    }

}
