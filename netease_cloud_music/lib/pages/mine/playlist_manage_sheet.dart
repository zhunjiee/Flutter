/**
 * @ClassName playlist_manage_sheet
 * @Description TODO
 * @Author houge
 * @Date 2020/3/16 2:21 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netease_cloud_music/utils/common_text_style.dart';
import '../../model/playlist_model.dart';
import '../../model/mine_playlist_model.dart';

class PlaylistManageSheet extends StatefulWidget {
  PlaylistManageSheet(this.playlist);

  final Playlist playlist;

  @override
  _PlaylistManageSheetState createState() => _PlaylistManageSheetState();
}

class _PlaylistManageSheetState extends State<PlaylistManageSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ScreenUtil().setWidth(40)),
            topRight: Radius.circular(ScreenUtil().setWidth(40)),
          ),
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(100),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: ScreenUtil().setWidth(0.5), color: Colors.black26),
              ),
            ),
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
            alignment: Alignment.centerLeft,
            child: Text(
              "歌单:${widget.playlist.name}",
              style: common14GrayTextStyle,
            ),
          ),
          _buildItem("images/icon_edit.png", "编辑歌单信息"),
          _buildItem("images/icon_del.png", "删除", onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "删除",
                      style: bold16TextStyle,
                    ),
                    content: Text(
                      "确认删除吗?",
                      style: common14TextStyle,
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop("取消");
                        },
                        child: Text(
                          "取消",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop("删除");
                        },
                        child: Text(
                          "取消",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  );
                }).then((value) {
              print(value);
            });
          }),
        ],
      ),
    );
  }

  Widget _buildItem(String src, String title, {VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: ScreenUtil().setWidth(110),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setWidth(140),
              child: Align(
                child: Image.asset(
                  src,
                  width: ScreenUtil().setWidth(80),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: ScreenUtil().setWidth(109),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: ScreenUtil().setWidth(0.5), color: Colors.grey),
                  ),
                ),
                child: Text(
                  title,
                  style: common14TextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
