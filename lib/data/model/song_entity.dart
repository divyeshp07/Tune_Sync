import 'package:objectbox/objectbox.dart';

@Entity()
class SongsEntity {
  @Id()
  int id = 0;
  String title;
  String auther;
  String uri;
  String image;
  SongsEntity(
      {required this.auther,
      required this.id,
      required this.image,
      required this.title,
      required this.uri});
}
