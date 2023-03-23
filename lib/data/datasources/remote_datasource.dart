import 'package:dd3challenge/domain/models/character.dart';

abstract class RemoteDataSource {
  Future<List<Character>?> getCharacters();
}
