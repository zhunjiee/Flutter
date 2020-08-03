/// @ClassName net_utils
/// @Description 网络请求工具类
/// @Author HouGe
/// @Date 2020/7/27 8:46 AM
/// @Version 1.0

import 'package:dio/dio.dart';
import 'http_request.dart';
import '../config/common_url.dart';
import '../model/home_model.dart';
import '../model/category_model.dart';
import '../model/category_goods_model.dart';

class NetUtils {
  HttpRequest _request;

  // 单例
  static final NetUtils _instance = NetUtils._internal();
  factory NetUtils() => _instance; // 工厂模式
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
      "lon": lon,
      "lat": lat,
    };
    Response response = await _request.post(CommonUrl.homeUrl, params: params);
    return HomeModel.fromJson(response.data);
  }

  /*
  * 首页火爆专区
  * */
  Future<List<HotGoodsModel>> getHomePageBelowContent(int page) async {
    var params = {
      "page": page,
    };
    Response response =
        await _request.post(CommonUrl.homeBelowUrl, params: params);

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

  /*
  * 分类模块
  * */
  Future<List<CategoryModel>> getCategoryData() async {
    Response response = await _request.post(CommonUrl.categoryUrl);

    List<CategoryModel> modelList = List();
    if (response.data != null) {
      List<Map> categoryList = (response.data as List).cast();
      categoryList.forEach((element) {
        modelList.add(CategoryModel.fromJson(element));
      });
    }

    return modelList;
  }

  /*
  * 分类-商品列表
  * */
  Future<List<CategoryGoodsModel>> getCategoryGoodsData(
    int page, {
    String categoryId = "",
    String categorySubId = "",
  }) async {
    var params = {
      "page": page,
      "categoryId" : categoryId,
      "categorySubId" : categorySubId,
    };
    Response response =
        await _request.post(CommonUrl.mallGoodsUrl, params: params);
    print("getCategoryGoodsData : ${response.data}");
    List<CategoryGoodsModel> modelList = List();
    if (response.data != null) {
      List<Map> hotGoodsList = (response.data as List).cast();
      hotGoodsList.forEach((element) {
        modelList.add(CategoryGoodsModel.fromJson(element));
      });
    }
    return modelList;
  }
}
