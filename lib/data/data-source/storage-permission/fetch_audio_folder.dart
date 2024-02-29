import 'package:on_audio_query/on_audio_query.dart';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'fetch_audio_folder.g.dart';

class FetchAudioFileSource {
  OnAudioQuery audioQuery = OnAudioQuery();
  Future<List<SongModel>> fetchAudios() async {
    try {
      List<SongModel> music = await audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true,
      );
      return music;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}

@riverpod
Future<List<SongModel>> fetchaudiofiles(FetchaudiofilesRef ref) {
  return FetchAudioFileSource().fetchAudios();
}
