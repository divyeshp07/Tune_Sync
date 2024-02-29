import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:music_app/presentation/widgets/bootom_navbar_widget.dart';
import 'package:scroll_to_hide/scroll_to_hide.dart';

class HomePage extends ConsumerWidget {
  HomePage({super.key});
  final ScrollController _scrollController = ScrollController();

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
                    expandedHeight: 365.0, // Decreased height
                    flexibleSpace: FlexibleSpaceBar(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            left: 30.8), // Add left padding
                        child: Text(
                          '   Tidal',
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
                                  radius: 80.0,
                                  // backgroundImage: AssetImage('assets/album_cover.jpg'),
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
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32)),
                        child: ListTile(
                          leading: const CircleAvatar(
                            // backgroundImage:
                            //     NetworkImage(data[index].album.toString()),
                            radius: 30,
                          ),
                          title: Text(
                            data[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                data[index].artist.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          trailing: FloatingActionButton.small(
                            onPressed: () {
                              // await PlaytheMusic().play(data[index]);
                            },
                            child: const Icon(Icons.play_arrow),
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
          child: BootomNavWidget(),
          scrollController: _scrollController,
          hideDirection: Axis.vertical),
    );
  }
}
