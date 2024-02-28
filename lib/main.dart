import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/pages/intro_screen.dart';

void main() {
  // for strorage access permission
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   primaryColor: Colors.deepPurple,
      //   fontFamily: 'Montserrat',
      // ),
      // home: const HomePage(),
      home: const IntroScreen(),
    );
  }
}
