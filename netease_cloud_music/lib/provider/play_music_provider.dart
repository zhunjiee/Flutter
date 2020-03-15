/**
 * @ClassName play_music_provider
 * @Description TODO
 * @Author houge
 * @Date 2020/3/8 12:29 PM
 * @Version 1.0
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../model/music_model.dart';
import '../application.dart';
import '../utils/fluro_convert_utils.dart';

class PlayMusicProvider extends ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();
  StreamController<String> _curPositionController = StreamController<String>.broadcast();

  List<MusicData> _songList = [];
  int _currentIndex = 0;
  Duration curSongDuration;
  AudioPlayerState _currentState;

  List<MusicData> get allSongs => _songList; // 播放列表全部歌曲
  MusicData get song => _songList[_currentIndex]; // 当前播放歌曲
  AudioPlayerState get playState => _currentState; // 播放状态
  Stream<String> get curPositionStream => _curPositionController.stream;  // 播放进度

  void init() {
    // 播放完后不释放资源
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    // 监听播放状态
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _currentState = state;
      // 播放完了自动播放下一首
      if (state == AudioPlayerState.COMPLETED) nextPlay();
      // 基本上就暂停/恢复会改变页面
      notifyListeners();
    });
    // 监听歌曲的总时间,可能需要一段时间，因为文件正在下载或缓冲中
    _audioPlayer.onDurationChanged.listen((duration) {
      curSongDuration = duration;
    });
    // 监听播放位置(进度)
    _audioPlayer.onAudioPositionChanged.listen((d) {
      sinkProgress(d.inMilliseconds > curSongDuration.inMilliseconds ? curSongDuration.inMilliseconds : d.inMilliseconds);
    });
  }

  /// 播放一首歌
  playSong(MusicData song) {
    List a = [1, 2, 3];
    a.insert(3, 4);
    print(a);
    _songList.insert(_currentIndex + 1, song);
    play();
  }

  /// 播放全部歌曲
  playAllSongs(List<MusicData> songs, {int index}) {
    _songList = songs;
    if (index != null) _currentIndex = index;
    play();
  }

  /// 暂停/恢复
  togglePlay() {
    if (_currentState == AudioPlayerState.PAUSED) {
      resumePlay(); // 恢复
    } else {
      pausePlay(); // 暂停
    }
  }

  /// 上一首
  prePlay() {
    if (_currentIndex <= 0) {
      // 跳到最后一首
      _currentIndex = _songList.length - 1;
    } else {
      _currentIndex--;
    }
    play();
  }

  /// 下一首
  nextPlay() {
    if (_currentIndex > _songList.length - 1) {
      // 跳到第一首
      _currentIndex = 0;
    } else {
      _currentIndex++;
    }
    play();
  }

  /// 播放进度
  void sinkProgress(int m) {
    _curPositionController.sink.add("$m-${curSongDuration.inMilliseconds}");
  }

  /// 跳转进度
  void seekPlay(int m) {
    _audioPlayer.seek(Duration(milliseconds: m));
    resumePlay();
  }

  // 播放音乐
  play() {
    _audioPlayer.play(
        "https://music.163.com/song/media/outer/url?id=${_songList[_currentIndex].id}.mp3");
    // 歌单存储到本地
    saveCurrentSongs();
  }

  // 恢复播放
  resumePlay() {
    _audioPlayer.resume();
  }

  // 暂停播放
  pausePlay() {
    _audioPlayer.pause();
  }

  // 保存歌曲列表
  saveCurrentSongs() {
    List songStrList = _songList.map((song) {
      FluroConvertUtils.object2string(song);
    }).toList();
    Application.sharedPreferences.setStringList("current_songs", songStrList);
    Application.sharedPreferences.setInt("current_index", _currentIndex);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _audioPlayer.dispose();
    _curPositionController.close();
  }
}
