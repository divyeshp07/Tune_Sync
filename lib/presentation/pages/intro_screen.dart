import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:music_app/data/data-source/storage-permission/storage_permission_request.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('storage access permission'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('melcow'),
            ElevatedButton(
              onPressed: () async {
                bool granted = await ref
                    .read(storagePermissionProvider(Permission.storage).future);
                if (granted) {
                  print('permission is granted');
                } else {
                  print('permission denied');
                }
              },
              child: const Text('click'),
            ),
          ],
        ),
      ),
    );
  }
}
