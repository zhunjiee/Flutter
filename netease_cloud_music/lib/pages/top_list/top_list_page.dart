/**
 * @ClassName top_list_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 14:23
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:netease_cloud_music/pages/top_list/top_list_more.dart';
import '../../widgets/v_placeholder_view.dart';
import '../../widgets/custom_future_builder.dart';
import '../../utils/net_utils.dart';
import '../../model/top_list_model.dart';
import '../../widgets/widget_common_title.dart';
import 'top_list_official.dart';
import 'top_list_more.dart';

class TopListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("排行榜"),
      ),
      body: CustomFutureBuilder<TopListModel>(
        futureFunc: NetUtils().getTopListData,
        builder: (context, value){
          // 分离 官方榜单 与 更多榜单
          var officialData = value.topList.where((top)=>top.tracks.isNotEmpty).toList();
          var moreData = value.topList.where((top)=>top.tracks.isEmpty).toList();

          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CommonTitleWidget("官方榜", top: 30,bottom: 0,),
                OfficialTopList(officialData),
                VerticalPlaceholderView(30),
                CommonTitleWidget("更多榜单"),
                MoreTopList(moreData),
              ],
            ),
          );
        },
      ),
    );
  }
}
