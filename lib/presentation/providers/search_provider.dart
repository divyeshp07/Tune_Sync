import 'package:music_app/data/data-source/storage-permission/fetch_audio_folder.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';

@riverpod
class Search extends _$Search {
  @override
  List<SongModel> build() {
    return [];
  }

  void searchSongs({required String search}) async {
    // log('message');
    List<SongModel> data = await FetchAudioFileSource().fetchAudios();
    RegExp regExp = RegExp(search, caseSensitive: false);
    state = [
      for (SongModel model in data)
        if (regExp.hasMatch(model.title)) model
    ];
    // log(state.toString());
  }
}
