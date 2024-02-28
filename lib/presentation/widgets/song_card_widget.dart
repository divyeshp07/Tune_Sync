import 'package:flutter/material.dart';

Card songCardWidget({
  required playing,
  required playbtn,
  required Function() ontap,
}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
    child: ListTile(
      leading: const CircleAvatar(
        // backgroundImage: NetworkImage("dp"),
        radius: 30,
      ),
      title: const Text(
        "songName",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      subtitle: const Row(
        children: [
          Text("singer"),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Icon(
              Icons.circle,
              size: 6,
            ),
          ),
          Text("releseddate")
        ],
      ),
      trailing: FloatingActionButton.small(
        onPressed: ontap,
        child: Icon(playbtn),
      ),
    ),
  );
}
