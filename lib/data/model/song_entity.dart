import 'package:objectbox/objectbox.dart';

@Entity()
class SongsEntity {
  @Id()
  int id = 0;
  String? title;
  String? auther;
  String? data;

  SongsEntity(
      {required this.auther, this.id = 0, required this.title, this.data});
}
