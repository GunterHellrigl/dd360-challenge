import 'package:dd3challenge/domain/models/event.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';

class GetCharacterEventsUseCase {
  GetCharacterEventsUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Event>?> execute({required int characterId}) {
    return characterRepository.getCharacterEvents(characterId: characterId);
  }
}
