/**
 * @ClassName category_goods_list
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-09 16:00
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../config/common_api.dart';
import '../../provider/category_provider.dart';
import '../../model/category_goods_list_model.dart';
import '../../provider/category_goods_list_provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../../routers/application.dart';
import '../detail/detail_page.dart';

/*
* 分类商品列表,可以上拉加载
* */
class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  ScrollController _scrollController;
  EasyRefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _refreshController = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    // Provider读值
    List list = Provider.of<CategoryGoodsListProvider>(context).goodsList;

    // 切换类别回到顶部
    try {
      if (Provider.of<CategoryProvider>(context).page == 1) {
        _scrollController.jumpTo(0.0);
      }
    } catch (e) {
      print('进入页面第一次初始化：$e');
    }

    // 加载更多数据 是否显示 没有更多
    _refreshController.finishLoad(
        noMore: Provider.of<CategoryProvider>(context, listen: false).noMore);

    // 用Expanded解决 "The method '>' was called on null" 的bug
    if (list != null) {
      return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(570),
          child: EasyRefresh(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _categoryGoodsItem(context, list, index);
              },
              itemCount: list.length,
              controller: _scrollController,
            ),
            onRefresh: () async {
              _getNewCategoryGoodsListData();
            },
            onLoad: () async {
              _getMoreCategoryGoodsListData();
            },
            header: ClassicalHeader(
              refreshText: "下拉刷新",
              refreshReadyText: "松手刷新",
              refreshingText: "正在刷新中...",
              refreshedText: "刷新完成",
              refreshFailedText: "刷新失败",
              noMoreText: "没有相关数据",
              showInfo: false, // 不显示时间
              enableHapticFeedback: false, // 取消震动反馈
            ),
            footer: ClassicalFooter(
              // 如何显示中文还没找到好的办法
              loadText: "上拉加载更多",
              loadReadyText: "松手加载",
              loadingText: "正在加载中...",
              loadedText: "加载完成",
              loadFailedText: "加载失败",
              noMoreText: "已经到底了",
              showInfo: false, // 不显示时间
              enableInfiniteLoad: false, // 取消无限加载,隐藏footer
              enableHapticFeedback: false, // 取消震动反馈
            ),
            controller: _refreshController,
          ),
        ),
      );
    } else {
      return Text("暂时没有商品数据");
    }
  }

// ------------------------ 网络请求 ------------------------

  //  获取分类下的商品列表数据
  void _getNewCategoryGoodsListData() {
    Provider.of<CategoryProvider>(context, listen: false).reloadPage();
    Provider.of<CategoryProvider>(context, listen: false).changeNoMore(false);

    // 网络请求
    getCategoryGoodsListData(
      Provider.of<CategoryProvider>(context, listen: false).page,
      categoryId:
          Provider.of<CategoryProvider>(context, listen: false).categoryId,
      categorySubId:
          Provider.of<CategoryProvider>(context, listen: false).categorySubId,
    ).then((value) {
      List goodsList = CategoryGoodsListModel.fromList(value).goodsList;
      Provider.of<CategoryGoodsListProvider>(context, listen: false)
          .exposeGoodsList(goodsList);
    });
  }

  //  获取分类下的商品列表数据
  void _getMoreCategoryGoodsListData() async {
    // page++
    Provider.of<CategoryProvider>(context, listen: false).addPage();

    // 网络请求
    getCategoryGoodsListData(
      Provider.of<CategoryProvider>(context, listen: false).page,
      categoryId:
          Provider.of<CategoryProvider>(context, listen: false).categoryId,
      categorySubId:
          Provider.of<CategoryProvider>(context, listen: false).categorySubId,
    ).then((value) {
      List goodsList = CategoryGoodsListModel.fromList(value).goodsList;
      if (goodsList == null) {
        Provider.of<CategoryProvider>(context, listen: false)
            .changeNoMore(true);
        Fluttertoast.showToast(msg: "已经到底啦");
      } else {
        Provider.of<CategoryGoodsListProvider>(context, listen: false)
            .exposeMoreGoodsList(goodsList);
      }
    });
  }

// ------------------------ 子组件 ------------------------

  Widget _categoryGoodsItem(BuildContext context, List list, int index) {
    CategoryGoodsModel model = list[index];
    String src = model.image;
    String name = model.goodsName;
    double presentPrice = model.presentPrice;
    double oldPrice = model.oriPrice;

    return GestureDetector(
      onTap: () {
//        // 自带路由
//        Navigator.of(context).push(
//          MaterialPageRoute(
//            builder: (context) {
//              return GoodsDetail(model.goodsId);
//            },
//          ),
//        );

        // fluro路由方式
        Application.router.navigateTo(context, "/detail?id=${model.goodsId}");
      },
      child: Container(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(src),
            Column(
              children: <Widget>[
                _goodsName(name),
                _goodsPrice(presentPrice, oldPrice),
              ],
            ),
          ],
        ),
      ),
    );
  }

//  商品图片
  Widget _goodsImage(String src) {
    return Container(
      width: ScreenUtil().setWidth(200),
      padding: EdgeInsets.only(left: 5),
      child: Image.network(src),
    );
  }

  // 商品名称
  Widget _goodsName(String goodsName) {
    return Container(
      width: ScreenUtil().setWidth(370),
      padding: EdgeInsets.all(5),
      child: Text(
        goodsName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: ScreenUtil().setSp(28)),
      ),
    );
  }

// 商品价格
  Widget _goodsPrice(double presentPrice, double oldPrice) {
    return Container(
      width: ScreenUtil().setWidth(370),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text(
            "价格:¥$presentPrice",
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(30),
            ),
          ),
          Text(
            "¥$oldPrice",
            style: TextStyle(
              color: Colors.black26,
              decoration: TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
}
