import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/models/comic.dart';
import 'package:dd3challenge/domain/models/serie.dart';
import 'package:dd3challenge/domain/usecases/get_all_characters_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_comics_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_series_use_case.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController({
    required this.getAllCharactersUseCase,
    required this.getComicsUseCase,
    required this.getSeriesUseCase,
  });

  final GetAllCharactersUseCase getAllCharactersUseCase;
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

  void _getSeries() async {
    List<Serie>? list = await getSeriesUseCase.execute();

    if (list == null) {
      print("ERROR!");
      return;
    }

    series.clear();
    series.addAll(list);
    isLoadingSeries.value = false;
  }
}
