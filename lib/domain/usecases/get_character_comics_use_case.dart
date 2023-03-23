import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetCharacterComicsUseCase {
  GetCharacterComicsUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  List<Comic> execute({required int characterId}) {
    return characterRepository.getCharacterComics(characterId: characterId);
  }
}
