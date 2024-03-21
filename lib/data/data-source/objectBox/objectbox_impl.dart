import 'package:music_app/data/model/song_entity.dart';
import 'package:music_app/objectbox.g.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxImpl {
  late final Store store;
  static late final Box<SongsEntity> likedsong;
  static late final Box<SongsEntity> playlistsong;
  ObjectBoxImpl._create(this.store) {
    likedsong = store.box<SongsEntity>();
    // final playlistsong = store.box<SongsEntity>();
  }
  static Future<ObjectBoxImpl> create() async {
    final docdir = await getApplicationCacheDirectory();
    final store = await openStore(directory: join(docdir.path, 'tidal'));
    return ObjectBoxImpl._create(store);
  }
}
