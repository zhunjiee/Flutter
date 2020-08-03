/**
 * @ClassName child_category
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-07 19:18
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<BxMallSubDto> _childCategoryList = []; // 子分类列表
  int _childSelectedIndex = 0;  // 子分类高亮索引
  String _categoryId = "";  // 左侧大类ID
  String _categorySubId = ""; // 顶部子类ID
  int _page = 1; // 页码
  bool _noMore = false; // 是否没有更多了

//  get方法
  List get childCategoryList => _childCategoryList;
  int get childSelectedIndex => _childSelectedIndex;
  String get categoryId => _categoryId;
  String get categorySubId => _categorySubId;
  int get page => _page;
  bool get noMore => _noMore;

///  曝光数据的方法

  // 曝光大类下面的子分类
  void exposeChildCategoryList(List<BxMallSubDto> list, String mallCategoryId) {
    // 将子类选中位置置为第一个位置,也就是全部选项
    _childSelectedIndex = 0;
    _categoryId = mallCategoryId;
    // 点击大类后页码和提示语都重置
    _page = 1;
    _noMore = false;

    // 手动添加"全部"分类
    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = "";
    // 找出大分类ID, list的大类ID都是一个
    BxMallSubDto model = list[0];
    all.mallCategoryId = model.mallCategoryId;
    all.mallSubName = "全部";
    all.comments = "null";
    _childCategoryList = [all];
    _childCategoryList.addAll(list);

    notifyListeners();
  }

  // 曝光选中子类的索引
  void exposeChildSelectedIndex(int index, String mallSubId){
    _childSelectedIndex = index;
    _categorySubId = mallSubId;
    // 点击子类后页码和提示语都重置
    _page = 1;
    _noMore = false;

    notifyListeners();
  }

  // 增加页码
  void addPage() {
    _page++;
    // 单纯page+1,页面没有状态改变,所以不需要notifyListeners
  }

  // 重置页码
  void reloadPage() {
    _page = 1;
  }

  // 改变 noMoreText 数据
  changeNoMore(bool noMore){
    _noMore = noMore;

    notifyListeners();
  }
}
