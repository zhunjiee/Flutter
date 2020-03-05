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

class DailySongsPage extends StatefulWidget {
  @override
  _DailySongsPageState createState() => _DailySongsPageState();
}

class _DailySongsPageState extends State<DailySongsPage> {
  Future<DailySongsModel> future;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                bottom:
                    ScreenUtil().setHeight(110) + Application.bottomBarHeight),
            child: CustomScrollView(
              slivers: <Widget>[
                // 导航栏
                _dailySongsNavigateBar(),
                // 歌曲列表
                _songListView(),
              ],
            ),
          ),
          BottomPlayWidget(),
        ],
      ),
    );
  }

  /// 导航栏
  Widget _dailySongsNavigateBar() {
    return PlaylistAppBar(
      expandedHeight: ScreenUtil().setHeight(340),
      title: "每日推荐",
      backgroundImg: "images/bg_daily.png",
      count: 1,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Spacer(),
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(5)),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text:
                        "${DateUtil.formatDate(DateTime.now(), format: "dd")}",
                    style: TextStyle(fontSize: 30),
                  ),
                  TextSpan(
                    text:
                        "/ ${DateUtil.formatDate(DateTime.now(), format: "MM")}",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
            child: Text(
              '根据你的音乐口味，为你推荐好音乐。',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }

  /// 歌曲列表
  Widget _songListView() {
    return CustomSliverFutureBuilder<DailySongsModel>(
      futureFunc: NetUtils().getDailySongsData,
      builder: (context, value) {
        List<Recommend> list = value.recommend;
        return SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              var d = list[index];
              return PlaylistItem(
                MusicData(
                  mvId: d.mvid,
                  picUrl: d.album.picUrl,
                  songName: d.name,
                  artists:
                  "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}",
                ),
                onTap: () {},
              );
            },
            childCount: list.length,
          ),
        );
      },
    );
  }

  void _setCount(int count) {
    setState(() {
      future = NetUtils().getDailySongsData(context);
    });
  }
}
