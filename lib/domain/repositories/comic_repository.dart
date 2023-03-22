import 'package:dd3challenge/domain/models/comic.dart';

abstract class ComicRepository {
  List<Comic> getComics();
  Comic getComicBy({int id});
}
