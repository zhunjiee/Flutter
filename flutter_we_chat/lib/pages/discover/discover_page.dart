import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../widgets/widget_custom_app_bar.dart';
import '../../model/discover_model.dart';
import '../../temp/discover_list_temp_data.dart';
import 'discover_item.dart';
import '../../common/common_color.dart';

class DiscoverPage extends StatelessWidget {
  final List<DiscoverModel> tempList = DiscoverListTempData.mock();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            DiscoverModel model = tempList[index];
            return DiscoverItem(
              model.assets,
              model.title,
              showSeparator:
                  index == tempList.length - 1 ? false : !model.isDownDivider,
            );
          },
          separatorBuilder: (context, index) {
            DiscoverModel model = tempList[index];
            return model.isDownDivider
                ? Container(height: 10)
                : Divider(
                    indent: ScreenUtil().setWidth(70),
                    thickness: 0.3, // 这才是分割线的宽度
                    color: Colors.grey[600],
                    height: 0, // 分割线的默认上下距离设为0
                  );
          },
          itemCount: tempList.length,
        ),
      ),
    );
  }
}
