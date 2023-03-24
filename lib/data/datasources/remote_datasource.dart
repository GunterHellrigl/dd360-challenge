import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';

abstract class RemoteDataSource {
  Future<List<Character>?> getCharacters(int offset, int limit);
  Future<Character?> getCharacterById(int id);
  Future<List<Comic>?> getComics(int offset, int limit);
  Future<List<Serie>?> getSeries(int offset, int limit);

  Future<List<Comic>?> getComicsBy({required int characterId});
  Future<List<Serie>?> getSeriesBy({required int characterId});
  Future<List<Story>?> getStoriesBy({required int characterId});
  Future<List<Event>?> getEventsBy({required int characterId});
}
