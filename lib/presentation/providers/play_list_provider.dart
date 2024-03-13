import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'play_list_provider.g.dart';

class PlayList {
  List<AudioSource> getPlayList({required List<String> data}) {
    final List<AudioSource> listOfAudioSource = [
      for (String str in data) AudioSource.file(str)
    ];
    return listOfAudioSource;
  }
}

@riverpod
List<AudioSource> getPlayList(GetPlayListRef ref,
    {required List<String> data}) {
  return PlayList().getPlayList(data: data);
}
