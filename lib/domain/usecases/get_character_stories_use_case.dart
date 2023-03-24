import 'package:dd3challenge/domain/models/story.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetCharacterStoriesUseCase {
  GetCharacterStoriesUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Story>?> execute({required int characterId}) {
    return characterRepository.getCharacterStories(characterId: characterId);
  }
}
