import 'package:flutter/material.dart';

class Listtile_widget extends StatelessWidget {
  final String title;
  final String artist;
  final Widget? leading;
  final Widget? trailing;

  const Listtile_widget({
    super.key,
    required this.title,
    required this.artist,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      ),
      subtitle: Text(
        artist,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontSize: 12),
      ),
      leading: leading,
      trailing: trailing,
    );
  }
}
