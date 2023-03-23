import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/usecases/get_all_characters_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_comics_use_case.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.getAllCharactersUseCase,
    required this.getComicsUseCase,
  });

  final GetAllCharactersUseCase getAllCharactersUseCase;
  final GetComicsUseCase getComicsUseCase;

  RxBool isLoadingCharacters = RxBool(true);
  RxList<Character> characters = RxList();

  RxBool isLoadingComics = RxBool(true);
  RxList<Comic> comics = RxList();

  @override
  void onReady() async {
    super.onReady();

    _getCharacters();
    _getComics();
  }

  void _getCharacters() async {
    List<Character>? list = await getAllCharactersUseCase.execute();

    if (list == null) {
      print("ERROR!");
      return;
    }

    characters.clear();
    characters.addAll(list);
    isLoadingCharacters.value = false;
  }

  void _getComics() async {
    List<Comic>? list = await getComicsUseCase.execute();

    if (list == null) {
      print("ERROR!");
      return;
    }

    comics.clear();
    comics.addAll(list);
    isLoadingComics.value = false;
  }
}
