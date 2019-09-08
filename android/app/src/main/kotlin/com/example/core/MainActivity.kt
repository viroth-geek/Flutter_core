package com.example.core

import android.os.Bundle
import com.facebook.FacebookSdk

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)

    FacebookSdk.setApplicationId(getString(R.string.facebook_app_id))
    FacebookSdk.sdkInitialize(this.applicationContext)

    GeneratedPluginRegistrant.registerWith(this)
  }
}
