/**
 * @ClassName cart_page
 * @Description TODO
 * @Author Houge
 * @Date 2020/6/12 8:57 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Container(
        child: Center(
          child: Text(
            "购物车",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
