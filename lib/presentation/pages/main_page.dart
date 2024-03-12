import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/home.screen.dart';
import 'package:music_app/presentation/pages/llibrary_screen.dart';
import 'package:music_app/presentation/pages/search_screen.dart';
import 'package:music_app/presentation/widgets/bootom_navbar_widget.dart';

final List<Widget> pages = [
  const HomePage(),
  SearchPage(),
  const LibraryScreen(),
];

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
    );
  }
}
