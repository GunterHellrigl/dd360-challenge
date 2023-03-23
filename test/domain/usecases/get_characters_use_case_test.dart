import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';
import 'package:dd3challenge/domain/usecases/get_characters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/character_repository_mock.dart';

void main() {
  test("test when there are characters", () async {
    CharacterRepository repository = CharacterRepositoryMock(withValues: true);

    GetCharactersUseCase useCase = GetCharactersUseCase(characterRepository: repository);
    List<Character>? characters = await useCase.execute(0, 3);

    expect(characters?.length, 2);
  });

  test("test when there are not characters", () async {
    CharacterRepository repository = CharacterRepositoryMock(withValues: false);

    GetCharactersUseCase useCase = GetCharactersUseCase(characterRepository: repository);
    List<Character>? characters = await useCase.execute(0, 3);

    expect(characters?.length, 0);
  });
}
