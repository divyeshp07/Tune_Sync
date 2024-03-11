import 'package:flutter/material.dart';

class PopupMenuWidget extends StatelessWidget {
  final Function() share;
  final Function() addtofav;
  final Function() addtoplayist;
  final Function() delete;
  const PopupMenuWidget({
    super.key,
    required this.share,
    required this.addtofav,
    required this.addtoplayist,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      surfaceTintColor: Colors.white,
      offset: const Offset(0, 50),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            onTap: () {},
            value: 'Share',
            child: const Row(
              children: [
                Icon(Icons.share, color: Colors.white),
                SizedBox(width: 8),
                Text('Share', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            value: 'Favorite',
            child: const Row(
              children: [
                Icon(Icons.favorite, color: Colors.white),
                SizedBox(width: 8),
                Text('Favorite', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            value: 'AddToPlaylist',
            child: const Row(
              children: [
                Icon(Icons.playlist_add, color: Colors.white),
                SizedBox(width: 8),
                Text('Add to Playlist', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          PopupMenuItem(
            onTap: () {},
            value: 'Delete',
            child: const Row(
              children: [
                Icon(Icons.delete, color: Colors.white),
                SizedBox(width: 8),
                Text('Delete', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ];
      },
    );
  }
}
