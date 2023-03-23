import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/models/story.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class CharacterRepositoryMock implements CharacterRepository {
  CharacterRepositoryMock({required this.withValues});

  final bool withValues;

  @override
  Character getCharacterBy({required int id}) {
    // TODO: implement getCharacterBy
    throw UnimplementedError();
  }

  @override
  List<Comic> getCharacterComics({required int characterId}) {
    if (withValues) {
      return [
        Comic(
          id: 1,
          title: "Title 1",
          description: "Description 1",
          thumbnailURI: "thumbnailURI 1",
        ),
        Comic(
          id: 2,
          title: "Title 2",
          description: "Description 2",
          thumbnailURI: "thumbnailURI 2",
        ),
        Comic(
          id: 3,
          title: "Title 3",
          description: "Description 3",
          thumbnailURI: "thumbnailURI 3",
        )
      ];
    }

    return [];
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
  List<Character> getCharacters() {
    if (withValues) {
      return [
        Character(
          id: 1,
          name: "Test 1",
          description: "Test 1 description",
          thumbnailURI: "thumbnailURI",
          comics: [],
          series: [],
          stories: [],
          events: [],
        ),
        Character(
          id: 2,
          name: "Test 2",
          description: "Test 2 description",
          thumbnailURI: "thumbnailURI",
          comics: [],
          series: [],
          stories: [],
          events: [],
        )
      ];
    }

    return [];
  }
}
