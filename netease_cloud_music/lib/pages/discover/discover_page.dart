/**
 * @ClassName home_page
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-19 23:07
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../widgets/v_placeholder_view.dart';
import 'discover_banner.dart';
import 'discover_category.dart';
import 'discover_recommend_playlist.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with AutomaticKeepAliveClientMixin {
  Map categoryMap = {
    "每日推荐": "images/icon_daily.png",
    "歌单": "images/icon_playlist.png",
    "排行榜": "images/icon_rank.png",
    "电台": "images/icon_radio.png",
    "直播": "images/icon_look.png",
  };

  @override
  // 保持页面状态,切换时不重新加载
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("发现");
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            DiscoverBanner(),
            VerticalPlaceholderView(30),
            DiscoverCategory(categoryMap),
            DiscoverRecommendPlaylist(),
          ],
        ),
      ),
    );
  }
}

