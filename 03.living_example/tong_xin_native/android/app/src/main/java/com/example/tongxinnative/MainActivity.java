package com.example.tongxinnative;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.android.FlutterView;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String METHOD_CHANNEL = "com.zhunjiee.flutter/android";
  private static final String METHOD_CHANNEL_ADD = "numberAdd";
  private MethodChannel methodChannel;
  FlutterView flutterView;

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    flutterView = FlutterView();

    methodChannel = new MethodChannel(getFlutterView(), METHOD_CHANNEL);
  }
}
