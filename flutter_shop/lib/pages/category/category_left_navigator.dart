/**
 * @ClassName category_left_navigator
 * @Description 左侧大类导航
 * @Author HouGe
 * @Date 2020-02-09 15:55
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../config/common_api.dart';
import '../../model/category_model.dart';
import '../../provider/category_provider.dart';
import '../../model/category_goods_list_model.dart';
import '../../provider/category_goods_list_provider.dart';

/*
* 左侧大类导航
* */
class LeftCategoryNavigator extends StatefulWidget {
  @override
  _LeftCategoryNavigatorState createState() => _LeftCategoryNavigatorState();
}

class _LeftCategoryNavigatorState extends State<LeftCategoryNavigator> {
  List categoryModelList = [];
  int selectIndex = 0;

  @override
  void initState() {
    super.initState();
    _getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(
            width: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _leftCategoryItem(index);
        },
        itemCount: categoryModelList.length,
      ),
    );
  }

//  ------------------------ 网络请求 ------------------------

// 获取分类栏目数据
  void _getCategoryData() {
    getCategoryData().then((value) {
      CategoryListModel listModel = CategoryListModel.fromList(value);
      setState(() {
        categoryModelList = listModel.categoryList;
        CategoryModel model = categoryModelList[0];
        // 2. 通过Provider曝光需要的值 - 曝光初始值
        Provider.of<CategoryProvider>(context, listen: false)
            .exposeChildCategoryList(model.bxMallSubDto, model.mallCategoryId);
        // 获取初始商品数据
        _getCategoryGoodsListData(1, model.mallCategoryId);
      });
    });
  }

//  获取分类下的商品列表数据
  void _getCategoryGoodsListData(int page, String categoryId) {
    // 网络请求
    getCategoryGoodsListData(
      page,
      categoryId: categoryId,
    ).then((value) {
      List goodsList = CategoryGoodsListModel.fromList(value).goodsList;
      // Provider曝光初始值
      Provider.of<CategoryGoodsListProvider>(context, listen: false)
          .exposeGoodsList(goodsList);
    });
  }

// ------------------------ 子组件 ------------------------

// 单个分类导航组件
  Widget _leftCategoryItem(int index) {
    CategoryModel model = categoryModelList[index];
    bool isSelected = (index == selectIndex) ? true : false;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectIndex = index;
        });
        var childList = model.bxMallSubDto;
        // 2. 通过Provider曝光需要的值
        Provider.of<CategoryProvider>(context, listen: false)
            .exposeChildCategoryList(childList, model.mallCategoryId);

        // 请求商品列表数据
        _getCategoryGoodsListData(1, model.mallCategoryId);
      },
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.only(left: 10, top: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black12 : Colors.white,
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Colors.black12,
            ),
          ),
        ),
        child: Text(
          model.mallCategoryName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
          ),
        ),
      ),
    );
  }
}
