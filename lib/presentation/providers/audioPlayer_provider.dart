import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'audioPlayer_provider.g.dart';

@riverpod
class Player extends _$Player {
  @override
  AudioPlayer build() {
    return AudioPlayer();
  }
}

// final isPlayingProvider = StateProvider<bool>((ref) {
//   return false;
// });


// final iconDataProvider = Provider<IconData>((ref) {
//   final isPlaying = ref.watch(isPlayingProvider).state;
//   return isPlaying ? Icons.pause : Icons.play_arrow;
// });
