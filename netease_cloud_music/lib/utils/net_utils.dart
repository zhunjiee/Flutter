/**
 * @ClassName net_utils
 * @Description 网路请求类
 * @Author HouGe
 * @Date 2020-02-19 23:08
 * @Version 1.0
 */

import 'package:flutter/cupertino.dart';
import 'dart:io' show Directory;
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
import '../model/user_model.dart';

class NetUtils {
  static Dio _dio;

  static void init() async {
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    CookieJar cj = PersistCookieJar(dir: tempPath);
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      followRedirects: false, // 重定向
      receiveTimeout: 10000, // 接收超时10秒
      connectTimeout: 30000, // 连接超时30秒
    );
    _dio = Dio(options)
      ..interceptors.add(CookieManager(cj))
      ..interceptors
          .add(CustomLogInterceptor(responseBody: true, requestBody: true));
  }

  static Future<Response> _get(
    BuildContext context,
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = true,
  }) async {
    if (isShowLoading) Loading.showLoading(context);
    try {
      if (params != null) {
        return await _dio.get(url, queryParameters: params);
      } else {
        return await _dio.get(url);
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

  /// 跳转到登录页面
  static void _reLogin() {
    Future.delayed(Duration(milliseconds: 200), () {
      Application.getIt<NavigateService>().popAndPushNamed(Routes.loginPage);
      Utils.showToast('登录失效，请重新登录');
    });
  }

  /// 登录
  static Future<UserModel> login(
    BuildContext context,
    String phone,
    String password,
  ) async {
    var params = {
      "phone": phone,
      "password": password,
    };
    Response response = await _get(context, loginAPI, params: params);
    return UserModel.fromJson(response.data);
  }

  /// 重新登录
  static Future<Response> refreshLogin(BuildContext context) async {
    return await _get(context, refreshLoginAPI, isShowLoading: false)
        .catchError((e) {
      Utils.showToast("网络错误!");
    });
  }

  /// 获取首页广告轮播图
  static void getBanner(BuildContext context) async {
    var params = {
      "type": 1,
    };
    Response response = await _get(context, bannerAPI, params: params);

    print(response.data);
  }
}
