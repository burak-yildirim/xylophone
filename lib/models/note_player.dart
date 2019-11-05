import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class NotePlayer {
  AudioCache _audioCache;
  String _soundFile;

  NotePlayer(this._soundFile) {
    _build();
  }

  void _build() {
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
    } catch (ex, st) {
      print('Exception occured: $ex');
      print('StackTrace: $st');
      _audioCache.fixedPlayer
        ..release()
        ..dispose();
      print('\nrebuilding..');
      _build();
      await load();
      print('re-loaded');
      _audioCache.play(_soundFile);
    }
  }
}
