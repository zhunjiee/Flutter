/**
 * @ClassName add_model
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/20 10:42 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class AddListModel {
  List<AddModel> addList;

  AddListModel({this.addList});

  AddListModel.fromJson(Map<String, dynamic> json) {
    if (json['addList'] != null) {
      addList = new List<AddModel>();
      json['addList'].forEach((v){
        addList.add(AddModel.formJson(v));
      });
    }
  }
}

class AddModel {
  int icon;
  String name;

  AddModel({this.icon, this.name});

  AddModel.formJson(Map<String, dynamic> json) {
    icon = json['icon'];
    name = json['name'];
  }
}