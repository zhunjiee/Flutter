/**
 * @ClassName net_utils
 * @Description 网路请求类
 * @Author HouGe
 * @Date 2020-02-19 23:08
 * @Version 1.0
 */

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:netease_cloud_music/utils/custom_log_interceptor.dart';
import 'package:netease_cloud_music/widgets/widget_loading.dart';
import 'common_url.dart';

enum RequestType {
  GET,
  POST,
}

class NetUtils {
  static Dio _dio;

  // 单例
  static final NetUtils _instance = NetUtils._internal();
  factory NetUtils() => _instance;  // 工厂模式
  NetUtils._internal() {
    // 初始化
    if (null == _dio) {
      // 获取本地cookie
      getTemporaryDirectory().then((tempDir){
        String tempPath = tempDir.path;
        CookieJar cookieJar = PersistCookieJar(dir: tempPath);

        _dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: false))
          ..interceptors.add(CookieManager(cookieJar))
          ..interceptors
              .add(CustomLogInterceptor(responseBody: true, requestBody: true));
        // followRedirects: 重定向
      });
    }
  }


//  static void init() async {
//    if (null == _dio) {
//      // 获取本地cookie
//      Directory tempDir = await getTemporaryDirectory();
//      String tempPath = tempDir.path;
//      CookieJar cookieJar = PersistCookieJar(dir: tempPath);
//
//      _dio = Dio(BaseOptions(baseUrl: baseUrl, followRedirects: false))
//        ..interceptors.add(CookieManager(cookieJar))
//        ..interceptors
//            .add(CustomLogInterceptor(responseBody: true, requestBody: true));
//      // followRedirects: 重定向
//    }
//  }

  // GET 请求
  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    await _request(
      context,
      RequestType.GET,
      url,
      params: params,
      isShowLoading: isShowLoading,
    );
  }

  // POST 请求
  static Future<Response> _post(
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

  // 重新登录
  static void _relogin() {}
}
