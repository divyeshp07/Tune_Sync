import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopupmenuScreen extends ConsumerWidget {
  // final Function() share;
  final Function() addtoplaylist;
  final Function() addtofav;
  // final Function()? delete;

  const PopupmenuScreen({
    super.key,
    required this.addtofav,
    required this.addtoplaylist,
    // required this.delete,
    // required this.share
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton(
      color: Colors.black26,
      surfaceTintColor: Colors.white,
      offset: const Offset(0, 50),
      itemBuilder: (BuildContext context) {
        return [
          // TODO:SHARE THE SONG
          // PopupMenuItem(
          //   onTap: share,
          //   value: 'Share',
          //   child: const Row(
          //     children: [
          //       Icon(Icons.share, color: Colors.white),
          //       SizedBox(width: 8),
          //       Text('Share', style: TextStyle(color: Colors.white)),
          //     ],
          //   ),
          // ),
          PopupMenuItem(
            onTap: addtofav,
            value: 'Favorite',
            child: const Row(
              children: [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(width: 8),
                Text('Favorite', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          // TODO:ADD TO PLAYLIST
          // PopupMenuItem(
          //   onTap: addtoplaylist,
          //   value: 'AddToPlaylist',
          //   child: const Row(
          //     children: [
          //       Icon(Icons.playlist_add, color: Colors.white),
          //       SizedBox(width: 8),
          //       Text('Add to Playlist', style: TextStyle(color: Colors.white)),
          //     ],
          //   ),
          // ),
          // TODO:DELETE SONG
          // PopupMenuItem(
          //   onTap: delete,
          //   value: 'Delete',
          //   child: const Row(
          //     children: [
          //       Icon(Icons.delete, color: Colors.white),
          //       SizedBox(width: 8),
          //       Text('Delete', style: TextStyle(color: Colors.white)),
          //     ],
          //   ),
          // ),
        ];
      },
    );
  }
}
