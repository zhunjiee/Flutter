/**
 * @ClassName daily_songs_list
 * @Description TODO
 * @Author HouGe
 * @Date 2020-03-05 14:04
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../../model/daily_songs_model.dart';
import '../../widgets/widget_playlist_item.dart';
import '../../model/music_model.dart';
import '../../widgets/custom_sliver_future_builder.dart';
import '../../utils/net_utils.dart';

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
              songName: d.name,
              artists:
              "${d.artists.map((a) => a.name).toList().join('/')} - ${d.album.name}",
            ),
            onTap: () {
              print("播放音乐");
            },
          );
        },
        childCount: songsList.length,
      ),
    );
  }
}
