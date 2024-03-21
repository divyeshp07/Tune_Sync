import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:music_app/data/model/song_entity.dart';
import 'package:music_app/domain/use-case/fav_add_remove_use_case.dart';
import 'package:music_app/presentation/pages/popupmenuincard_screen.dart';
import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';
import 'package:music_app/presentation/providers/audio_player_provider.dart';
import 'package:music_app/presentation/providers/play_list_provider.dart';
import 'package:music_app/presentation/widgets/listtile_card_widget.dart';
import 'package:music_app/presentation/widgets/sliverappbar_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(audioPlayerProvider).positionStream.listen(
      (_) {
        ref.invalidate(currentIndexProvider);
        ref.invalidate(isPlayingProvider);
      },
    );

    return Scaffold(
      body: ref.watch(fetchaudiofilesProvider).when(
            data: (data) {
              List<String> listOfData = data.map((e) => e.data).toList();
              // creating a playlist for gaplessplay
              final ConcatenatingAudioSource playlist =
                  ConcatenatingAudioSource(
                      // Specify the playlist items
                      // children: data.map((audioFile) {
                      //   return AudioSource.uri(Uri.parse(audioFile.data));
                      // }).toList(),
                      children:
                          ref.read(getPlayListProvider(data: listOfData)));
              return CustomScrollView(
                slivers: [
                  SliverAppBarWidget(leadingOnTap: () {}),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: GestureDetector(
                          onTap: () {
                            ref
                                .read(audioPlayerProvider)
                                .setAudioSource(playlist, initialIndex: index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SongCardInnerScreen(
                                    displaytext:
                                        data.map((e) => e.title).toList()),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                child: Listtile_widget(
                                  title: data[index].title,
                                  artist: data[index].artist?.toString() ??
                                      '<unknown>',
                                  leading: const CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/ic_launcher.png'),
                                    radius: 27,
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FloatingActionButton.small(
                                        heroTag: 'card$index',
                                        onPressed: () async {
                                          ref
                                              .read(audioPlayerProvider)
                                              .setAudioSource(playlist,
                                                  initialIndex: index);

                                          if (ref.read(isPlayingProvider) &&
                                              ref.read(currentIndexProvider) ==
                                                  index) {
                                            await ref
                                                .read(audioPlayerProvider)
                                                .pause();
                                          } else {
                                            await ref
                                                .read(audioPlayerProvider)
                                                .play();
                                          }
                                        },
                                        child: ref.watch(isPlayingProvider) &&
                                                ref.watch(
                                                        currentIndexProvider) ==
                                                    index
                                            ? const Icon(Icons.pause)
                                            : const Icon(Icons.play_arrow),
                                      ),
                                      PopupmenuScreen(
                                          // delete: () {},
                                          // share: () {},
                                          addtoplaylist: () {},
                                          addtofav: () {
                                            ref
                                                .read(
                                                    faveSongDbProvider.notifier)
                                                .addSongs(SongsEntity(
                                                  auther: data[index]
                                                      .artist
                                                      .toString(),
                                                  title: data[index].title,
                                                ));
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                // clipBehavior: Clip.antiAlias,
                                                behavior:
                                                    SnackBarBehavior.floating,
                                                backgroundColor: Colors.green,
                                                content: Text(
                                                  'Added to Favorites',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ),
                                            );
                                            ref.invalidate(faveSongDbProvider);
                                          })
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      );
                    }, childCount: data.length),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => Center(
              child: Text(error.toString()),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
    );
  }
}
