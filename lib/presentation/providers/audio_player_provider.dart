import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'audio_player_provider.g.dart';

@Riverpod(keepAlive: true)
AudioPlayer audioPlayer(AudioPlayerRef ref) {
  return AudioPlayer();
}

// / is playing or not
// final toogleprovider = StateProvider<int>((ref) => -1);

final currentIndexProvider =
    Provider<int?>((ref) => ref.read(audioPlayerProvider).currentIndex);

final isPlayingProvider =
    Provider<bool>((ref) => ref.read(audioPlayerProvider).playing);
