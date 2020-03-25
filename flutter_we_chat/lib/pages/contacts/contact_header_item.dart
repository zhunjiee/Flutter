/**
 * @ClassName contact_header_item
 * @Description 联系人分组头部item
 * @Author Houge
 * @Date 2020/3/25 10:14 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../common/common_color.dart';

class ContactHeaderItem extends StatelessWidget {
  ContactHeaderItem(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(left: 10),
      color: navThemeColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
