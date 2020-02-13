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
  DetailModel detailModel = DetailModel();
  // 自定义tabBar选中状态
  bool isLeft = true;
  bool isRight = false;

  // 从后台获取商品详情数据
  getGoodsDetailData(String goodsId) async {
    await getGoodsDetailById(goodsId).then((value) {
      detailModel = DetailModel.fromJson(value);
      notifyListeners();
    });
  }

  // 改变tabBar选中状态
  selectLeftOrRight(int selectNumber) {
    if (selectNumber == 0) {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}
