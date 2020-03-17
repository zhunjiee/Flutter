/**
 * @ClassName http_request
 * @Description 网络请求单例类
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
  Dio _dio;

  // 1. 私有构造函数
  HttpRequest._internal() {
    // 初始化
    if (null == _dio) {
      // 获取本地cookie
      getTemporaryDirectory().then((tempDir) {
        String tempPath = tempDir.path;
        CookieJar cookieJar = PersistCookieJar(dir: tempPath);
        BaseOptions options = BaseOptions(
          baseUrl: CommonUrl.baseUrl,
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

  // 2. 保存单例
  static final HttpRequest _instance = HttpRequest._internal();

  // 3. 工厂构造函数
  factory HttpRequest() => _instance;

  // Dart中实现单例模式的标准做法就是使用static变量+工厂构造函数的方式，
  // 这样就可以保证new HttpRequest()始终返回都是同一个实例

  /// GET 请求
  Future<Response> get(
    String url, {
    Map<String, dynamic> params,
    BuildContext context,
    bool isShowLoading = false,
  }) async {
    return await _request(
      RequestType.GET,
      url,
      params: params,
      context: context,
      isShowLoading: isShowLoading,
    );
  }

  /// POST 请求
  Future<Response> post(
    String url, {
    Map<String, dynamic> params,
    BuildContext context,
    bool isShowLoading = false,
  }) async {
    return await _request(
      RequestType.POST,
      url,
      params: params,
      context: context,
      isShowLoading: isShowLoading,
    );
  }

  Future<Response> _request(
    RequestType requestType,
    String url, {
    Map<String, dynamic> params,
    BuildContext context,
    bool isShowLoading = false, // 不好用
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
        return await Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          // 重新登录
          _reLogin();
          return await Future.error(Response(data: -1));
        } else {
          return await Future.value(e.response);
        }
      } else {
        return await Future.error(Response(data: -1));
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
