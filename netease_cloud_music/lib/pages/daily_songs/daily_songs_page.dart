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
import '../../utils/net_utils.dart';
import '../../application.dart';
import '../play/play_widget.dart';
import '../playlist/playlist_app_bar.dart';
import '../../widgets/custom_sliver_future_builder.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/daily_songs_model.dart';
import '../../model/music_model.dart';

class DailySongsPage extends StatefulWidget {
  @override
  _DailySongsPageState createState() => _DailySongsPageState();
}

class _DailySongsPageState extends State<DailySongsPage> {
  DailySongsModel _data;
  int _count;

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
                _playlistNavigatorBar(),
                // 歌曲列表
                _musicListView(),
              ],
            ),
          ),
          BottomPlayWidget(),
        ],
      ),
    );
  }

  Widget _playlistNavigatorBar() {
    return PlaylistAppBar(
      expandedHeight: ScreenUtil().setHeight(340),
      title: "每日推荐",
      backgroundImg: "images/bg_daily.png",
      count: _count,
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

  Widget _musicListView() {
    return CustomSliverFutureBuilder<DailySongsModel>(
        futureFunc: NetUtils().getRecommendDailyData,
        builder: (context, value) {
          _setCount(value.recommend.length);
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var d = value.recommend[index];
                return PlaylistItem(
                  MusicData(
                      mvId: d.mvid,
                      picUrl: d.album.picUrl,
                      songName: d.name,
                      artists:
                      "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}",
                  ),
                  onTap: (){},
                );
              },
              childCount: value.recommend.length,
            ),
          );
        });
  }

  void _setCount(int count){
    Future.delayed(Duration(milliseconds: 50), (){
      if (mounted) {
          setState(() {
            _count = count;
          });
      }
    });
  }
}
