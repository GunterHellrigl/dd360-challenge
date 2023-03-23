import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/serie.dart';

abstract class RemoteDataSource {
  Future<List<Character>?> getCharacters(int offset, int limit);
  Future<List<Comic>?> getComics(int offset, int limit);
  Future<List<Serie>?> getSeries(int offset, int limit);
}
