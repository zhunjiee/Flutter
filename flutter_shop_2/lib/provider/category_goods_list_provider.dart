/// @ClassName category_goods_list_provider
/// @Description TODO
/// @Author HouGe
/// @Date 2020/8/3 11:30 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import '../model/category_goods_model.dart';

class CategoryGoodsListProvider with ChangeNotifier {
  List<CategoryGoodsModel> _goodsList = [];

  List get goodsList => _goodsList;

  void exposeGoodsList(List<CategoryGoodsModel> list) {
    _goodsList = list;

    notifyListeners();
  }

  void exposeMoreGoodsList(List<CategoryGoodsModel> list) {
    _goodsList.addAll(list);

    notifyListeners();
  }
}