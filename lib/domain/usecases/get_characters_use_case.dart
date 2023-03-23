import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  GetCharactersUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Character>?> execute(int offset, int limit) async {
    return await characterRepository.getCharacters(offset, limit);
  }
}
