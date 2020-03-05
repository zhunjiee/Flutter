/**
 * @ClassName discover_new_album
 * @Description 新碟上架
 * @Author HouGe
 * @Date 2020-02-28 13:38
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/h_placeholder_view.dart';
import '../../widgets/custom_future_builder.dart';
import '../../utils/net_utils.dart';
import '../../model/album_model.dart';
import '../../widgets/widget_playlist.dart';
import '../../widgets/widget_common_title.dart';

class DiscoverNewAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 标题
        CommonTitleWidget("新碟上架", top: 0,),
        // 新碟列表
        CustomFutureBuilder<AlbumModel>(
          builder: (context, data) {
            List<Albums> recommend = data.albums;
            return Container(
              height: ScreenUtil().setHeight(300),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return PlaylistWidget(
                    title: recommend[index].name,
                    url: recommend[index].picUrl,
                    maxLines: 2,
                    onTap: () {
                      print("跳转到播放列表页:$index");
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return HorizontalPlaceholderView(ScreenUtil().setWidth(30));
                },
                itemCount: recommend.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              ),
            );
          },
          futureFunc: NetUtils().getAlbumData,
        ),
      ],
    );
  }
}