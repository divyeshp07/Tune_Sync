import 'package:music_app/data/data-source/objectBox/objectbox_impl.dart';
import 'package:music_app/data/model/song_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fav_add_remove_use_case.g.dart';

@riverpod
class MusicDb extends _$MusicDb {
  @override
  List<SongsEntity> build() {
    return ObjectBoxImpl.box.getAll();
  }

  void addSongs(SongsEntity song) {
    ObjectBoxImpl.box.put(song);
    state = ObjectBoxImpl.box.getAll();
  }

  void removeSongs(int id) {
    ObjectBoxImpl.box.remove(id);
    state = ObjectBoxImpl.box.getAll();
  }
}
