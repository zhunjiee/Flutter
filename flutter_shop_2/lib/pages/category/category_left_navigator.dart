/// @ClassName category_left_navigator
/// @Description 分类左侧大类导航
/// @Author HouGe
/// @Date 2020/7/31 4:49 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttershop2/provider/category_goods_list_provider.dart';
import 'package:fluttershop2/provider/category_provider.dart';
import 'package:provider/provider.dart';
import '../../model/category_model.dart';
import '../../utils/net_utils.dart';

class LeftCategoryNavigator extends StatefulWidget {
  @override
  _LeftCategoryNavigatorState createState() => _LeftCategoryNavigatorState();
}

class _LeftCategoryNavigatorState extends State<LeftCategoryNavigator> {
  List categoryModelList = [];
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      color: Colors.white,
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _leftCategoryItem(categoryModelList[index], index);
        },
        itemCount: categoryModelList.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            height: 0.5,
            color: Colors.black12,
          );
        },
      ),
    );
  }

  /// 单个分类组件
  Widget _leftCategoryItem(CategoryModel model, int index) {
    bool isSelected = index == selectedIndex ? true : false;
    return Container(
      width: ScreenUtil().setWidth(180),
      height: ScreenUtil().setWidth(100),
      color: Colors.white,
      child: FlatButton(
        onPressed: () {
          setState(() {
            selectedIndex = index;
            /// 曝光选中子分类
            CategoryModel model = categoryModelList[index];
            Provider.of<CategoryProvider>(context, listen: false).exposeChildCategoryList(model.mallCategoryId, model.bxMallSubDto);
            _getCategoryGoodsListData(1, model.mallCategoryId);
          });
        },
        child: Text(model.mallCategoryName, style: TextStyle(fontSize: ScreenUtil().setSp(28)),),
        color: isSelected ? Colors.black12 : Colors.white,
      ),
    );
  }


  /// 获取分类数据
  void _getCategoryData() {
    NetUtils().getCategoryData().then((value) {
      setState(() {
        categoryModelList = value;

        /// 曝光初始值
        CategoryModel model = categoryModelList[0];
        // 通过Provider曝光需要的值
        // listen: false表明此处不监听。
        Provider.of<CategoryProvider>(context, listen: false).exposeChildCategoryList(model.mallCategoryId, model.bxMallSubDto);

        _getCategoryGoodsListData(1, model.mallCategoryId);
      });
    });
  }

  /// 获取分类商品数据
  void _getCategoryGoodsListData(int page, String categoryId) {
    Provider.of<CategoryProvider>(context, listen: false).changeNoMoreData(false);
    NetUtils().getCategoryGoodsData(page, categoryId: categoryId).then((value) {
      // 曝光分类商品数据
      Provider.of<CategoryGoodsListProvider>(context, listen: false).exposeGoodsList(value);
    });
  }
}
