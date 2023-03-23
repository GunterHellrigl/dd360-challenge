import 'package:dd3challenge/api/marvel_api_datasource.dart';
import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/data/repositories/character_repository_impl.dart';
import 'package:dd3challenge/data/repositories/comic_repository_impl.dart';
import 'package:dd3challenge/data/repositories/serie_repository_impl.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';
import 'package:dd3challenge/domain/repositories/comic_repository.dart';
import 'package:dd3challenge/domain/repositories/serie_repository.dart';
import 'package:dd3challenge/domain/usecases/get_all_characters_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_comics_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_series_use_case.dart';
import 'package:dd3challenge/presentation/flows/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RemoteDataSource>(MarvelApiDataSource());

    Get.put<CharacterRepository>(CharacterRepositoryImpl(remoteDataSource: Get.find()));
    Get.put<ComicRepository>(ComicRepositoryImpl(remoteDataSource: Get.find()));
    Get.put<SerieRepository>(SerieRepositoryImpl(remoteDataSource: Get.find()));

    Get.put(GetAllCharactersUseCase(characterRepository: Get.find()));
    Get.put(GetComicsUseCase(comicRepository: Get.find()));
    Get.put(GetSeriesUseCase(serieRepository: Get.find()));

    Get.put(HomeController(
      getAllCharactersUseCase: Get.find(),
      getComicsUseCase: Get.find(),
      getSeriesUseCase: Get.find(),
    ));
  }
}
