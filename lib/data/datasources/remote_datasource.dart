import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';

abstract class RemoteDataSource {
  Future<List<Character>?> getCharacters();
  Future<List<Comic>?> getComics();
}
