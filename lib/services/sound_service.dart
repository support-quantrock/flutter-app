import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class SoundService {
  static final SoundService _instance = SoundService._internal();
  factory SoundService() => _instance;
  SoundService._internal();

  final AudioPlayer _revealPlayer = AudioPlayer();
  final AudioPlayer _cheerPlayer = AudioPlayer();
  final AudioPlayer _beepPlayer = AudioPlayer();
  final AudioPlayer _boomPlayer = AudioPlayer();
  final AudioPlayer _goodPlayer = AudioPlayer();
  final AudioPlayer _bellPlayer = AudioPlayer();

  Future<void> _safePlay(AudioPlayer player, String path) async {
    try {
      await player.stop();
      await player.play(AssetSource(path));
    } catch (e) {
      debugPrint('Sound not available: $path');
    }
  }

  Future<void> playReveal() async {
    await _safePlay(_revealPlayer, 'sounds/reveal.mp3');
  }

  Future<void> playCheer() async {
    await _safePlay(_cheerPlayer, 'sounds/cheer.mp3');
  }

  Future<void> playBeep() async {
    await _safePlay(_beepPlayer, 'sounds/beep.mp3');
  }

  Future<void> playBoom() async {
    await _safePlay(_boomPlayer, 'sounds/boom.mp3');
  }

  Future<void> playGood() async {
    await _safePlay(_goodPlayer, 'sounds/good.mp3');
  }

  Future<void> playBell() async {
    await _safePlay(_bellPlayer, 'sounds/bell.mp3');
  }

  Future<void> playBellThreeTimes() async {
    for (int i = 0; i < 3; i++) {
      await playBell();
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }

  void dispose() {
    _revealPlayer.dispose();
    _cheerPlayer.dispose();
    _beepPlayer.dispose();
    _boomPlayer.dispose();
    _goodPlayer.dispose();
    _bellPlayer.dispose();
  }
}
