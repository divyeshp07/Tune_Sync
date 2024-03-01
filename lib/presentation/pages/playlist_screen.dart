import 'package:flutter/material.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10, // Adjust as needed
          mainAxisSpacing: 10, // Adjust as needed
        ),
        itemBuilder: (context, index) {
          return Container(
            color: Colors.amber,
            width: MediaQuery.of(context).size.width / 2 -
                15, // Adjust width based on crossAxisSpacing
            child: ListTile(
              leading: CircleAvatar(),
              title: Text('title'),
              subtitle: Text('subtitle'),
              trailing: Icon(Icons.cancel),
            ),
          );
        },
        itemCount: 5,
      ),
    );

    // body: ListView.separated(
    //     itemBuilder: (context, index) => ListTile(
    //           leading: CircleAvatar(),
    //           title: Text('title'),
    //           subtitle: Text('subtitle'),
    //           trailing: Icon(Icons.cancel),
    //         ),
    //     separatorBuilder: (context, index) => SizedBox(
    //           height: 10,
    //         ),
    //     itemCount: 5),
  }
}
