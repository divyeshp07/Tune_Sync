import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_app/presentation/pages/intro_screen.dart';

// class SplashScreen extends ConsumerWidget {
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const IntroductionScreen(),
      ));
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/ic_launcher.png'),
      ),
    );
  }
}
