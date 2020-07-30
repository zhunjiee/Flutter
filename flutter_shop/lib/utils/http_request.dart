/**
 * @ClassName server_method
 * @Description 网络请求接口方法
 * @Author HouGe
 * @Date 2020-02-03 13:26
 * @Version 1.0
 */

import 'package:dio/dio.dart';
import 'dart:async';
import '../config/common_url.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

/*
* GET请求
* */
Future getRequest(String url, {Map formData}) async {
  print("GET方式请求接口: $url, 参数: $formData");

  try {
    Dio dio = Dio();
    dio.options = BaseOptions(
      contentType: "application/x-www-form-urlencoded",
      connectTimeout: 30000,
    );

    Response response;
    if (formData == null) {
      response = await dio.get(serverPath[url]);
    } else {
      response = await dio.post(
        serverPath[url],
        queryParameters: formData,
      );
    }

    if (response.statusCode == 200) {
      var data = json.decode(response.data.toString());
      if (data["message"] == "success") {
        return data["data"];
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        throw Exception(data["message"]);
      }

    } else {
      Fluttertoast.showToast(msg: "服务器开小差啦,请稍后再试");
      throw Exception("后端接口出现异常，请检测代码和服务器情况.........");
    }
  } catch (e) {
    return print("ERROR: $url ======> $e");
  }
}

/*
* POST请求
* */
Future postRequest(String url, {Map formData}) async {
  print("POST方式请求接口: $url, 参数: $formData");

  try {
    Dio dio = Dio();
    dio.options = BaseOptions(
      contentType: "application/x-www-form-urlencoded",
      connectTimeout: 30000,
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
      var data = json.decode(response.data.toString());
      if (data["message"] == "success") {
        return data["data"];
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        throw Exception(data["message"]);
      }

    } else {
      Fluttertoast.showToast(msg: "服务器开小差啦,请稍后再试");
      throw Exception("后端接口出现异常，请检测代码和服务器情况.........");
    }
  } catch (e) {
    return print("ERROR: $url ======> $e");
  }
}