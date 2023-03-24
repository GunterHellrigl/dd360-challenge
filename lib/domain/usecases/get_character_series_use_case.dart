import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetCharacterSeriesUseCase {
  GetCharacterSeriesUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Serie>?> execute({required int characterId}) {
    return characterRepository.getCharacterSeries(characterId: characterId);
  }
}
