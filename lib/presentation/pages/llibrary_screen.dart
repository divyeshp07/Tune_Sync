import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/favsongs_screen.dart';

class LiabraryWidget extends StatelessWidget {
  const LiabraryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Liabrary'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.doorbell))
        ],
      ),
      body: Padding(
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
            child: Row(
              children: [
                Container(
                  width: 90,
                  height: 90,
                  color: Colors.amber,
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
                  'Favorate ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
