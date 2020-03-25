/**
 * @ClassName contact_item
 * @Description 联系人单个item
 * @Author Houge
 * @Date 2020/3/25 10:12 AM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../widgets/widget_corner_radius_image.dart';

class ContactItem extends StatelessWidget {
  ContactItem(this.imgUrl, this.name);

  final String imgUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      padding: EdgeInsets.only(left: 10),
      color: Colors.white,
      child: RawMaterialButton(
        onPressed: () {},
        child: Row(
          children: <Widget>[
            CornerRadiusImage(
              imgUrl,
              width: 40,
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left:10),
              child: Text(
                name,
                style: TextStyle(fontSize: 15, color: Colors.black87),
              ),
            ),
          ],
        ),
        fillColor: Colors.white,
        elevation: 0,
        highlightElevation: 0,
      ),
    );
  }
}
