import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'TuneSync',
              textAlign: TextAlign.center,
              style: GoogleFonts.pacifico(fontSize: 35, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 24),
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Music App is a wonderful platform for music lovers to enjoy their favorite tracks. With a user-friendly interface and a wide range of features, it provides a seamless listening experience.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    child: Image.asset('assets/images/gmail.png', width: 50),
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse('mailto:divyesh5262@gmail.com'));
                    },
                  ),
                  InkWell(
                    child:
                        Image.asset('assets/images/instagram.png', width: 50),
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse('https://www.instagram.com/_i4c____/'));
                    },
                  ),
                  InkWell(
                    child: Image.asset('assets/images/github.png', width: 50),
                    onTap: () {
                      _launchInBrowser(
                          Uri.parse('https://github.com/divyeshp07'));
                    },
                  ),
                  InkWell(
                    child: Image.asset('assets/images/linkedin.png', width: 50),
                    onTap: () {
                      _launchInBrowser(Uri.parse(
                          'https://www.linkedin.com/in/divyesh-p-057a43236/'));
                    },
                  ),
                ],
              ),
            ),
            const Center(
              child: Text(
                'Privacy Policy | Terms of Service | Copyright 2024 TuneSync. All rights reserved',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                'Version 0.0.1',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
  await launchUrl(url);
}
