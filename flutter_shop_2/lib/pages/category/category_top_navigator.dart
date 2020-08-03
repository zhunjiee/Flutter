/// @ClassName category_top_navigator
/// @Description 顶部子类导航
/// @Author HouGe
/// @Date 2020/8/1 11:14 AM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../model/category_model.dart';
import '../../provider/category_provider.dart';
import '../../utils/net_utils.dart';
import '../../provider/category_goods_list_provider.dart';

class TopCategoryNavigator extends StatefulWidget {
  @override
  _TopCategoryNavigatorState createState() => _TopCategoryNavigatorState();
}

class _TopCategoryNavigatorState extends State<TopCategoryNavigator> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /// Provider获取子分类数据
    List list = Provider.of<CategoryProvider>(context).childCategoryList;

    return Container(
      height: ScreenUtil().setWidth(80),
      width: ScreenUtil().setWidth(570),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _childCategoryItem(list[index], index);
        },
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12),
          )),
    );
  }

  // 单个子分类Item
  Widget _childCategoryItem(BxMallSubDto model, int index) {
    int childSelectIndex =
        Provider.of<CategoryProvider>(context).childSelectedIndex;
    bool isSelected = childSelectIndex == index ? true : false;

    return GestureDetector(
      onTap: () {
        Provider.of<CategoryProvider>(context, listen: false)
            .exposeChildSelectedId(index, model.mallSubId);
        _getCategoryGoodsListData(1, model.mallCategoryId, model.mallSubId);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 5, 0),
        child: Text(
          model.mallSubName,
          style: TextStyle(
            fontSize: 14,
            color: isSelected ? Colors.pink : Colors.black87,
          ),
        ),
      ),
    );
  }

  /// 获取分类商品数据
  void _getCategoryGoodsListData(
      int page, String categoryId, String subCategoryId) {
    Provider.of<CategoryProvider>(context, listen: false)
        .changeNoMoreData(false);
    NetUtils()
        .getCategoryGoodsData(page,
            categoryId: categoryId, categorySubId: subCategoryId)
        .then((value) {
      // 曝光分类商品数据
      Provider.of<CategoryGoodsListProvider>(context, listen: false)
          .exposeGoodsList(value);
    });
  }
}
