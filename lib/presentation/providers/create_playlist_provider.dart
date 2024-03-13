import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'create_playlist_provider.g.dart';

@Riverpod(keepAlive: true)
class PlaylistCreateDelete extends _$PlaylistCreateDelete {
  @override
  List build() {
    return [];
  }

  void createplaylist({required String playlistname}) {
    state = [...state, playlistname];
  }

  void deleteplaylist(int index) {
    state = List.from(state)..removeAt(index);
  }
}
