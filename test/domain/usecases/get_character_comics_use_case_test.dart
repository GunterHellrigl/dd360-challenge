import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';
import 'package:dd3challenge/domain/usecases/get_character_comics_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_characters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../mocks/character_repository_mock.dart';

void main() {
  test("test when the character has comics", () {
    CharacterRepository repository = CharacterRepositoryMock(withValues: true);

    GetCharacterComicsUseCase useCase = GetCharacterComicsUseCase(characterRepository: repository);
    List<Comic> comics = useCase.execute(characterId: 1);

    expect(comics.length, 3);
  });

  test("test when the character has not comics", () async {
    CharacterRepository repository = CharacterRepositoryMock(withValues: false);

    GetCharactersUseCase useCase = GetCharactersUseCase(characterRepository: repository);
    List<Character>? characters = await useCase.execute(0, 3);

    expect(characters?.length, 0);
  });
}
