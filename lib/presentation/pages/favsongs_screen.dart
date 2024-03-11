// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:music_app/data/model/song_entity.dart';
// import 'package:music_app/domain/use-case/fav_add_remove_use_case.dart';
// import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';

// class FavSongScreen extends ConsumerWidget {
//   const FavSongScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     List<SongsEntity> favSongs = ref.read(musicDbProvider);

//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('My Fav'),
//       ),
//       body: favSongs.isEmpty
//           ? const Center(
//               child: Text('No fav songs'),
//             )
//           : ListView.separated(
//               itemBuilder: (context, index) => GestureDetector(
//                 onTap: () {
//                   // Add your onTap functionality here, e.g., navigate to the details screen
//                 },
//                 child: SizedBox(
//                   height: 80,
//                   width: 60,
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SongCardInnerScreen(
//                                 displaytext: favSongs[index].title.toString() +
//                                     favSongs[index].auther.toString() +
//                                     favSongs[index].title.toString()),
//                           ));
//                     },
//                     child: Card(
//                       elevation: 3,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: ListTile(
//                         leading: const CircleAvatar(),
//                         trailing: IconButton(
//                             onPressed: () {}, icon: Icon(Icons.favorite)),
//                         title: Text(favSongs[index].title.toString()),
//                         subtitle: Text(favSongs[index].auther.toString()),
//                       ),
//                       // child: Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: Row(
//                       //     children: [
//                       //       const CircleAvatar(
//                       //         radius: 40,
//                       //       ),
//                       //       const SizedBox(width: 10),
//                       //       Expanded(
//                       //         child: Column(
//                       //           crossAxisAlignment: CrossAxisAlignment.start,
//                       //           mainAxisAlignment: MainAxisAlignment.center,
//                       //           children: [
//                       //             Text(
//                       //               favSongs[index].title.toString(),
//                       //               style: TextStyle(
//                       //                 fontWeight: FontWeight.bold,
//                       //               ),
//                       //             ),
//                       //             const SizedBox(height: 5),
//                       //             Text(
//                       //               favSongs[index].auther.toString(),
//                       //               style: TextStyle(
//                       //                 color: Colors.grey[600],
//                       //               ),
//                       //             ),
//                       //           ],
//                       //         ),
//                       //       ),
//                       //       IconButton(
//                       //         onPressed: () {
//                       //           // Add functionality for the trailing icon, e.g., delete song
//                       //         },
//                       //         icon: const Icon(Icons.delete),
//                       //         color: Colors.red,
//                       //       ),
//                       //     ],
//                       //   ),
//                       // ),
//                     ),
//                   ),
//                 ),
//               ),
//               separatorBuilder: (context, index) => const SizedBox(height: 10),
//               itemCount: favSongs.length,
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/model/song_entity.dart';
import 'package:music_app/domain/use-case/fav_add_remove_use_case.dart';
import 'package:music_app/presentation/pages/llibrary_screen.dart';

class FavSongScreen extends ConsumerWidget {
  const FavSongScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<SongsEntity> favSongs = ref.watch(musicDbProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Favorites'),
      ),
      body: favSongs.isEmpty
          ? Center(
              child: Text(
                'No favorite songs',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  // Add your onTap functionality here, e.g., navigate to the details screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LiabraryWidget()),
                  );
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(),
                    trailing: IconButton(
                      onPressed: () {
                        // Add functionality to remove from favorites
                        ref
                            .read(musicDbProvider.notifier)
                            .removeSongs(favSongs[index].id);
                      },
                      icon: Icon(Icons.favorite, color: Colors.red),
                    ),
                    title: Text(
                      favSongs[index].title.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      favSongs[index].auther.toString(),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemCount: favSongs.length,
            ),
    );
  }
}
