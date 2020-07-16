/**
 * @ClassName http_request
 * @Description 网络请求工具类
 * @Author Houge
 * @Date 2020/7/9 2:19 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
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


  Future _requset(
    RequestType requestType,
    String url, {
    Map<String, dynamic> params,
        BuildContext context,
        bool isShowLoading = false, // 是否显示加载中
  }) async {
    if (isShowLoading) {

    }
  }
}
