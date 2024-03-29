import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/song_entity.dart';
import 'package:music_app/domain/use-case/fav_add_remove_use_case.dart';
import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';

class FavSongScreen extends ConsumerWidget {
  const FavSongScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongsEntity> favSongs = ref.watch(faveSongDbProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Favorites'),
      ),
      body: favSongs.isEmpty
          ? const Center(
              child: Text(
                'No favorite songs',
                style: TextStyle(
                  fontSize: 18,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongCardInnerScreen(
                          displaytext: favSongs.map((e) => e.title!).toList()),
                    ),
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/ic_launcher.png'),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        // Add functionality to remove from favorites
                        ref
                            .read(faveSongDbProvider.notifier)
                            .removeSongs(favSongs[index].id);
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red),
                    ),
                    title: Text(
                      favSongs[index].title.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      maxLines: 2,
                    ),
                    subtitle: Text(
                      favSongs[index].auther.toString(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 3),
              itemCount: favSongs.length,
            ),
    );
  }
}
