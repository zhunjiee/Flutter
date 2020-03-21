import 'dart:convert';

/**
 * @ClassName cart_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/cart_provider.dart';
import '../../model/cart_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart_item.dart';
import 'cart_bottom.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  top: 0,
                  right: 0,
                  bottom: ScreenUtil().setWidth(100),
                  child: Consumer<CartProvider>(builder: (context, cartProvider, _){
                    List<CartModel> cartList = cartProvider.cartList;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return CartItem(cartList[index]);
                      },
                      itemCount: cartList.length,
                    );
                  }),
                ),
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: CartBottom(),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: _getCartInfo(context),
      ),
    );
  }

  // 从preference读取本地存储数据
  Future<String> _getCartInfo(BuildContext context) async {
    await Provider.of<CartProvider>(context).getCartInfo();
    return "end";
  }
}
