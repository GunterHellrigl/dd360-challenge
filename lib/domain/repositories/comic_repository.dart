import 'package:dd3challenge/domain/models/comic.dart';

abstract class ComicRepository {
  Future<List<Comic>?> getComics();
  Future<Comic?> getComicBy({required int id});
}
