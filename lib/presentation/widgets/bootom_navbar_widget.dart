import 'package:flutter/material.dart';

class BootomNavWidget extends StatelessWidget {
  const BootomNavWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                Icons.lyrics,
                color: Colors.white,
                size: 26,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_add,
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
