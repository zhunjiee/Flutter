/**
 * @ClassName contact_model
 * @Description TODO
 * @Author Houge
 * @Date 2020/3/20 2:16 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';

class ContactModel {
  String url;
  int type;
  String name;
  String startLetter;

  ContactModel({this.type, this.url, this.name,this.startLetter});
}
