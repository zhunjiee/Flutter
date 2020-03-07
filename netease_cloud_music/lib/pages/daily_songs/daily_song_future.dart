/**
 * @ClassName daily_song_future
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-06 19:06
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/pages/daily_songs/daily_songs_list.dart';
import 'package:netease_cloud_music/widgets/widget_net_error.dart';
import '../../utils/net_utils.dart';
import '../../model/daily_songs_model.dart';
import 'daily_songs_navigator.dart';
import '../../widgets/widget_net_error.dart';

class DailySongsFuture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DailySongsModel>(
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
    );
  }
}
