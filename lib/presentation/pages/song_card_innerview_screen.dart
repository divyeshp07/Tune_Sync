import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:text_scroll/text_scroll.dart';

class SongCardInnerScreen extends ConsumerWidget {
  int songindex;

  SongCardInnerScreen({
    super.key,
    required this.songindex,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 300,
                  color: Colors.amber,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 50,
                  width: 300,
                  color: Colors.amber,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // Row(
          //   children: [
          //     Text(
          //       'ghdddhldjlkljlhkjbjvjbvbndcvb nmdg mdghjnkgjnd bh',
          //       style: TextStyle(fontSize: 20),
          //     ),
          //   ],
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              child: TextScroll(
                'This is the sample text for Flutter TextScroll widget gdhdljdqwjj ',
                style: TextStyle(fontSize: 20),
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(40, 0)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33),
            child: ProgressBar(
              progress: const Duration(milliseconds: 1000),
              buffered: const Duration(milliseconds: 2000),
              total: const Duration(milliseconds: 5000),
              progressBarColor: Colors.red,
              baseBarColor: Colors.white.withOpacity(0.24),
              bufferedBarColor: Colors.white.withOpacity(0.24),
              thumbColor: Colors.white,
              barHeight: 3.0,
              thumbRadius: 5.0,
              onSeek: (duration) {
                print('User selected a new time: $duration');
              },
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                      )),
                  FloatingActionButton.large(
                    onPressed: () {},
                    child: const Icon(
                      Icons.pause,
                      size: 50,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.repeat)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.shuffle)),
                ],
              ),
            ],
          )
          // ProgressBar(
          //   progress: progress,
          //   buffered: buffered,
          //   total: total,
          //   progressBarColor: Colors.red,
          //   baseBarColor: Colors.white.withOpacity(0.24),
          //   bufferedBarColor: Colors.white.withOpacity(0.24),
          //   thumbColor: Colors.white,
          //   barHeight: 3.0,
          //   thumbRadius: 5.0,
          //   onSeek: (duration) {
          //     // _player.seek(duration);
          //   },
          // )
        ],
      ),
    );
  }
}
