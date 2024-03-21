import 'package:music_app/data/data-source/objectBox/objectbox_impl.dart';
import 'package:music_app/data/model/song_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fav_add_remove_use_case.g.dart';

@riverpod
class FaveSongDb extends _$FaveSongDb {
  @override
  List<SongsEntity> build() {
    return ObjectBoxImpl.likedsong.getAll();
  }

  void addSongs(SongsEntity song) {
    ObjectBoxImpl.likedsong.put(song);
    state = ObjectBoxImpl.likedsong.getAll();
  }

  void removeSongs(int id) {
    ObjectBoxImpl.likedsong.remove(id);
    state = ObjectBoxImpl.likedsong.getAll();
  }
}
