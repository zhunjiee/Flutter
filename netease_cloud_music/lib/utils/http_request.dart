/**
 * @ClassName http_request
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-24 15:19
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'common_url.dart';
import 'utils.dart';
import 'custom_log_interceptor.dart';
import '../routes/navigate_service.dart';
import '../routes/routes.dart';
import '../widgets/widget_loading.dart';
import '../application.dart';

enum RequestType {
  GET,
  POST,
}

class HttpRequest {
  static Dio _dio;

  // 单例
  static final HttpRequest _instance = HttpRequest._internal();
  factory HttpRequest() => _instance; // 工厂模式
  HttpRequest._internal() {
    // 初始化
    if (null == _dio) {
      // 获取本地cookie
      getTemporaryDirectory().then((tempDir) {
        String tempPath = tempDir.path;
        CookieJar cookieJar = PersistCookieJar(dir: tempPath);
        BaseOptions options = BaseOptions(
          baseUrl: baseUrl,
          followRedirects: false, // 重定向
          receiveTimeout: 10000, // 接收超时10秒
          connectTimeout: 30000, // 连接超时30秒
        );
        _dio = Dio(options)
          ..interceptors.add(CookieManager(cookieJar))
          ..interceptors
              .add(CustomLogInterceptor(responseBody: true, requestBody: true));
      });
    }
  }

  /// GET 请求
  Future<Response> get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    return await _request(
      context,
      RequestType.GET,
      url,
      params: params,
      isShowLoading: isShowLoading,
    );
  }

  /// POST 请求
  Future<Response> post(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    return await _request(
      context,
      RequestType.POST,
      url,
      params: params,
      isShowLoading: isShowLoading,
    );
  }

  static Future<Response> _request(
    BuildContext context,
    RequestType requestType,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);

    try {
      if (requestType == RequestType.GET) {
        return await _dio.get(url, queryParameters: params);
      } else {
        return await _dio.post(url, queryParameters: params);
      }
    } on DioError catch (e) {
      if (e == null) {
        return Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          // 重新登录
          _reLogin();
          return Future.error(Response(data: -1));
        } else {
          return Future.value(e.response);
        }
      } else {
        return Future.error(Response(data: -1));
      }
    } finally {
      Loading.hideLoading(context);
    }
  }

  /// 重新登录
  static void _reLogin() {
    // 跳转到登录页面
    Application.getIt<NavigateService>().popAndPushNamed(Routes.loginPage);
    Utils.showToast("登录失效，请重新登录");
  }
}