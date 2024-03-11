// import 'package:music_app/data/model/song_entity.dart';
// import 'package:music_app/domain/use-case/fav_add_remove_use_case.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'is_favorate.g.dart';

// class CheckIsFav {
//   bool isFav({required String dataa, required List<SongsEntity> listOfmusic}) {
//     bool isFav = false;

//     for (SongsEntity model in listOfmusic) {
//       if (model.data == dataa) {
//         isFav = true;
//         break;
//       }
//     }
//     return isFav;
//   }
// }

// @riverpod
// bool isFav(IsFavRef ref, {required String data}) {
//   return CheckIsFav()
//       .isFav(dataa: data, listOfmusic: ref.read(musicDbProvider));
// }
