import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:music_app/domain/use-case/music_featurs_case.dart';
import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';
import 'package:music_app/presentation/widgets/bootom_navbar_widget.dart';
import 'package:music_app/presentation/widgets/popupmenu_widget.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});

  final ScrollController _scrollController = ScrollController();

  String _truncateArtistName(String artistName) {
    List<String> words = artistName.split(' ');
    if (words.length > 3) {
      return '${words[0]} ${words[3]}'; // Take the first two words
    } else {
      return artistName; // Return the full artist name if it has less than or equal to two words
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(fetchaudiofilesProvider).when(
            data: (data) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border),
                      ),
                    ],
                    pinned: true,
                    expandedHeight: 340.0, // Decreased height
                    flexibleSpace: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(50), // Adjust as needed
                        bottomRight: Radius.circular(50), // Adjust as needed
                      ),
                      child: FlexibleSpaceBar(
                        title: Padding(
                          padding: const EdgeInsets.only(
                              left: 30.8), // Add left padding
                          child: Text(
                            '  Tidal',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.pacifico(fontSize: 30),
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
                                  const SizedBox(
                                      height:
                                          kToolbarHeight), // Maintain space for the AppBar
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
                                    radius: 70,
                                    backgroundImage: NetworkImage(
                                        'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
                                  ),
                                  const SizedBox(height: 10.0),
                                  const Text(
                                    'Song Title',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    'Artist Name',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.white70,
                                    ),
                                  ),
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
                        padding: const EdgeInsets.only(
                          top: 14,
                        ),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SongCardInnerScreen(),
                                ));
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32)),
                            child: ListTile(
                              leading: const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
                                radius: 23,
                              ),
                              title: Text(
                                data[index].title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    _truncateArtistName(
                                        data[index].artist.toString()),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FloatingActionButton.small(
                                    onPressed: () async {
                                      await MusicFeatures().play(data[index]);
                                    },
                                    child: const Icon(Icons.play_arrow),
                                  ),
                                  PopupMenuButton(
                                    surfaceTintColor: Colors.white,
                                    offset: const Offset(
                                        0, 50), // Adjust offset as needed
                                    itemBuilder: (BuildContext context) {
                                      return [
                                        // PopupMenuItemWidget(onTap: onTap, value: value, icon: icon, text: text)
                                        // PopupMenuItemWidget(onTap: onTap, value: value, icon: icon, text: text)
                                        // PopupMenuItemWidget(onTap: onTap, value: value, icon: icon, text: text)
                                        // PopupMenuItemWidget(onTap: onTap, value: value, icon: icon, text: text)
                                        const PopupMenuItem(
                                          value: 'Share',
                                          child: Row(
                                            children: [
                                              Icon(Icons.share,
                                                  color: Colors
                                                      .white), // Set icon color to white
                                              SizedBox(
                                                  width: 8), // Add some spacing
                                              Text('Share',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white)), // Set text color to white
                                            ],
                                          ),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Favorite',
                                          child: Row(
                                            children: [
                                              Icon(Icons.favorite,
                                                  color: Colors
                                                      .white), // Set icon color to white
                                              SizedBox(
                                                  width: 8), // Add some spacing
                                              Text('Favorite',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white)), // Set text color to white
                                            ],
                                          ),
                                        ),
                                        const PopupMenuItem(
                                          value: 'AddToPlaylist',
                                          child: Row(
                                            children: [
                                              Icon(Icons.playlist_add,
                                                  color: Colors
                                                      .white), // Set icon color to white
                                              SizedBox(
                                                  width: 8), // Add some spacing
                                              Text('Add to Playlist',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white)), // Set text color to white
                                            ],
                                          ),
                                        ),
                                        const PopupMenuItem(
                                          value: 'Delete',
                                          child: Row(
                                            children: [
                                              Icon(Icons.delete,
                                                  color: Colors
                                                      .white), // Set icon color to white
                                              SizedBox(
                                                  width: 8), // Add some spacing
                                              Text('Delete',
                                                  style: TextStyle(
                                                      color: Colors
                                                          .white)), // Set text color to white
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
          scrollController: _scrollController,
          hideDirection: Axis.horizontal,
          child: const BootomNavWidget()),
    );
  }
}
