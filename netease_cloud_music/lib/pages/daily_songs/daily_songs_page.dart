import 'package:flutter/cupertino.dart';
/**
 * @ClassName daily_songs
 * @Description 每日歌单
 * @Author HouGe
 * @Date 2020-03-04 12:47
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/model/music_model.dart';
import 'package:netease_cloud_music/pages/daily_songs/daily_songs_list.dart';
import 'package:netease_cloud_music/widgets/widget_net_error.dart';
import 'package:provider/provider.dart';
import '../../utils/net_utils.dart';
import '../../application.dart';
import '../bottom_play/bottom_play_widget.dart';
import '../../model/daily_songs_model.dart';
import 'daily_songs_navigator.dart';
import '../../widgets/widget_net_error.dart';
import '../../utils/navigator_utils.dart';
import '../../provider/play_music_provider.dart';

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
                    ScreenUtil().setWidth(110) + Application.bottomBarHeight),
            child: FutureBuilder<DailySongsModel>(
              builder: (context, snapshot) {
                /// 加载完成...
                if (snapshot.hasData) {
                  List<Recommend> recommendList = snapshot.data.recommend;
                  return CustomScrollView(
                    slivers: <Widget>[
                      // 导航栏
                      DailySongsNavigator(
                        count: recommendList.length,
                        playAllOnTap: () {
                          // 点击播放全部, 从第1首开始播放
                          playSongs(context, recommendList, 0);
                        },
                      ),
                      // 歌曲列表
                      DailySongsList(snapshot.data.recommend,
                        onTap: (index){
                        // 点击单首歌曲,从该首歌曲开始播放
                        playSongs(context, recommendList, index);
                      },),
                    ],
                  );
                } else if (snapshot.hasError) {
                  /// 错误...
                  return CustomScrollView(
                    slivers: <Widget>[
                      DailySongsNavigator(),
                      SliverToBoxAdapter(
                        child: NetErrorWidget(
                          callback: () {},
                        ),
                      ),
                    ],
                  );
                } else {
                  /// 加载中...
                  return CustomScrollView(
                    slivers: <Widget>[
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
              future: NetUtils().getDailySongsData(),
            ),
          ),
          BottomPlayWidget(),
        ],
      ),
    );
  }

  void playSongs(BuildContext context, List<Recommend> recommendList, int index) {
    List<MusicData> songsList = recommendList
        .map(
          (d) => MusicData(
        id: d.id,
        name: d.name,
        picUrl: d.album.picUrl,
        artists:
        "${d.artists.map((a) => a.name).toList().join("/")}",
      ),
    )
        .toList();
    Provider.of<PlayMusicProvider>(context, listen: false)
        .playAllSongs(songsList, index: index);
    NavigatorUtils.goPlayMusicPage(context);
  }
}
