/**
 * @ClassName category_right_navigator
 * @Description 右侧小类导航
 * @Author HouGe
 * @Date 2020-02-09 15:59
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
* 右侧小类导航
* */
class RightCategoryNavigator extends StatefulWidget {
  @override
  _RightCategoryNavigatorState createState() => _RightCategoryNavigatorState();
}

class _RightCategoryNavigatorState extends State<RightCategoryNavigator> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    // 3. 读取子分类的值
    List list = Provider.of<CategoryProvider>(context).childCategoryList;

    // 保证切换大类时子类导航栏在开始位置
    try{
      if(Provider.of<CategoryProvider>(context).childSelectedIndex == 0){
        controller.jumpTo(0.0);
      }
    }catch(e){
      print('进入页面第一次初始化：$e');
    }

    // 1. 初始化 公开值 对象
    return Container(
      height: ScreenUtil().setHeight(80),
      width: ScreenUtil().setWidth(570),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.black12,
          ),
        ),
      ),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return _rightCategoryItem(list[index], index);
        },
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        controller: controller,
      ),
    );
  }

//  ------------------------ 网络请求 ------------------------

  //  获取分类下的商品列表数据
  _getCategoryGoodsListData(int page,
      {String categoryId, String categorySubId}) async {
    Provider.of<CategoryProvider>(context, listen: false).changeNoMore(false);
    print("right_noMore = = = = = = ${Provider.of<CategoryProvider>(context, listen: false).noMore}");
    // 网络请求
    await getCategoryGoodsListData(
      page,
      categoryId: categoryId,
      categorySubId: categorySubId,
    ).then((value) {
      List goodsList = CategoryGoodsListModel.fromList(value).goodsList;
      // Provider曝光初始值
      Provider.of<CategoryGoodsListProvider>(context, listen: false)
          .exposeGoodsList(goodsList);
    });
  }

//  ------------------------ 子组件 ------------------------

// 单个导航子组件
  Widget _rightCategoryItem(BxMallSubDto bxMallSubDto, int index) {
    List list = Provider.of<CategoryProvider>(context).childCategoryList;
    int selectedIndex =
        Provider.of<CategoryProvider>(context).childSelectedIndex;
    bool isSelected = selectedIndex == index ? true : false;

    return GestureDetector(
      onTap: () {
        BxMallSubDto model = list[index];
        Provider.of<CategoryProvider>(context, listen: false)
            .exposeChildSelectedIndex(index, model.mallSubId);

        _getCategoryGoodsListData(
          1,
          categoryId: model.mallCategoryId,
          categorySubId: model.mallSubId,
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: Text(
          bxMallSubDto.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isSelected ? Colors.pink : Colors.black,
          ),
        ),
      ),
    );
  }
}
