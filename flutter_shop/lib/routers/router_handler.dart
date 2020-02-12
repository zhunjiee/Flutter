import 'package:fluro/fluro.dart';
/**
 * @ClassName router_handler
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-11 23:40
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../pages/detail/detail_page.dart';

Handler detailHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String goodsId = params["id"].first;
    print("商品详情ID为: $goodsId");
    return GoodsDetail(goodsId);
  }
);