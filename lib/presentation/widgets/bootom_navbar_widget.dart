import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/playlist_screen.dart';

class BootomNavWidget extends StatefulWidget {
  const BootomNavWidget({
    super.key,
  });

  @override
  State<BootomNavWidget> createState() => _BootomNavWidgetState();
}

class _BootomNavWidgetState extends State<BootomNavWidget> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;

    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
      // Navigate to the corresponding screen based on the index
      switch (index) {
        case 0:
          // Navigate to home screen
          break;
        case 1:
          // Navigate to lyrics screen
          break;
        case 2:
          // Navigate to favorite screen
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => FavSongScreen()));
          break;
        case 3:

          // Navigate to playlist screen
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlayListScreen(),
              ));
          break;
        case 4:
          // Navigate to microphone screen
          break;
      }
    }

    return Container(
      height: 105,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: Icon(
                Icons.home_max_outlined,
                color: Colors.white,
                size: 26,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 29,
              ),
              label: '',
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(
            //     Icons.favorite,
            //     color: Colors.white,
            //     size: 30,
            //   ),
            //   label: '',
            // ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music,
                color: Colors.white,
                size: 26,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mic_external_on_rounded,
                color: Colors.white,
                size: 26,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
