import 'package:flutter/services.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class NotePlayer {
  AudioCache _audioCache;
  String _soundFile;

  NotePlayer(int index) {
    _soundFile = 'note$index.wav';
    _init();
  }

  void _init() {
    var audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY)
      ..setReleaseMode(ReleaseMode.STOP);
    _audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  Future<void> load() async {
    await _audioCache.load(_soundFile);
  }

  Future<void> play() async {
    try {
      await _audioCache.play(_soundFile);
    } on PlatformException catch (ex) {
      print('Caught exception: $ex');
      _init();
      await load();
      print('re-loaded');
      _audioCache.play(_soundFile);
    } catch (ex, st) {
      print('Exception occured: $ex');
      print('StackTrace: $st');
    }
  }
}
