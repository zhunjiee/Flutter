/**
 * @ClassName child_category
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-07 19:18
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../model/category_model.dart';

class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> _childCategoryList = [];
  List get childCategoryList => _childCategoryList;

  // 获取数据的方法
  void getChildCategoryList(List list) {
    _childCategoryList = list;
    notifyListeners();
  }
}