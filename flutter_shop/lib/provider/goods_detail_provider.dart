/**
 * @ClassName goods_detail_provider
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-12 14:09
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../model/goods_detail_model.dart';
import 'package:flutter_shop/config/common_api.dart';

class GoodsDetailProvider with ChangeNotifier {
  DetailModel detailModel;

  // 从后台获取商品详情数据
  getGoodsDetailData(String goodsId) {
    getGoodsDetailById(goodsId).then((value){
      print(value);
      detailModel = DetailModel.fromJson(value);

      notifyListeners();
    });
  }
}