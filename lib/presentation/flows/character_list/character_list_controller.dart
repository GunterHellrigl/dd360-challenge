import 'package:dd3challenge/domain/models/character.dart';
import 'package:dd3challenge/domain/usecases/get_characters_use_case.dart';
import 'package:dd3challenge/presentation/routes/app_routes.dart';
import 'package:dd3challenge/presentation/states.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListController extends GetxController {
  CharacterListController({
    required this.getCharactersUseCase,
  });

  late final GetCharactersUseCase getCharactersUseCase;

  Rx<States> state = Rx(States.LOADING);
  Rx<States> stateAddItems = Rx(States.COMPLETED);
  RxList<Character> characters = RxList();

  ScrollController scrollController = ScrollController();

  int offset = 0;

  @override
  void onReady() {
    super.onReady();

    scrollController.addListener(() {
      if (stateAddItems.value != States.LOADING &&
          scrollController.offset >= scrollController.position.maxScrollExtent) {
        stateAddItems.value = States.LOADING;
        offset += 10;
        _getCharacters();
      }
    });

    _getCharacters();
  }

  void _getCharacters() async {
    final List<Character>? list = await getCharactersUseCase.execute(offset, 10);

    if (list != null) {
      characters.addAll(list);
      state.value = States.COMPLETED;
      stateAddItems.value = States.COMPLETED;
    }
  }

  void goToCharacterPage(int id) {
    Get.toNamed(
      AppRoutes.character,
      arguments: {"id": id},
    );
  }
}
