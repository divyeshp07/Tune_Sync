import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicFeatures {
  final AudioPlayer audioPlayer = AudioPlayer(); // Initialize audio player

  Future<void> play(SongModel play) async {
    try {
      await audioPlayer.setFilePath(play.data);
      await audioPlayer.play(); // Play the song
    } catch (e) {
      print("Error playing song: $e");
    }
  }

  Future<void> pause(SongModel pause) async {
    try {
      await audioPlayer.setFilePath(pause.data);
      await audioPlayer.pause();
    } catch (e) {
      print("Error pausing song: $e");
    }
  }
}

final musicPlayerStateProvider = StateProvider<bool>((ref) => false);
