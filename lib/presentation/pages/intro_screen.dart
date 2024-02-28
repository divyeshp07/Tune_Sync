import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/data/data-source/storage-permission/storage_permission_request.dart';
import 'package:music_app/presentation/pages/home.screen.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroductionScreen extends ConsumerWidget {
  const IntroductionScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://as1.ftcdn.net/v2/jpg/06/05/37/40/1000_F_605374009_hEUHatmKPzuHTIacg7rLneAgnLHUgegM.jpg'), // Change the image path accordingly
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 450,
              ),
              const Text(
                'Discover the World of Music',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color:
                      Colors.black, // Adjust text color for better visibility
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Explore a vast library of songs from various genres,'
                'artists, and albums. Enjoy personalized recommendations'
                'tailored just for you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color:
                      Colors.black, // Adjust text color for better visibility
                ),
              ),
              const SizedBox(height: 100),
              SizedBox(
                width: 300,
                height: 70,
                child:
                    //  ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.pushAndRemoveUntil(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => const HomePage(),
                    //         ),
                    //         (route) => false);
                    //   },
                    //   child: const Text('Get Started'),
                    // )

                    ElevatedButton(
                  onPressed: () async {
                    // Add navigation to the next screen or permission request here
                    bool granted = await ref.read(
                        storagePermissionProvider(Permission.storage).future);

                    if (granted) {
                      if (kDebugMode) {
                        print('permission is granted');
                        Future.sync(() => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            (route) => false));
                      }
                    } else {
                      if (kDebugMode) {
                        print('permission denied');
                      }
                    }
                  },
                  child: const Text('Get Started'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
