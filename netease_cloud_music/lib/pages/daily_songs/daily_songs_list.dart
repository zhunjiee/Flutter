/**
 * @ClassName daily_songs_list
 * @Description 每日歌单 - 歌曲列表
 * @Author HouGe
 * @Date 2020-03-05 14:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../model/daily_songs_model.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/music_model.dart';
import '../../utils/navigator_utils.dart';

class DailySongsList extends StatelessWidget {
  DailySongsList(this.songsList);

  final List<Recommend> songsList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          var d = songsList[index];
          return PlaylistItem(
            MusicData(
              mvId: d.mvid,
              picUrl: d.album.picUrl,
              name: d.name,
              artists:
              "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}",
            ),
            onTap: () {
              // 播放单个音乐
              NavigatorUtils.goPlayMusicPage(context);
            },
          );
        },
        childCount: songsList.length,
      ),
    );
  }
}
