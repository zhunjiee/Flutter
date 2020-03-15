/**
 * @ClassName mine_playlist_provider
 * @Description TODO
 * @Author houge
 * @Date 2020/3/13 9:11 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import '../model/playlist_model.dart';
import '../model/mine_playlist_model.dart';
import '../utils/net_utils.dart';
import '../model/user_model.dart';

class MinePlaylistProvider extends ChangeNotifier {
  UserModel user;

  // [我创建的歌单] 通过 [全部歌单] 对比userId是否相等来分离
  // userId不相等的即是 [我收藏的歌单]
  List<Playlist> _selfCreatePlaylist = []; // 我创建的歌单
  List<Playlist> _collectPlaylist = []; // 我收藏的歌单
  List<Playlist> _allPlaylist = []; // 全部歌单

  List<Playlist> get selfCreatePlaylist => _selfCreatePlaylist;
  List<Playlist> get collectPlaylist => _collectPlaylist;
  List<Playlist> get allPlaylist => _allPlaylist;

  /// 获取我的歌单
  Future getMinePlaylistData() async {
    MinePlaylistModel model = await NetUtils().getMinePlaylistData(user.account.id);
    setPlayList(model.playlist);
  }

  void setPlayList(List<Playlist> playlist) {
    _allPlaylist = playlist;
    _splitPlaylist();
  }

  void _splitPlaylist() {
    _selfCreatePlaylist =
        _allPlaylist.where((p) => p.creator.userId == user.account.id).toList();
    _collectPlaylist =
        _allPlaylist.where((p) => p.creator.userId != user.account.id).toList();
  }
}
