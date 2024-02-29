// // import 'package:just_audio/just_audio.dart';
// // import 'package:on_audio_query/on_audio_query.dart';

// // class PlaytheMusic {
// //   final audioPlayer = AudioPlayer();
// //   Future<void> play(SongModel song) async {
// //     await audioPlayer.setFilePath(song.data);
// //     audioPlayer.play();
// //   }
// // }

import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PlaytheMusic {
  final AudioPlayer audioPlayer = AudioPlayer(); // Initialize audio player

  Future<void> play(SongModel song) async {
    try {
      await audioPlayer.setFilePath(song.data);
      await audioPlayer.play(); // Play the song
    } catch (e) {
      print("Error playing song: $e");
    }
  }
}
