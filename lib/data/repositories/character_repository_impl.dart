import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Character?> getCharacterBy({required int id}) {
    return remoteDataSource.getCharacterById(id);
  }

  @override
  Future<List<Comic>?> getCharacterComics({required int characterId}) {
    return remoteDataSource.getComicsBy(characterId: characterId);
  }

  @override
  Future<List<Event>?> getCharacterEvents({required int characterId}) {
    return remoteDataSource.getEventsBy(characterId: characterId);
  }

  @override
  Future<List<Serie>?> getCharacterSeries({required int characterId}) {
    return remoteDataSource.getSeriesBy(characterId: characterId);
  }

  @override
  Future<List<Story>?> getCharacterStories({required int characterId}) {
    return remoteDataSource.getStoriesBy(characterId: characterId);
  }

  @override
  Future<List<Character>?> getCharacters(int offset, int limit) {
    return remoteDataSource.getCharacters(offset, limit);
  }
}
