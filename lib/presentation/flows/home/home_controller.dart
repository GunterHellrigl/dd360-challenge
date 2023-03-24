import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/usecases/get_characters_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_comics_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_series_use_case.dart';
import 'package:dd3challenge/presentation/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.getCharactersUseCase,
    required this.getComicsUseCase,
    required this.getSeriesUseCase,
  });

  final GetCharactersUseCase getCharactersUseCase;
  final GetComicsUseCase getComicsUseCase;
  final GetSeriesUseCase getSeriesUseCase;

  RxBool isLoadingCharacters = RxBool(true);
  RxList<Character> characters = RxList();

  RxBool isLoadingComics = RxBool(true);
  RxList<Comic> comics = RxList();

  RxBool isLoadingSeries = RxBool(true);
  RxList<Serie> series = RxList();

  @override
  void onReady() async {
    super.onReady();

    _getCharacters();
    _getComics();
    _getSeries();
  }

  void _getCharacters() async {
    List<Character>? list = await getCharactersUseCase.execute(0, 3);

    if (list == null) {
      print("ERROR!");
      return;
    }

    characters.clear();
    characters.addAll(list);
    isLoadingCharacters.value = false;
  }

  void _getComics() async {
    List<Comic>? list = await getComicsUseCase.execute(0, 3);

    if (list == null) {
      print("ERROR!");
      return;
    }

    comics.clear();
    comics.addAll(list);
    isLoadingComics.value = false;
  }

  void _getSeries() async {
    List<Serie>? list = await getSeriesUseCase.execute(0, 3);

    if (list == null) {
      print("ERROR!");
      return;
    }

    series.clear();
    series.addAll(list);
    isLoadingSeries.value = false;
  }

  void goToCharacterPage(int id) {
    Get.toNamed(
      AppRoutes.character,
      arguments: {"id": id},
    );
  }
}
