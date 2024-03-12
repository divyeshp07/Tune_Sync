import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@Riverpod(keepAlive: true)
class Search extends _$Search {
  @override
  List<SongModel> build() {
    return [];
  }

  void searchSongs({required String searchtext}) async {
    List<SongModel> data = await FetchAudioFileSource().fetchAudios();
    RegExp regExp = RegExp(searchtext, caseSensitive: false);
    state = [
      for (SongModel model in data)
        if (regExp.hasMatch(model.title)) model
    ];
  }
}
