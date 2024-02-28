import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/widgets/bootom_navbar_widget.dart';
import 'package:music_app/presentation/widgets/drawer_widget.dart';
import 'package:music_app/presentation/widgets/song_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool playing = false;

  IconData playbtn = Icons.play_arrow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      body: Builder(
        builder: (BuildContext context) {
          open() {
            Scaffold.of(context).openDrawer();
          }

          return CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    open();
                  },
                  icon: const Icon(Icons.menu),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
                pinned: true,
                expandedHeight: 365.0, // Decreased height
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding:
                        const EdgeInsets.only(left: 30.8), // Add left padding
                    child: Text(
                      '   Tidal',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.pacifico(fontSize: 30),
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple,
                              Colors.deepPurpleAccent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height:
                                    kToolbarHeight), // Maintain space for the AppBar
                            Text(
                              'Now Playing',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.abhayaLibre(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),

                            const SizedBox(height: 10.0),
                            const CircleAvatar(
                              radius: 80.0,
                              // backgroundImage: AssetImage('assets/album_cover.jpg'),
                            ),
                            const SizedBox(height: 10.0),
                            const Text(
                              'Song Title',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Text(
                              'Artist Name',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: songCardWidget(
                          playbtn: playbtn,
                          playing: playing,
                          ontap: () {
                            if (!playing) {
                              setState(() {
                                playbtn = Icons.pause;
                                playing = true;
                              });
                            } else {
                              setState(() {
                                playbtn = Icons.play_arrow;
                                playing = false;
                              });
                            }
                          }),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ],
          );
        },
      ),
      bottomSheet: const BootomNavWidget(),
    );
  }
}
