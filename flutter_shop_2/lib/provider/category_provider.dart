/// @ClassName category_provider
/// @Description TODO
/// @Author HouGe
/// @Date 2020/8/1 10:07 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import '../model/category_model.dart';

class CategoryProvider with ChangeNotifier {
  List<BxMallSubDto> _childCategoryList = []; // 子分类数组
  String _categoryId = "";  // 左侧选中大类的ID
  String _childCategoryId = ""; // 顶部选中子分类的ID
  int _childSelectedIndex = 0;  // 顶部子分类选中索引
  int _page = 1;
  bool _noMoreData = false;

  /// Getter方法
  List<BxMallSubDto> get childCategoryList => _childCategoryList;
  String get categoryId => _categoryId;
  String get childCategoryId => _childCategoryId;
  int get childSelectedIndex => _childSelectedIndex;
  int get page => _page;
  bool get noMoreData => _noMoreData;


  /// 曝光数据的方法
  /*
  * 切换分类, 曝光大类下面的子分类
  * mallCategoryId: 左侧大类ID
  * list: 子分类数组
  * */
  void exposeChildCategoryList(String mallCategoryId, List<BxMallSubDto> list) {
    // 将子类选中索引重置为第一个"全部"选项
    _childSelectedIndex = 0;
    _page = 1;
    _noMoreData = false;

    // 父类ID(左侧大类)
    _categoryId = mallCategoryId;

    /// 手动添加"全部"子分类
    BxMallSubDto allCategory = BxMallSubDto();
    allCategory.mallSubId = "";
    allCategory.mallSubName = "全部";
    allCategory.comments = "null";
    // 找出大分类ID, list的大类ID都是一样的
    BxMallSubDto model = list[0];
    allCategory.mallCategoryId = model.mallCategoryId;
    _childCategoryList = [allCategory];
    _childCategoryList.addAll(list);

    notifyListeners();
  }

  /*
  * 曝光小分类选中项
  * */
  void exposeChildSelectedId(int index, String mallSubId) {
    _childSelectedIndex = index;
    _childCategoryId = mallSubId;

    // 点击子类后页码和提示语都重置
    _page = 1;
    _noMoreData = false;

    notifyListeners();
  }

  void addPage() {
    // 单纯page+1,页面没有状态改变,所以不需要notifyListeners
    _page++;
  }

  void resetPage() {
    _page = 1;
  }

  void changeNoMoreData(bool noMore) {
    _noMoreData = noMore;

    notifyListeners();
  }
}