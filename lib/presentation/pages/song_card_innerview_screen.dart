import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/widgets/progressbar_widget.dart';
import 'package:music_app/presentation/widgets/songcardinnerviewbuttons_widget.dart';
import 'package:text_scroll/text_scroll.dart';

class SongCardInnerScreen extends ConsumerWidget {
  final String displaytext;
  const SongCardInnerScreen({super.key, required this.displaytext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        fit: StackFit.expand,
        children: [
          Container(
            color: Colors.amber,
          ),
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.0)
                ],
                stops: const [0.0, 0.4, 0.6],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 22,
            child: SizedBox(
              width: 350,
              height: 250,
              child: Column(
                children: [
                  SizedBox(
                    child: TextScroll(
                      displaytext,
                      style: const TextStyle(fontSize: 20),
                      mode: TextScrollMode.endless,
                      velocity: const Velocity(pixelsPerSecond: Offset(40, 0)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const ProgressbarWidget(),
                  const SongCardBtnsWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
