import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:text_scroll/text_scroll.dart';

class SongCardInnerScreen extends StatelessWidget {
  const SongCardInnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  icon: Icon(Icons.favorite),
                ),
              ],
            ),
          ),
          SizedBox(
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
          SizedBox(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              child: TextScroll(
                'This is the sample text for Flutter TextScroll widget gdhdljdqwjj ',
                style: TextStyle(fontSize: 20),
                mode: TextScrollMode.endless,
                velocity: Velocity(pixelsPerSecond: Offset(40, 0)),
              ),
            ),
          ),
          SizedBox(
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
                      icon: Icon(
                        Icons.skip_previous_rounded,
                        size: 40,
                      )),
                  FloatingActionButton.large(
                    onPressed: () {},
                    child: Icon(
                      Icons.pause,
                      size: 50,
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.skip_next_rounded,
                        size: 40,
                      ))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
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
