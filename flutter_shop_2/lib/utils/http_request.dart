/// @ClassName http_request
/// @Description 网络请求工具类
/// @Author HouGe
/// @Date 2020/7/9 2:19 PM
/// @Version 1.0

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../config/common_url.dart';

enum RequestType {
  GET,
  POST,
}

class HttpRequest {
  Dio _dio;

  /*
  * 单例网络请求类
  * Dart中实现单例模式的标准做法就是使用 static变量+工厂构造函数 的方式，
  * 这样就可以保证new HttpRequest()始终返回都是同一个实例
  * */

  // 1. 私有构造函数
  HttpRequest._internal() {
    // 初始化
    if (null == _dio) {
      BaseOptions options = BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        receiveTimeout: 10000, // 接收超时10秒
        connectTimeout: 30000, // 连接超时30秒
        baseUrl: CommonUrl.baseUrl,
      );
      _dio = Dio(options);
    }
  }
  // 2. 保存单例
  static final HttpRequest _instance = HttpRequest._internal();
  // 3. 工厂构造函数
  factory HttpRequest() => _instance;

  /*
  * GET请求
  * */
  Future<Response> get(
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = false, // 是否显示加载中, 不好用
  }) async {
    return await _request(
      RequestType.GET,
      url,
      params: params,
    );
  }

  /*
  * POST请求
  * */
  Future<Response> post(
    String url, {
    Map<String, dynamic> params,
    bool isShowLoading = false, // 是否显示加载中, 不好用
  }) async {
    return await _request(
      RequestType.POST,
      url,
      params: params,
    );
  }

  Future<Response> _request(
    RequestType requestType,
    String url, {
    Map<String, dynamic> params,
  }) async {
    try {
      Response response;
      if (requestType == RequestType.GET) {
        response = await _dio.get(url, queryParameters: params);
      } else if (requestType == RequestType.POST) {
        response = await _dio.post(url, queryParameters: params);
      }
      if (response.statusCode == 200) {
        var data = json.decode(response.data.toString());
        if (data["message"] == "success") {
          return Future.value(Response(data: data["data"]));
        } else {
          EasyLoading.showToast(data["message"]);
          throw Exception(data["message"]);
        }
      } else {
        EasyLoading.showToast("服务器开小差啦,请稍后再试");
        throw Exception("后端接口出现异常，请检测代码和服务器情况.........");
      }
    } on DioError catch (e) {
      print("ERROR: $url ======> $e");
      // 错误处理
      if (e == null) {
        return await Future.error(Response(data: -1));
      } else if (e.response != null) {
        if (e.response.statusCode >= 300 && e.response.statusCode < 400) {
          // 重新登录
          _reLogin();
          return await Future.value(Response(data: -1));
        } else {
          return await Future.value(e.response);
        }
      } else {
        return await Future.error(Response(data: -1));
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// 重新登录
  static void _reLogin() {
    // 跳转到登录界面
    EasyLoading.showToast("登录失效，请重新登录");
  }
}
