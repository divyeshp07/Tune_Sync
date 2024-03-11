// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
// import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';
// import 'package:music_app/presentation/providers/audio_player_provider.dart';
// import 'package:music_app/presentation/widgets/popupnenu_widget.dart';

// class HomePage extends ConsumerWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final audioPlayer = ref.watch(audioPlayerProvider);

//     return Scaffold(
//       body: ref.watch(fetchaudiofilesProvider).when(
//             data: (data) {
//               final playlist = ConcatenatingAudioSource(
//                 useLazyPreparation: true,
//                 shuffleOrder: DefaultShuffleOrder(),
//                 children: data.map((element) {
//                   return AudioSource.uri(Uri.parse(element.data));
//                 }).toList(),
//               );
//               return CustomScrollView(
//                 slivers: [
//                   SliverAppBar(
//                     leading: IconButton(
//                       onPressed: () {},
//                       icon: const Icon(Icons.menu),
//                     ),
//                     actions: [
//                       IconButton(
//                         onPressed: () {},
//                         icon: const Icon(Icons.search),
//                       ),
//                     ],
//                     pinned: true,
//                     expandedHeight: 340.0,
//                     flexibleSpace: ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(50),
//                         bottomRight: Radius.circular(50),
//                       ),
//                       child: FlexibleSpaceBar(
//                         title: Padding(
//                           padding: const EdgeInsets.only(left: 30.8),
//                           child: Text(
//                             'Tidal',
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.pacifico(fontSize: 30),
//                           ),
//                         ),
//                         background: Stack(
//                           fit: StackFit.expand,
//                           children: [
//                             Container(
//                               padding: const EdgeInsets.all(16.0),
//                               decoration: const BoxDecoration(
//                                 gradient: LinearGradient(
//                                   colors: [
//                                     Colors.deepPurple,
//                                     Colors.deepPurpleAccent
//                                   ],
//                                   begin: Alignment.topCenter,
//                                   end: Alignment.bottomCenter,
//                                 ),
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   const SizedBox(height: kToolbarHeight),
//                                   Text(
//                                     'Now Playing',
//                                     textAlign: TextAlign.center,
//                                     style: GoogleFonts.abhayaLibre(
//                                       fontSize: 20.0,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 10.0),
//                                   const CircleAvatar(
//                                     radius: 125,
//                                     //   backgroundImage: NetworkImage(
//                                     //       'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
//                                     // ),
//                                   ),
//                                   const SizedBox(height: 10.0),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   SliverList(
//                     delegate: SliverChildBuilderDelegate(
//                       (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(top: 14),
//                           child: InkWell(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(builder: (context) {
//                                   return SongCardInnerScreen();
//                                 }),
//                               );
//                             },
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(32)),
//                               child: ListTile(
//                                 leading: const CircleAvatar(
//                                   // backgroundImage: NetworkImage(
//                                   //     'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
//                                   radius: 23,
//                                 ),
//                                 title: Text(
//                                   data[index].title,
//                                   style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 15),
//                                 ),
//                                 subtitle: Row(
//                                   children: [
//                                     Text(
//                                       truncateArtistName(
//                                           data[index].artist.toString()),
//                                       overflow: TextOverflow.ellipsis,
//                                       style: const TextStyle(fontSize: 12),
//                                     ),
//                                   ],
//                                 ),
//                                 trailing: Row(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     FloatingActionButton(
//                                       onPressed: () {
//                                         audioPlayer
//                                             .setFilePath(data[index].data);
//                                         // final isPlaying = ref
//                                         //     .read(toogleprovider.notifier)
//                                         //     .state;
//                                         if (ref.watch(toogleprovider)) {
//                                           audioPlayer.pause();
//                                         } else {
//                                           audioPlayer.play();
//                                         }
//                                         // ref
//                                         //     .read(toogleprovider.notifier)
//                                         //     .state = !isPlaying;
//                                       },
//                                       child: Consumer(
//                                         builder: (context, watch, _) {
//                                           final isPlaying =
//                                               ref.watch(toogleprovider);
//                                           return isPlaying
//                                               ? const Icon(Icons.pause)
//                                               : const Icon(Icons.play_arrow);
//                                         },
//                                       ),
//                                     ),
//                                     PopupMenuWidget(
//                                       share: () {},
//                                       addtofav: () {},
//                                       addtoplayist: () {},
//                                       delete: () {},
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       childCount: data.length,
//                     ),
//                   ),
//                 ],
//               );
//             },
//             error: (error, stackTrace) => Center(
//               child: Text(error.toString()),
//             ),
//             loading: () => const Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//     );
//   }

