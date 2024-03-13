// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
// import 'package:music_app/presentation/providers/audio_player_provider.dart';
// import 'package:shimmer/shimmer.dart';

// class SongCardBtnsWidget extends ConsumerWidget {
//   const SongCardBtnsWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final audioplayer = ref.watch(audioPlayerProvider);
//     return ref.watch(fetchaudiofilesProvider).when(
//           data: (data) {
//             final playlist = ConcatenatingAudioSource(
//               // Start loading next item just before reaching it
//               useLazyPreparation: true,
//               // Customise the shuffle algorithm
//               shuffleOrder: DefaultShuffleOrder(),
//               // Specify the playlist items
//               children: data.map((audioFile) {
//                 return AudioSource.uri(Uri.parse(audioFile.data));
//               }).toList(),
//             );
//             return Column(

//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         audioplayer.setAudioSource(playlist);
//                         audioplayer.seekToPrevious();
//                       },
//                       icon: const Icon(
//                         Icons.skip_previous_rounded,
//                         size: 40,
//                       ),
//                     ),
//                     FloatingActionButton.large(
//                         heroTag: 'card inner',
//                         onPressed: () async {
//                           audioplayer.playing
//                               ? audioplayer.play()
//                               : audioplayer.pause();
//                         },
//                         child: audioplayer.playing
//                             ? const Icon(Icons.pause)
//                             : const Icon(Icons.play_arrow)),
//                     IconButton(
//                       onPressed: () {
//                         audioplayer.setAudioSource(playlist);
//                         audioplayer.seekToNext();
//                       },
//                       icon: const Icon(
//                         Icons.skip_next_rounded,
//                         size: 40,
//                       ),
//                     )
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     IconButton(
//                         onPressed: () {
//                 audioplayer.setAudioSource(playlist);
//                 audioplayer.setShuffleModeEnabled(true);
//               },
//               : () async {
//                 await audioplayer
//                     .setFilePath(data[index].data);
//                 audioplayer.setAudioSource(playlist);
//                 final isPlaying =
//                     ref.read(toogleprovider);
//                 if (isPlaying) {
//                   audioplayer.pause();
//                 } else {
//                   audioplayer.play();
//                 }
//                 ref.read(toogleprovider);
//                 !isPlaying;
//               },
//                         icon: const Icon(Icons.shuffle)),
//                     IconButton(
//                       onPressed: () {
//                         ref
//                             .watch(audioPlayerProvider)
//                             .setLoopMode(LoopMode.one);
//                       },
//                       icon: const Icon(Icons.repeat),
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.replay_10_rounded),
//                     ),
//                     IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.volume_up_rounded)),
//                   ],
//                 ),
//               ],
//             );
//           },
//           error: (error, stackTrace) => Center(
//             child: Text(error.toString()),
//           ),
//           loading: () => Shimmer.fromColors(
//             baseColor: Colors.grey,
//             highlightColor: Colors.white,
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: 40,
//                       height: 40,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       width: 56,
//                       height: 56,
//                       decoration: const BoxDecoration(
//                         shape: BoxShape.circle,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: 40,
//                       height: 40,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       color: Colors.white,
//                     ),
//                     Container(
//                       width: 40,
//                       height: 40,
//                       color: Colors.white,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:music_app/presentation/providers/audio_player_provider.dart';
import 'package:shimmer/shimmer.dart';

class SongCardBtnsWidget extends ConsumerWidget {
  const SongCardBtnsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioplayer = ref.watch(audioPlayerProvider);
    return ref.watch(fetchaudiofilesProvider).when(
          data: (data) {
            // final playlist = ConcatenatingAudioSource(
            //   // Specify the playlist items
            //   children: data.map((audioFile) {
            //     return AudioSource.uri(Uri.parse(audioFile.data));
            //   }).toList(),
            // );
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        // audioplayer.setAudioSource(playlist);
                        audioplayer.seekToPrevious();
                      },
                      icon: const Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                      ),
                    ),
                    FloatingActionButton.large(
                      heroTag: 'inner',
                      onPressed: () async {
                        audioplayer.playing
                            ? audioplayer.pause()
                            : audioplayer.play();
                        ref.invalidate(isPlayingProvider);
                      },
                      child: ref.watch(isPlayingProvider)
                          ? const Icon(
                              Icons.pause,
                              size: 55,
                            )
                          : const Icon(
                              Icons.play_arrow,
                              size: 55,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        // audioplayer.setAudioSource(playlist);
                        audioplayer.seekToNext();
                      },
                      icon: const Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        // audioplayer.setAudioSource(playlist);
                        audioplayer.setShuffleModeEnabled(true);
                      },
                      icon: const Icon(Icons.shuffle),
                    ),
                    IconButton(
                      onPressed: () {
                        audioplayer.setLoopMode(LoopMode.one);
                      },
                      icon: const Icon(Icons.repeat),
                    ),
                    IconButton(
                      onPressed: () {
                        audioplayer.seek(Duration(
                            seconds: audioplayer.position.inSeconds - 10));
                      },
                      icon: const Icon(Icons.replay_10_rounded),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement volume control functionality here
                      },
                      icon: const Icon(Icons.volume_up_rounded),
                    ),
                  ],
                ),
              ],
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(error.toString()),
          ),
          loading: () => Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
