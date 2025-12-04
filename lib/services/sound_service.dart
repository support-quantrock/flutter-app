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

  // Free sound URLs from soundjay.com and similar free sources
  static const String _revealUrl = 'https://www.soundjay.com/buttons/sounds/button-09a.mp3';
  static const String _cheerUrl = 'https://www.soundjay.com/human/sounds/applause-01.mp3';
  static const String _beepUrl = 'https://www.soundjay.com/buttons/sounds/button-10.mp3';
  static const String _boomUrl = 'https://www.soundjay.com/mechanical/sounds/explosion-01.mp3';
  static const String _goodUrl = 'https://www.soundjay.com/buttons/sounds/button-35.mp3';
  static const String _bellUrl = 'https://www.soundjay.com/bells/sounds/bell-ringing-01.mp3';

  Future<void> _safePlayUrl(AudioPlayer player, String url) async {
    try {
      await player.stop();
      await player.play(UrlSource(url));
    } catch (e) {
      debugPrint('Sound not available: $url');
    }
  }

  Future<void> playReveal() async {
    await _safePlayUrl(_revealPlayer, _revealUrl);
  }

  Future<void> playCheer() async {
    await _safePlayUrl(_cheerPlayer, _cheerUrl);
  }

  Future<void> playBeep() async {
    await _safePlayUrl(_beepPlayer, _beepUrl);
  }

  Future<void> playBoom() async {
    await _safePlayUrl(_boomPlayer, _boomUrl);
  }

  Future<void> playGood() async {
    await _safePlayUrl(_goodPlayer, _goodUrl);
  }

  Future<void> playBell() async {
    await _safePlayUrl(_bellPlayer, _bellUrl);
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
