/**
 * @ClassName discover_model
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/20 3:16 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class DiscoverModel {
  String assets;
  String title;
  String imgUrl;
  bool isDownDivider; // 是否分组(底部大分隔条)

  DiscoverModel({this.assets, this.title, this.imgUrl,this.isDownDivider});
}