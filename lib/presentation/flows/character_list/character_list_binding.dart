import 'package:dd3challenge/api/marvel_api_datasource.dart';
import 'package:dd3challenge/data/datasources/remote_datasource.dart';
import 'package:dd3challenge/data/repositories/character_repository_impl.dart';
import 'package:dd3challenge/domain/repositories/character_repository.dart';
import 'package:dd3challenge/domain/usecases/get_characters_use_case.dart';
import 'package:dd3challenge/presentation/flows/character_list/character_list_controller.dart';
import 'package:get/get.dart';

class CharacterListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RemoteDataSource>(MarvelApiDataSource());

    Get.put<CharacterRepository>(CharacterRepositoryImpl(remoteDataSource: Get.find()));

    Get.put(GetCharactersUseCase(characterRepository: Get.find()));

    Get.put(CharacterListController(getCharactersUseCase: Get.find()));
  }
}
