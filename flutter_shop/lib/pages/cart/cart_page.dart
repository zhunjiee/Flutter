import 'dart:convert';

/**
 * @ClassName cart_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-01 19:26
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: Center(
        child: Text("购物车"),
      ),
    );
  }
}
