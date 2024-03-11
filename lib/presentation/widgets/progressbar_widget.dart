import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/providers/audio_player_provider.dart';

class ProgressbarWidget extends ConsumerWidget {
  const ProgressbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder(
        stream: ref.read(audioPlayerProvider).positionStream,
        builder: (context, snapshot) {
          return ProgressBar(
            progress: snapshot.data ?? Duration.zero,
            total: ref.watch(audioPlayerProvider).duration ?? Duration.zero,
            progressBarColor: Colors.red,
            baseBarColor: Colors.white.withOpacity(0.24),
            thumbColor: Colors.white,
            barHeight: 3.0,
            thumbRadius: 5.0,
            onSeek: (value) async {
              print('User selected a new time: $value');
              await ref.read(audioPlayerProvider).seek(value);
            },
          );
        });
  }
}
