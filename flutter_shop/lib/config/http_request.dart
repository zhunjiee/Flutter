/**
 * @ClassName server_method
 * @Description 网络请求接口方法
 * @Author HouGe
 * @Date 2020-02-03 13:26
 * @Version 1.0
 */

import 'package:dio/dio.dart';
import 'dart:async';
import 'common_url.dart';

/*
* POST请求
* */
Future postRequest(String url, {Map formData}) async {
  try {
    Dio dio = Dio();
    dio.options = BaseOptions(
      contentType: "application/x-www-form-urlencoded",
      connectTimeout: 60000,
    );

    Response response;
    if (formData == null) {
      response = await dio.post(serverPath[url]);
    } else {
      response = await dio.post(
        serverPath[url],
        queryParameters: formData,
      );
    }

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("后端接口出现异常，请检测代码和服务器情况.........");
    }
  } catch (e) {
    return print("ERROR:======> $e");
  }
}

/*
* 首页模块接口
* */
Future getHomePageContent({String lon, String lat}) async {
  var params = {
    "lon": lon,
    "lat": lat,
  };
  return await postRequest("homePageContent", formData: params);
}

/*
* 首页火爆专区
* */
Future getHomePageBelowContent({int page}) async {
  var params = {"page": page};
  return await postRequest("homePageBelowContent", formData: params);
}

/*
* 分类模块接口
* */
Future getCategory() async {
  return await postRequest("getCategory", formData: null);
}