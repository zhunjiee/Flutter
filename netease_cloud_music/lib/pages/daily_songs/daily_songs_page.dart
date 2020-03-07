import 'package:flutter/cupertino.dart';
/**
 * @ClassName daily_songs
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-04 12:47
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:common_utils/common_utils.dart';
import 'package:netease_cloud_music/pages/daily_songs/daily_songs_list.dart';
import 'package:netease_cloud_music/widgets/widget_net_error.dart';
import '../../utils/net_utils.dart';
import '../../application.dart';
import '../play/play_widget.dart';
import '../../model/daily_songs_model.dart';
import 'daily_songs_navigator.dart';
import '../../widgets/custom_sliver_future_builder.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/daily_songs_model.dart';
import '../../model/music_model.dart';
import '../playlist/playlist_app_bar.dart';
import '../../widgets/widget_net_error.dart';
import '../../widgets/widget_loading.dart';

class DailySongsPage extends StatefulWidget {
  @override
  _DailySongsPageState createState() => _DailySongsPageState();
}

class _DailySongsPageState extends State<DailySongsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom:
                    ScreenUtil().setHeight(110) + Application.bottomBarHeight),
            child: FutureBuilder<DailySongsModel>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      // 导航栏
                      DailySongsNavigator(
                        count: snapshot.data.recommend.length,
                      ),
                      // 歌曲列表
                      DailySongsList(snapshot.data.recommend),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return CustomScrollView(
                    slivers: <Widget>[
                      // 导航栏
                      DailySongsNavigator(),
                      SliverToBoxAdapter(
                        child: NetErrorWidget(
                          callback: () {},
                        ),
                      ),
                    ],
                  );
                } else {
                  return CustomScrollView(
                    slivers: <Widget>[
                      // 导航栏
                      DailySongsNavigator(),
                      SliverToBoxAdapter(
                        child: Container(
                          alignment: Alignment.center,
                          height: ScreenUtil().setWidth(400),
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    ],
                  );
                }
              },
              future: NetUtils().getDailySongsData(context),
            ),
          ),
          BottomPlayWidget(),
        ],
      ),
    );
  }

}
