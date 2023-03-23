import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';

abstract class CharacterRepository {
  Future<List<Character>?> getCharacters();
  Character getCharacterBy({required int id});
  List<Comic> getCharacterComics({required int characterId});
  List<Event> getCharacterEvents({required int characterId});
  List<Serie> getCharacterSeries({required int characterId});
  List<Story> getCharacterStories({required int characterId});
}
