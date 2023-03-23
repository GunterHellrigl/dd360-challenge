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
  Character getCharacterBy({required int id}) {
    // TODO: implement getCharacterBy
    throw UnimplementedError();
  }

  @override
  List<Comic> getCharacterComics({required int characterId}) {
    // TODO: implement getCharacterComics
    throw UnimplementedError();
  }

  @override
  List<Event> getCharacterEvents({required int characterId}) {
    // TODO: implement getCharacterEvents
    throw UnimplementedError();
  }

  @override
  List<Serie> getCharacterSeries({required int characterId}) {
    // TODO: implement getCharacterSeries
    throw UnimplementedError();
  }

  @override
  List<Story> getCharacterStories({required int characterId}) {
    // TODO: implement getCharacterStories
    throw UnimplementedError();
  }

  @override
  Future<List<Character>?> getCharacters(int offset, int limit) {
    return remoteDataSource.getCharacters(offset, limit);
  }
}
