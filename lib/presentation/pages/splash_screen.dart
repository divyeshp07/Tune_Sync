import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_app/presentation/pages/main_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const MainPage(),
      ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Center(child: SvgPicture.asset('assets/images/Group 5.svg')),
          ),
          Text(
            'TuneSync',
            textAlign: TextAlign.center,
            style: GoogleFonts.pacifico(fontSize: 30, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