//   String truncateArtistName(String artistName) {
//     List<String> words = artistName.split(' ');
//     if (words.length > 3) {
//       return '${words[0]} ${words[3]}';
//     } else {
//       return artistName;
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:music_app/data/model/song_entity.dart';
import 'package:music_app/domain/use-case/fav_add_remove_use_case.dart';
import 'package:music_app/presentation/pages/favsongs_screen.dart';
import 'package:music_app/presentation/pages/llibrary_screen.dart';
import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';
import 'package:music_app/presentation/providers/audio_player_provider.dart';
import 'package:music_app/presentation/widgets/bootom_navbar_widget.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScrollController scrollController = ScrollController();
    // ref.invalidate(toogleprovider);
    // ref.invalidate(audioPlayerProvider);
    // final audioPlayer = ref.watch(audioPlayerProvider);

    ref.watch(audioPlayerProvider).positionStream.listen(
      (_) {
        ref.invalidate(currentIndexProvider);
        ref.invalidate(isPlayingProvider);
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ref.watch(fetchaudiofilesProvider).when(
              data: (data) {
                final playlist = ConcatenatingAudioSource(
                  // Specify the playlist items
                  children: data.map((audioFile) {
                    return AudioSource.uri(Uri.parse(audioFile.data));
                  }).toList(),
                );
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const LiabraryWidget()));
                        },
                        icon: const Icon(Icons.menu),
                      ),
                      pinned: true,
                      expandedHeight: 340.0,
                      flexibleSpace: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                        child: FlexibleSpaceBar(
                          title: Padding(
                            padding: const EdgeInsets.only(
                              left: 45.8,
                            ),
                            child: Text(
                              'Tidal',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.pacifico(
                                  fontSize: 30, color: Colors.black),
                            ),
                          ),
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16.0),
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurpleAccent
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: kToolbarHeight),
                                    Text(
                                      'Now Playing',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.abhayaLibre(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    const CircleAvatar(
                                      radius: 125,
                                      // backgroundImage: NetworkImage(
                                      //     'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
                                    ),
                                    const SizedBox(height: 10.0),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: GestureDetector(
                            onTap: () {
                              // FIXME:
                              // BUG:
                              // NOTE:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SongCardInnerScreen(
                                      displaytext:
                                          data[index].displayName.toString() +
                                              data[index].artist.toString() +
                                              data[index].title.toString()),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                child: ListTile(
                                  leading: const CircleAvatar(
                                    // backgroundImage: NetworkImage(
                                    //     'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
                                    radius: 23,
                                  ),
                                  title: Text(
                                    data[index].title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                  subtitle: Text(
                                    data[index].artist.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      FloatingActionButton.small(
                                        heroTag: 'card',
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
                                      PopupMenuButton(
                                        color: Colors.black26,
                                        surfaceTintColor: Colors.white,
                                        offset: const Offset(0, 50),
                                        itemBuilder: (BuildContext context) {
                                          return [
                                            const PopupMenuItem(
                                              value: 'Share',
                                              child: Row(
                                                children: [
                                                  Icon(Icons.share,
                                                      color: Colors.white),
                                                  SizedBox(width: 8),
                                                  Text('Share',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            PopupMenuItem(
                                              onTap: () {
                                                ref
                                                    .read(musicDbProvider
                                                        .notifier)
                                                    .addSongs(SongsEntity(
                                                      auther: data[index]
                                                          .artist
                                                          .toString(),
                                                      title: data[index].title,
                                                    ));
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      backgroundColor:
                                                          Colors.blue,
                                                      content: Text(
                                                          'Added to Favorites')),
                                                );
                                                ref.invalidate(musicDbProvider);
                                              },
                                              value: 'Favorite',
                                              child: const Row(
                                                children: [
                                                  Icon(Icons.favorite,
                                                      color: Colors.white),
                                                  SizedBox(width: 8),
                                                  Text('Favorite',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            const PopupMenuItem(
                                              value: 'AddToPlaylist',
                                              child: Row(
                                                children: [
                                                  Icon(Icons.playlist_add,
                                                      color: Colors.white),
                                                  SizedBox(width: 8),
                                                  Text('Add to Playlist',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                            const PopupMenuItem(
                                              value: 'Delete',
                                              child: Row(
                                                children: [
                                                  Icon(Icons.delete,
                                                      color: Colors.white),
                                                  SizedBox(width: 8),
                                                  Text('Delete',
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ],
                                              ),
                                            ),
                                          ];
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
        bottomSheet: ScrollToHide(
            height: 90,
            scrollController: scrollController,
            hideDirection: Axis.horizontal,
            child: const BootomNavWidget()),
      ),
    );
  }
}
