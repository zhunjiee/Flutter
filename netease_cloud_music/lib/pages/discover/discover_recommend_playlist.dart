/**
 * @ClassName recommend_playlist
 * @Description TODO
 * @Author HouGe
 * @Date 2020-02-27 14:51
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/custom_future_builder.dart';
import '../../utils/net_utils.dart';
import '../../model/recommend_playlist_model.dart';
import '../../widgets/widget_playlist.dart';

class DiscoverRecommendPlaylist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomFutureBuilder<RecommendPlaylistModel>(
      builder: (context, data) {
        List<Recommend> recommend = data.recommend;
        print(recommend);
        return Container(
          height: ScreenUtil().setHeight(300),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return PlaylistWidget(
                title: recommend[index].name,
                url: recommend[index].picUrl,
                playCount: recommend[index].playCount,
                maxLines: 2,
                onTap: () {
                  print("跳转到播放列表页");
                },
              );
            },
            separatorBuilder: (context, index) {
              return HorizontalPlaceholderView(ScreenUtil().setWidth(30));
            },
            itemCount: recommend.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
          ),
        );
      },
      future: NetUtils().getRecommendPlaylist,
    );
  }
}
