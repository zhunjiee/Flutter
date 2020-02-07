/**
 * @ClassName category_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:25
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/provide/child_category.dart';
import 'package:provider/provider.dart';
import '../../config/http_request.dart';
import '../../model/category_model.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            LeftCategoryNavigator(),
            Column(
              children: <Widget>[
                RightCategoryNavigator(),
                Text("hahaha"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
* 左侧大类导航
* */
class LeftCategoryNavigator extends StatefulWidget {
  LeftCategoryNavigator({Key key}) : super(key: key);

  @override
  _LeftCategoryNavigatorState createState() => _LeftCategoryNavigatorState();
}

class _LeftCategoryNavigatorState extends State<LeftCategoryNavigator> {
  List categoryModelList = [];
  int selectIndex = 0;

  Widget _leftCategoryItem(int index) {
    CategoryModel model = categoryModelList[index];
    bool isSelected = (index == selectIndex) ? true : false;

    return GestureDetector(
      onTap: () {
        var childList = model.bxMallSubDto;
        // 2. 通过Provider曝光需要的值
        Provider.of<ChildCategory>(context, listen: false)
            .getChildCategoryList(childList);
        setState(() {
          selectIndex = index;
        });
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
            fontSize: ScreenUtil().setSp(26),
          ),
        ),
      ),
    );
  }

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

  // 网络请求 - 获取分类数据
  void _getCategoryData() {
    getCategory().then((value) {
      CategoryListModel listModel = CategoryListModel.fromList(value);
      setState(() {
        categoryModelList = listModel.categoryList;
        // 2. 通过Provider曝光需要的值 - 曝光初始值
        CategoryModel model = categoryModelList[0];
        Provider.of<ChildCategory>(context, listen: false)
            .getChildCategoryList(model.bxMallSubDto);
      });
    });
  }
}

/*
* 右侧小类导航
* */
class RightCategoryNavigator extends StatefulWidget {
  RightCategoryNavigator({Key key}) : super(key: key);

  @override
  _RightCategoryNavigatorState createState() => _RightCategoryNavigatorState();
}

class _RightCategoryNavigatorState extends State<RightCategoryNavigator> {
  Widget _rightCategoryItem(BxMallSubDto bxMallSubDto) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: Text(
          bxMallSubDto.mallSubName,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(26),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
          // 3. 读取值
          List list = Provider.of<ChildCategory>(context).childCategoryList;
          print("Provider = == = $list");
          return _rightCategoryItem(list[index]);
        },
        itemCount: Provider.of<ChildCategory>(context).childCategoryList.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
