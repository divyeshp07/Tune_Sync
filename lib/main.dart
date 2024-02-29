import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/presentation/pages/splash_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  // for strorage access permission ensureinitialized
  WidgetsFlutterBinding.ensureInitialized();
  //taking storage  permission request here
  await Permission.storage.request();

  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const SplashScreen(),
    );
  }
}
