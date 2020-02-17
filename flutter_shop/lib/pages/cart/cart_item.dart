/**
 * @ClassName cart_item
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-16 12:45
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_count.dart';
import '../../provider/cart_provider.dart';

class CartItem extends StatelessWidget {
  CartItem(this.itemModel);

  final CartModel itemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 2, 5, 2),
      padding: EdgeInsets.fromLTRB(5, 10, 1, 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 0.5, color: Colors.black12),
          )),
      child: Row(
        children: <Widget>[
          _cartCheckBtn(context, itemModel),
          _cartImage(itemModel),
          _cartGoodsName(itemModel),
          _cartPrice(context, itemModel),
        ],
      ),
    );
  }

  // 多选按钮
  Widget _cartCheckBtn(BuildContext context, CartModel item) {
    return Container(
      child: Checkbox(
        value: item.isSelected,
        onChanged: (bool v) {
          item.isSelected = v;
          Provider.of<CartProvider>(context, listen: false).changeOneGoodsSelectedStatus(item);
        },
        activeColor: Colors.red,
      ),
    );
  }

  // 商品图片
  Widget _cartImage(CartModel item) {
    return Container(
      width: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Image.network(item.images),
    );
  }

  // 商品名称
  Widget _cartGoodsName(CartModel item) {
    return Container(
      width: ScreenUtil().setWidth(350),
      padding: EdgeInsets.all(10),
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            item.goodsName,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          CartCount(item),
        ],
      ),
    );
  }

  // 商品价格
  Widget _cartPrice(BuildContext context, CartModel item) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("¥${item.price}"),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      title: Text("确认删除该商品吗?"),
                      content: Text("${item.goodsName}x${item.count}"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消"),
                          onPressed: () => Navigator.of(context).pop(), // 关闭对话框
                        ),
                        FlatButton(
                          child: Text("删除"),
                          onPressed: () {
                            Provider.of<CartProvider>(context, listen: false).deleteOneGoods(item.goodsId);
                            //关闭对话框并返回true
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ],
                    ),
                );
              },
              child: Icon(
                Icons.delete_forever,
                color: Colors.black26,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
