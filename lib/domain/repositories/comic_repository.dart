import 'package:dd3challenge/domain/models/comic.dart';

abstract class ComicRepository {
  Future<List<Comic>?> getComics(int offset, int limit);
  Future<Comic?> getComicBy({required int id});
}
