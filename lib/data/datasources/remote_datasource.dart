import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/serie.dart';

abstract class RemoteDataSource {
  Future<List<Character>?> getCharacters();
  Future<List<Comic>?> getComics();
  Future<List<Serie>?> getSeries();
}
