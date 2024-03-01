import 'package:flutter/material.dart';

class FavSongScreen extends StatelessWidget {
  const FavSongScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My PlayList'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            // Add your onTap functionality here, e.g., navigate to the details screen
          },
          child: SizedBox(
            height: 100,
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      color: Colors.grey, // Placeholder for the thumbnail image
                      // You can replace this with your actual thumbnail image
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Song Title',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Artist Name',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Add functionality for the trailing icon, e.g., delete song
                      },
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 20),
        itemCount: 6,
      ),
    );
  }
}
