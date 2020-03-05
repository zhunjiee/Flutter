/**
 * @ClassName top_list_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 14:23
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../widgets/custom_future_builder.dart';
import '../../utils/net_utils.dart';
import '../../model/top_list_model.dart';

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
          return Text("hh");
        },
      ),
    );
  }
}
