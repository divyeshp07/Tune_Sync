import 'package:flutter/material.dart';
import 'package:music_app/presentation/pages/home.screen.dart';

class Menutile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onpress;
  const Menutile({
    super.key,
    required this.icon,
    required this.title,
    required this.onpress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onpress,
      // Navigate to settings page
      // Close drawer
      // Add navigation logic here
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_1280.jpg',
                      scale: 2.0),
                ),
                SizedBox(height: 10),
                Text(
                  'Debs.',
                  // style: GoogleFonts.piazzolla(fontSize: 25),
                ),
              ],
            ),
          ),
          Menutile(
              icon: Icons.person_2_outlined,
              title: 'Account',
              onpress: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
                Navigator.pop(context);
              }),
          Menutile(
              icon: Icons.email,
              title: 'Email',
              onpress: () {
                Navigator.pop(context);
              }),
          Menutile(
              icon: Icons.data_saver_off,
              title: 'Data Saver',
              onpress: () {
                Navigator.pop(context);
              }),
          Menutile(
              icon: Icons.feedback,
              title: 'Feedback',
              onpress: () {
                Navigator.pop(context);
              }),
          Menutile(
              icon: Icons.help,
              title: 'Help',
              onpress: () {
                Navigator.pop(context);
              })
          // Add more list tiles for additional options
        ],
      ),
    );
  }
}
