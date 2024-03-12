import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/pages/favsongs_screen.dart';
import 'package:music_app/presentation/providers/create_playlist_provider.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myplaylist = ref.watch(playlistProvider);
    TextEditingController playlistnameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Liabrary'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.doorbell)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavSongScreen(),
                  ),
                );
              },
              child: Card(
                clipBehavior: Clip.antiAlias,
                color: Colors.black12,
                child: Row(
                  children: [
                    Container(
                      width: 90,
                      height: 90,
                      color: Colors.green[100],
                      child: const Center(
                        child: Icon(
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    const Text(
                      'Favorate Songs',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // TODO
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Text(
                  ' Playlist ',
                  style: GoogleFonts.roboto(fontSize: 22),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        title: const Text('Create Playlist',
                            style: TextStyle(fontSize: 18)),
                        content: SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: playlistnameController,
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              ref
                                  .read(playlistProvider.notifier)
                                  .createplaylist(
                                      playlistname:
                                          playlistnameController.text);
                            },
                            child: const Text('Create'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Create'),
                )
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: myplaylist.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.black12,
                    child: Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          color: Colors.green[100],
                          child: const Center(
                            child: Icon(
                              Icons.playlist_play_rounded,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Text(
                          myplaylist[index],
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              ref
                                  .read(playlistProvider.notifier)
                                  .deleteplaylist(index);
                            },
                            icon: Icon(Icons.delete_forever))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
