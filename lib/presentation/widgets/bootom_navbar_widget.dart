// // import 'package:flutter/material.dart';
// // import 'package:music_app/presentation/pages/home.screen.dart';
// // import 'package:music_app/presentation/pages/llibrary_screen.dart';
// // import 'package:music_app/presentation/pages/search_screen.dart';

// // class BootomNavWidget extends StatefulWidget {
// //   const BootomNavWidget({
// //     super.key,
// //   });

// //   @override
// //   State<BootomNavWidget> createState() => _BootomNavWidgetState();
// // }

// // class _BootomNavWidgetState extends State<BootomNavWidget> {
// //   @override
// //   Widget build(BuildContext context) {
// //     // final ScrollController scrollController = ScrollController();
// //     // final int selectedIndex = ref.watch(bottomNavProvider);

// //     List pages = [const HomePage(), const LiabraryWidget(), SearchPage()];

// //     return Container(
// //       height: 105,
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
// //       decoration: const BoxDecoration(
// //         gradient: LinearGradient(
// //           colors: [Colors.deepPurple, Colors.deepPurpleAccent],
// //           begin: Alignment.topCenter,
// //           end: Alignment.bottomCenter,
// //         ),
// //         borderRadius: BorderRadius.only(
// //           topLeft: Radius.circular(50),
// //           topRight: Radius.circular(50),
// //         ),
// //       ),
// //       child: ClipRRect(
// //         borderRadius: BorderRadius.circular(100),
// //         child: BottomNavigationBar(
// //           showSelectedLabels: false,
// //           showUnselectedLabels: false,
// //           // currentIndex: selectedIndex,
// //           onTap: (value) {
// //             setState(() {
// //               // selectedIndex = value;
// //             });
// //           },
// //           items: const <BottomNavigationBarItem>[
// //             BottomNavigationBarItem(
// //               backgroundColor: Colors.black,
// //               icon: Icon(
// //                 Icons.home_max_outlined,
// //                 color: Colors.white,
// //                 size: 26,
// //               ),
// //               label: '',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 Icons.search,
// //                 color: Colors.white,
// //                 size: 29,
// //               ),
// //               label: '',
// //             ),
// //             // BottomNavigationBarItem(
// //             //   icon: Icon(
// //             //     Icons.favorite,
// //             //     color: Colors.white,
// //             //     size: 30,
// //             //   ),
// //             //   label: '',
// //             // ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 Icons.library_music,
// //                 color: Colors.white,
// //                 size: 26,
// //               ),
// //               label: '',
// //             ),
// //             BottomNavigationBarItem(
// //               icon: Icon(
// //                 Icons.mic_external_on_rounded,
// //                 color: Colors.white,
// //                 size: 26,
// //               ),
// //               label: '',
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/home.screen.dart';
import 'package:music_app/presentation/pages/llibrary_screen.dart';
import 'package:music_app/presentation/pages/search_screen.dart';

class BootomNavWidget extends StatefulWidget {
  const BootomNavWidget({super.key});

  @override
  State<BootomNavWidget> createState() => _BootomNavWidgetState();
}

class _BootomNavWidgetState extends State<BootomNavWidget> {
  @override
  Widget build(
    BuildContext context,
  ) {
    int selectedIndex = 0;
    List<Widget> pages = [
      const HomePage(),
      SearchPage(),
      const LiabraryScreen()
    ];

    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: Container(
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
            onTap: (value) {
              setState(() {
                selectedIndex = value;
              });
              // if (selectedIndex == value) {
              //   ref.read(bottomNavProvider.notifier).add(0);
              //   // page changer to pagecontroller
              //   ref.read(pageControllerProvider).jumpToPage(0);
              // } else if (selectedIndex == value) {
              //   ref.read(bottomNavProvider.notifier).add(1);
              //   // page changer to pagecontroller
              //   ref.read(pageControllerProvider).jumpToPage(1);
              // } else if (selectedIndex == value) {
              //   ref.read(bottomNavProvider.notifier).add(2);
              //   // page changer to pagecontroller
              //   ref.read(pageControllerProvider).jumpToPage(2);
              // } else {
              //   ref.read(bottomNavProvider.notifier).add(3);
              //   // page changer to pagecontroller
              //   ref.read(pageControllerProvider).jumpToPage(3);
              // }
            },
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
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.mic_external_on_rounded,
              //     color: Colors.white,
              //     size: 26,
              //   ),
              //   label: '',
              // ),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: BottomNavigationBar(
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.abc,
      //         ),
      //         label: 's'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.abc,
      //         ),
      //         label: 's'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.abc,
      //         ),
      //         label: 's'),
      //   ],
      //   onTap: (value) {
      //     setState(() {
      //       selectedIndex = value;
      //     });
      //   },
      // ),
    );
  }
}
