import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';

abstract class CharacterRepository {
  Future<List<Character>?> getCharacters(int offset, int limit);
  Future<Character?> getCharacterBy({required int id});
  Future<List<Comic>?> getCharacterComics({required int characterId});
  Future<List<Event>?> getCharacterEvents({required int characterId});
  Future<List<Serie>?> getCharacterSeries({required int characterId});
  Future<List<Story>?> getCharacterStories({required int characterId});
}
