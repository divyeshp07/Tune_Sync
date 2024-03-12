import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliverAppBarWidget extends StatelessWidget {
  final Function() leadingOnTap;
  const SliverAppBarWidget({
    super.key,
    required this.leadingOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: IconButton(
        onPressed: leadingOnTap,
        icon: const Icon(Icons.menu),
      ),
      pinned: true,
      expandedHeight: 340.0,
      flexibleSpace: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: FlexibleSpaceBar(
          title: Padding(
            padding: const EdgeInsets.only(
              left: 45.8,
            ),
            child: Text(
              'Tidal',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(fontSize: 30, color: Colors.black),
            ),
          ),
          background: Stack(
            fit: StackFit.expand,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: kToolbarHeight),
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
                      radius: 125,
                      // backgroundImage: NetworkImage(
                      //     'https://t4.ftcdn.net/jpg/05/65/69/95/360_F_565699512_WsMiVJCVoyVJhy0XlmBR3dEgToOK8hv3.jpg'),
                    ),
                    const SizedBox(height: 10.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
