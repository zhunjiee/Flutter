/**
 * @ClassName custom_log_interceptor
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-21 16:33
 * @Version 1.0
 */

import 'package:dio/dio.dart';
import 'log_utils.dart';

class CustomLogInterceptor extends LogInterceptor {
  CustomLogInterceptor({
    request = true,
    requestHeader = true,
    requestBody = false,
    responseHeader = true,
    responseBody = false,
    error = true,
    logPrint = print,
  });

  @override
  void printKV(String key, Object v) {
    LogUtils.e("$key: $v");
  }

  @override
  void printAll(msg) {
    LogUtils.e("$msg");
  }
}