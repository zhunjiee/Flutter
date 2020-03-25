import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../discover/discover_item.dart';
import '../../model/mine_model.dart';
import '../../temp/mine_list_temp_data.dart';
import '../../common/common_color.dart';
import 'mine_header.dart';

class MinePage extends StatelessWidget {
  final List<MineModel> tempList = MineListTempData.mock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_camera, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            MineHeader(),
            Container(height: 10),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                MineModel model = tempList[index];
                return DiscoverItem(
                  model.assets,
                  model.title,
                  showSeparator: index == tempList.length - 1
                      ? false
                      : !model.isDownDivider,
                );
              },
              separatorBuilder: (context, index) {
                MineModel model = tempList[index];
                return model.isDownDivider
                    ? Container(height: 10)
                    : Divider(
                        color: Colors.grey[600],
                        indent: ScreenUtil().setWidth(70),
                        thickness: 0.3, // 这才是分割线的宽度
                        height: 0, // 分割线的默认上下距离设为0
                      );
              },
              itemCount: tempList.length,
            ),
          ],
        ),
      ),
    );
  }
}
