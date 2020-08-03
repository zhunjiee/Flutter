/// @ClassName category_goods_list
/// @Description TODO
/// @Author HouGe
/// @Date 2020/8/1 4:06 PM
/// @Version 1.0

import 'package:flutter/material.dart';
import 'package:fluttershop2/provider/category_provider.dart';
import 'package:fluttershop2/utils/net_utils.dart';
import 'package:fluttershop2/widgets/widget_net_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../model/category_goods_model.dart';
import '../../provider/category_goods_list_provider.dart';
import '../../widgets/custom_refresh_header_footer.dart';

class CategoryGoodsList extends StatefulWidget {
  @override
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  EasyRefreshController _refreshController;
  ScrollController _scrollController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _refreshController = EasyRefreshController();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    // Provider读取值
    List<CategoryGoodsModel> list =
        Provider.of<CategoryGoodsListProvider>(context).goodsList;

    // 切换类别回到顶部
    try {
      if (Provider.of<CategoryProvider>(context).page == 1) {
        _scrollController.jumpTo(0.0);
      }
    } catch (e) {
      print('进入页面第一次初始化：$e');
    }

    // 加载更多数据 是否显示 "没有更多"
    _refreshController.finishLoad(noMore: Provider.of<CategoryProvider>(context).noMoreData);

    if (list != null) {
      return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(570),
          child: EasyRefresh(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _categoryGoodsItem(list[index]);
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
            header: CustomRefreshHeaderFooter.getHeader(),
            footer: CustomRefreshHeaderFooter.getFooter(),
            controller: _refreshController,
            enableControlFinishLoad: true,
          ),
        ),
      );
    } else {
      return Text("暂时没有商品数据哟~");
    }
  }

  void _getNewCategoryGoodsListData() {
    // 重置 页码 与 "没有更多" 提示
    Provider.of<CategoryProvider>(context, listen: false).resetPage();
    Provider.of<CategoryProvider>(context, listen: false).changeNoMoreData(false);

    int page = Provider.of<CategoryProvider>(context, listen: false).page;
    String categoryId = Provider.of<CategoryProvider>(context, listen: false).categoryId;
    String categorySubId =
        Provider.of<CategoryProvider>(context, listen: false).childCategoryId;

    NetUtils()
        .getCategoryGoodsData(page,
            categoryId: categoryId, categorySubId: categorySubId)
        .then((value) {
          Provider.of<CategoryGoodsListProvider>(context, listen: false).exposeGoodsList(value);
    });
  }

  void _getMoreCategoryGoodsListData() {
    // 增加页码
    Provider.of<CategoryProvider>(context, listen: false).addPage();

    int page = Provider.of<CategoryProvider>(context, listen: false).page;
    String categoryId = Provider.of<CategoryProvider>(context, listen: false).categoryId;
    String categorySubId =
        Provider.of<CategoryProvider>(context, listen: false).childCategoryId;

    NetUtils()
        .getCategoryGoodsData(page,
        categoryId: categoryId, categorySubId: categorySubId)
        .then((value) {
      if (value.length != 0) {
        Provider.of<CategoryGoodsListProvider>(context, listen: false).exposeMoreGoodsList(value);
      } else {
        Provider.of<CategoryProvider>(context, listen: false).changeNoMoreData(true);
      }
    });
  }

  Widget _categoryGoodsItem(CategoryGoodsModel model) {
    return GestureDetector(
      onTap: () {
        print(model.goodsName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12),
          ),
        ),
        child: Row(
          children: <Widget>[
            _goodsImage(model.image),
            Column(
              children: <Widget>[
                _goodsName(model.goodsName),
                _goodsPrice(model.presentPrice, model.oriPrice),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 商品图片
  Widget _goodsImage(String imgSrc) {
    return Container(
      padding: EdgeInsets.all(5),
      child: NetImageWidget(
        imgSrc,
        width: 200,
      ),
    );
  }

  // 商品名称
  Widget _goodsName(String name) {
    return Container(
      width: ScreenUtil().setWidth(350),
      padding: EdgeInsets.all(5),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  // 商品价格
  Widget _goodsPrice(double presentPrice, double oldPrice) {
    return Container(
      width: ScreenUtil().setWidth(350),
      padding: EdgeInsets.all(5),
      child: Row(
        children: <Widget>[
          Text(
            "价格: ¥$presentPrice",
            style: TextStyle(color: Colors.pink, fontSize: 15),
          ),
          Text(
            "¥$oldPrice",
            style: TextStyle(
                color: Colors.black12, decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }
}
