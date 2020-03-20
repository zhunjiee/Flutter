import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../widgets/widget_custom_app_bar.dart';

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: _buildDiscoverListTile("images/ic_social_circle.png", true),
      ),
    );
  }

  Widget _buildDiscoverListTile(
    String src, bool showSeparateLine
  ) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              child: Image.asset(src, width: 28, height: 28),
            ),
            Expanded(child: Text("haha")),
            Container(
              width: 30,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 15,
              ),
            ),
          ],
        ),
        // 分割线
        Container(
          margin: EdgeInsets.only(left: 50),
          height: ScreenUtil().setWidth(0.5),
          color: showSeparateLine ? Colors.grey[400] : Colors.transparent,
        ),
      ],
    );
  }
}
