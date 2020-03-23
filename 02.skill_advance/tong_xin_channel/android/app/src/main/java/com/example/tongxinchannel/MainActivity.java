package com.example.tongxinchannel;

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String METHOD_CHANNEL = "com.zhunjiee.flutter/android";
  private static final String METHOD_CHANNEL_ADD = "numberAdd";
  private MethodChannel methodChannel;

  private static final String EVENT_CHANNEL = "com.zhunjiee.flutter/android/event";
  private static final String METHOD_NATIVE_SEND_MESSAGE_TO_FLUTTER = "nativeSendMessage2Flutter";
  private EventChannel.EventSink eventSink;

  private static final String TAG = "MainActivity";

  @Override
  public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine);

    methodChannel = new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), METHOD_CHANNEL);
    methodChannel.setMethodCallHandler(new MethodChannel.MethodCallHandler() {
      @java.lang.Override
      public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        android.util.Log.d(TAG, methodCall.method);
        if (methodCall.method.equals(METHOD_CHANNEL_ADD)) {
          // 计算两个数的和
          int num1 = methodCall.argument("num1");
          int num2 = methodCall.argument("num2");
          result.success(num1 + num2);
        } else if (methodCall.method.equals(METHOD_NATIVE_SEND_MESSAGE_TO_FLUTTER)) {
          // Native端主动向Flutter端发送数据
          nativeSendMessageToFlutter();
        }
      }
    });

    new EventChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), EVENT_CHANNEL).setStreamHandler(new EventChannel.StreamHandler() {
      @Override
      public void onListen(Object arguments, EventChannel.EventSink events) {
        MainActivity.this.eventSink = events;
        eventSink.success("事件通道准备就绪");
        //在此不建议做耗时操作，因为当onListen回调被触发后，在此注册当方法需要执行完毕才算结束回调函数
        //的执行，耗时操作可能会导致界面卡死，这里读者需注意！！
      }

      @Override
      public void onCancel(Object arguments) {

      }
    });
  }

  /*
  * 原生端向flutter端主动发送消息
  */
  private void nativeSendMessageToFlutter() {
    eventSink.success("原生端向flutter端主动发送消息");
  }
}
