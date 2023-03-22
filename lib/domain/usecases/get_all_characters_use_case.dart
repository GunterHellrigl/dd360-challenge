import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetAllCharactersUseCase {
  GetAllCharactersUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  List<Character> execute() {
    return characterRepository.getCharacters();
  }
}
