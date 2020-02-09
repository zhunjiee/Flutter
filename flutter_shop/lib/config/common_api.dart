/**
 * @ClassName common_request
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-08 12:04
 * @Version 1.0
 */

import '../utils/http_request.dart';

/*
* 首页模块接口
* */
Future getHomePageContent(String lon, String lat) async {
  var params = {
    "lon": lon,
    "lat": lat,
  };
  return await postRequest("homePageContent", formData: params);
}

/*
* 首页模块 - 火爆专区
* */
Future getHomePageBelowContent(int page) async {
  var params = {
    "page": page,
  };
  return await postRequest("homePageBelowContent", formData: params);
}

/*
* 分类模块接口
* */
Future getCategoryData() async {
  return await postRequest("getCategory", formData: null);
}

/*
* 分类模块 - 分类详情列表
* */
Future getCategoryGoodsListData(int page, {String categoryId, String categorySubId}) async {
  var data = {
    "categoryId": categoryId == null ? "" : categoryId,
    "categorySubId": categorySubId == null ? "" : categorySubId,
    'page': page,
  };
  return await postRequest("getMallGoods", formData: data);
}
