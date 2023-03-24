import 'package:dd3challenge/presentation/flows/character_list/character_list_controller.dart';
import 'package:dd3challenge/presentation/states.dart';
import 'package:dd3challenge/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterListPage extends StatelessWidget {
  CharacterListPage({Key? key}) : super(key: key);

  final CharacterListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters"),
      ),
      body: SafeArea(
        child: Obx(
          () => Container(
            child: controller.state.value == States.LOADING
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : controller.state.value == States.ERROR
                    ? const Center(
                        child: Text("Ups.. Error"),
                      )
                    : GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.characters.length,
                        controller: controller.scrollController,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.6,
                        ),
                        itemBuilder: (context, index) {
                          if (index >= controller.characters.length - 1) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          return CharacterItem(
                            id: controller.characters[index].id,
                            imageURI: controller.characters[index].thumbnailURI,
                            title: controller.characters[index].name,
                            onTap: (id) {
                              controller.goToCharacterPage(id);
                            },
                          );
                        },
                      ),
          ),
        ),
      ),
    );
  }
}
