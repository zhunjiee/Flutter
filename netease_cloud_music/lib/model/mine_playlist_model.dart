/**
 * @ClassName mine_playlist_model
 * @Description TODO
 * @Author houge
 * @Date 2020/3/13 8:39 PM
 * @Version 1.0
 */

import 'playlist_model.dart';

class MinePlaylistModel {
  bool more;
  List<Playlist> playlist;
  int code;

  MinePlaylistModel({this.more, this.playlist, this.code});

  MinePlaylistModel.fromJson(Map<String, dynamic> json) {
    more = json['more'];
    if (json['playlist'] != null) {
      playlist = new List<Playlist>();
      json['playlist'].forEach((v) {
        playlist.add(new Playlist.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['more'] = this.more;
    if (this.playlist != null) {
      data['playlist'] = this.playlist.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}
