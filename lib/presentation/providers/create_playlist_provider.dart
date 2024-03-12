import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create_playlist_provider.g.dart';

@Riverpod(keepAlive: true)
class Playlist extends _$Playlist {
  @override
  List build() {
    return [];
  }

  void createplaylist({required String playlistname}) {
    state = [...state, playlistname];
  }

  void deleteplaylist(int index) {
    state.removeAt(index);
  }
}
