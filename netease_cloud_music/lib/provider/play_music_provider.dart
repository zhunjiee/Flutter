import 'dart:async';
import 'dart:math';

/**
 * @ClassName play_music_provider
 * @Description TODO
 * @Author houge
 * @Date 2020/3/8 12:29 PM
 * @Version 1.0
 */

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../model/music_model.dart';

class PlayMusicProvider extends ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();
  StreamController _curPositionController = StreamController.broadcast();

  List<MusicData> _musicList = [];
  int _currentIndex = 0;
  Duration currentDuration;
  AudioPlayerState _currentState;

  List<MusicData> get allSongs => _musicList; // 播放列表全部歌曲
  MusicData get song => _musicList[_currentIndex]; // 当前播放歌曲
  AudioPlayerState get playState => _currentState; // 播放状态

  void init() {
    // 播放完后不释放资源
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);
    // 监听播放状态
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _currentState = state;
      // 播放完了自动播放下一首
      if (state == AudioPlayerState.COMPLETED) nextPlay();

      notifyListeners();
    });
    // 监听播放进度
    _audioPlayer.onAudioPositionChanged.listen((position) {});
    // 监听播放到的时间
    _audioPlayer.onDurationChanged.listen((duration) {});
  }

  // 播放一首歌
  playSong(MusicData song) {
    _musicList.insert(_currentIndex, song);
    play();
  }

  // 播放全部歌曲
  playAllSongs(List<MusicData> songs, {int index}) {
    _musicList = songs;
    if (index != null) _currentIndex = index;
    play();
  }

  /// 暂停/恢复
  togglePlay() {
    if (_currentState == AudioPlayerState.PAUSED) {
      resumePlay(); // 恢复
    } else {
      pausePlay();  // 暂停
    }
  }

  /// 上一首
  prePlay() {
    if (_currentIndex <= 0) {
      // 跳到最后一首
      _currentIndex = _musicList.length - 1;
    } else {
      _currentIndex--;
    }
    play();
  }

  /// 下一首
  nextPlay() {
    if (_currentIndex > _musicList.length - 1) {
      // 跳到第一首
      _currentIndex = 0;
    } else {
      _currentIndex++;
    }
    play();
  }


  // 播放音乐
  play() {
    _audioPlayer.stop().then((v){
      _audioPlayer.play(
          "https://music.163.com/song/media/outer/url?id=${_musicList[_currentIndex].id}.mp3");
    });
  }

  // 恢复播放
  resumePlay() {
    _audioPlayer.resume();
  }

  // 暂停播放
  pausePlay() {
    _audioPlayer.pause();
  }
}
