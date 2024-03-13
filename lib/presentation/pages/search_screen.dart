import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/presentation/pages/song_card_innerview_screen.dart';
import 'package:music_app/presentation/providers/audio_player_provider.dart';
import 'package:music_app/presentation/providers/create_playlist_provider.dart';
import 'package:music_app/presentation/providers/play_list_provider.dart';
import 'package:music_app/presentation/providers/search_provider.dart';
import 'package:music_app/presentation/widgets/listtile_card_widget.dart';

import 'package:on_audio_query/on_audio_query.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({
    super.key,
  });

  /// controller for search section
  final TextEditingController searchtextController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ConcatenatingAudioSource serchingplaylist = ConcatenatingAudioSource(
        children: ref.read(getPlayListProvider(
            data: ref.read(searchProvider).map((e) => e.data).toList())));
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Search',
          style: GoogleFonts.roboto(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: searchtextController,
                onChanged: (value) {
                  ref
                      .read(searchProvider.notifier)
                      .searchSongs(searchtext: value);
                },
                decoration: InputDecoration(
                    hintText: 'Search Here...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: const Icon(Icons.search)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: ref.watch(searchProvider).isEmpty
                  ? const Center(
                      child: Image(
                        image: AssetImage(
                            'assets/images/search-result-not-found-2130355-1800920.png'),
                        width: 100 * 3,
                        height: 100 * 3,
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: ref.watch(searchProvider).length,
                      itemBuilder: (context, index) {
                        final List<SongModel> result =
                            ref.watch(searchProvider);
                        return InkWell(
                          onTap: () {
                            log(ref.read(searchProvider).length.toString());
                            ref.read(audioPlayerProvider).setAudioSource(
                                serchingplaylist,
                                initialIndex: index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SongCardInnerScreen(
                                    displaytext: result[index].title +
                                        result[index].artist.toString() +
                                        result[index].title),
                              ),
                            );
                          },
                          child: Card(
                              child: Listtile_widget(
                                  title: result[index].title,
                                  artist: result[index].artist ?? 'unknown')),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}
