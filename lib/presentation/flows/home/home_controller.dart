import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/usecases/get_characters_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_comics_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_series_use_case.dart';
import 'package:dd3challenge/presentation/routes/app_routes.dart';
import 'package:dd3challenge/presentation/states.dart';
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

  Rx<States> stateCharacters = Rx(States.LOADING);
  RxList<Character> characters = RxList();

  Rx<States> stateComics = Rx(States.LOADING);
  RxList<Comic> comics = RxList();

  Rx<States> stateSeries = Rx(States.LOADING);
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
      stateCharacters.value = States.ERROR;
      return;
    }

    characters.clear();
    characters.addAll(list);
    stateCharacters.value = States.COMPLETED;
  }

  void _getComics() async {
    List<Comic>? list = await getComicsUseCase.execute(0, 7);

    if (list == null) {
      stateComics.value = States.ERROR;
      return;
    }

    comics.clear();
    comics.addAll(list);
    stateComics.value = States.COMPLETED;
  }

  void _getSeries() async {
    List<Serie>? list = await getSeriesUseCase.execute(0, 7);

    if (list == null) {
      stateSeries.value = States.ERROR;
      return;
    }

    series.clear();
    series.addAll(list);
    stateSeries.value = States.COMPLETED;
  }

  void goToCharacterPage(int id) {
    Get.toNamed(
      AppRoutes.character,
      arguments: {"id": id},
    );
  }

  void goToCharacterListPage() {
    Get.toNamed(
      AppRoutes.characterList,
    );
  }
}
