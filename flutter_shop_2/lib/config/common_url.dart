/**
 * @ClassName common_url
 * @Description url地址
 * @Author Houge
 * @Date 2020/7/16 8:49 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CommonUrl {
  // 服务器地址
  static const String baseUrl = "https://wxmini.baixingliangfan.cn/baixing/";

  // 商店首页
  static const String homeUrl = baseUrl + "wxmini/homePageContent";
  // 商城首页热卖商品拉取
  static const String homeBelowUrl = baseUrl + "wxmini/homePageBelowConten";
  // 商品类别信息
  static const String categoryUrl = baseUrl + "wxmini/getCategory";
  // 商品分类的商品列表
  static const String mallGoodsUrl = baseUrl + "wxmini/getMallGoods";
  // 商品详情
  static const String goodsDetailUrl = baseUrl + "wxmini/getGoodDetailById";
}