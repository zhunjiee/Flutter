/// @ClassName net_utils
/// @Description 网络请求工具类
/// @Author HouGe
/// @Date 2020/7/27 8:46 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'http_request.dart';
import '../config/common_url.dart';
import '../model/home_model.dart';

class NetUtils {
  HttpRequest _request;

  // 单例
  static final NetUtils _instance = NetUtils._internal();
  factory NetUtils() => _instance;  // 工厂模式
  NetUtils._internal() {
    if (null == _request) {
      _request = HttpRequest();
    }
  }

  /*
  * 首页模块数据
  * */
  Future<HomeModel> getHomePageContent(String lon, String lat) async {
    var params = {
      "lon" : lon,
      "lat" : lat,
    };
    Response response = await _request.post(CommonUrl.homeUrl, params: params);
    return HomeModel.fromJson(response.data);
  }

  /*
  * 首页火爆专区
  * */
  Future<List<HotGoodsModel>> getHomePageBelowContent(int page) async {
    var params = {
      "page" : page,
    };
    Response response = await _request.post(CommonUrl.homeBelowUrl, params: params);
    print("getHomePageBelowContent : ${response.data}");
    List<HotGoodsModel> modelList = List();
    if (response.data != null) {
      List<Map> hotGoodsList = (response.data as List).cast();
      hotGoodsList.forEach((element) {
        modelList.add(HotGoodsModel.fromJson(element));
      });
//      hotGoodsList.map((element) => modelList.add(HotGoodsModel.fromJson(element)));
    }
    return modelList;
  }
}