import 'package:dd3challenge/api/marvel_api_datasource.dart';
import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/data/repositories/character_repository_impl.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';
import 'package:dd3challenge/domain/usecases/get_character_by_id_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_character_comics_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_character_events_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_character_series_use_case.dart';
import 'package:dd3challenge/domain/usecases/get_character_stories_use_case.dart';
import 'package:dd3challenge/presentation/flows/character/character_controller.dart';
import 'package:get/get.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RemoteDataSource>(MarvelApiDataSource());

    Get.put<CharacterRepository>(CharacterRepositoryImpl(remoteDataSource: Get.find()));

    Get.put(GetCharacterByIdUseCase(characterRepository: Get.find()));
    Get.put(GetCharacterComicsUseCase(characterRepository: Get.find()));
    Get.put(GetCharacterEventsUseCase(characterRepository: Get.find()));
    Get.put(GetCharacterSeriesUseCase(characterRepository: Get.find()));
    Get.put(GetCharacterStoriesUseCase(characterRepository: Get.find()));

    Get.put(CharacterController(
      getCharacterByIdUseCase: Get.find(),
      getCharacterComicsUseCase: Get.find(),
      getCharacterEventsUseCase: Get.find(),
      getCharacterSeriesUseCase: Get.find(),
      getCharacterStoriesUseCase: Get.find(),
    ));
  }
}
