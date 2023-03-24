import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetCharacterByIdUseCase {
  GetCharacterByIdUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;
  Future<Character?> execute(int id) {
    return characterRepository.getCharacterBy(id: id);
  }
}
