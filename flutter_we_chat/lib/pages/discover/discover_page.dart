import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import '../../widgets/widget_custom_app_bar.dart';
import '../../model/discover_model.dart';
import '../../temp/discover_list_temp_data.dart';
import 'discover_list_tile.dart';
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
            return DiscoverListTile(
              model.assets,
              model.title,
              showSeparator: index == tempList.length - 1 ? false : !model.isDownDivider,
            );
          },
          separatorBuilder: (context, index) {
            DiscoverModel model = tempList[index];
            return model.isDownDivider ? Container(height: 10) : Container();
          },
          itemCount: tempList.length,
        ),
      ),
    );
  }
}
