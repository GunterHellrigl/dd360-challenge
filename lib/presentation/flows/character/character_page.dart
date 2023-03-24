import 'package:dd3challenge/presentation/constants/text_styles.dart';
import 'package:dd3challenge/presentation/flows/character/character_controller.dart';
import 'package:dd3challenge/presentation/states.dart';
import 'package:dd3challenge/presentation/widgets/image_list/image_item.dart';
import 'package:dd3challenge/presentation/widgets/image_list/image_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CharacterPage extends StatelessWidget {
  CharacterPage({Key? key}) : super(key: key);

  final CharacterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Character Details"),
      ),
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              controller.state.value == States.LOADING
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : controller.state.value == States.ERROR
                      ? const Center(
                          child: Text("Ups.. error!"),
                        )
                      : Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.network("${controller.character.value?.thumbnailURI}"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 16),
                                      Text(
                                        "${controller.character.value?.name}",
                                        style: const TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        "${controller.character.value?.description}",
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Comics",
                                          style: kPrimaryTextStyle,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Obx(
                                        () => ImageList(
                                          width: 150,
                                          height: 170,
                                          isLoading: controller.stateComics.value == States.LOADING,
                                          imageItems: controller.comics
                                              .map((e) =>
                                                  ImageItem(id: e.id, imageURI: e.thumbnailURI))
                                              .toList(),
                                          onTapItem: (int id) {
                                            print("tapped the image item: $id");
                                          },
                                          showSeeMoreButton: false,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Series",
                                          style: kPrimaryTextStyle,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Obx(
                                        () => ImageList(
                                          width: 150,
                                          height: 170,
                                          isLoading: controller.stateSeries.value == States.LOADING,
                                          imageItems: controller.series
                                              .map((e) =>
                                                  ImageItem(id: e.id, imageURI: e.thumbnailURI))
                                              .toList(),
                                          onTapItem: (int id) {
                                            print("tapped the image item: $id");
                                          },
                                          showSeeMoreButton: false,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Events",
                                          style: kPrimaryTextStyle,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Obx(
                                        () => ImageList(
                                          width: 150,
                                          height: 170,
                                          isLoading: controller.stateEvents.value == States.LOADING,
                                          imageItems: controller.events
                                              .map((e) =>
                                                  ImageItem(id: e.id, imageURI: e.thumbnailURI))
                                              .toList(),
                                          onTapItem: (int id) {
                                            print("tapped the image item: $id");
                                          },
                                          showSeeMoreButton: false,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "Stories",
                                          style: kPrimaryTextStyle,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      ...controller.stories
                                          .map(
                                            (e) => Align(
                                              alignment: Alignment.centerLeft,
                                              child: ListTile(
                                                title: Text(e.title),
                                                subtitle: Text(e.description),
                                              ),
                                            ),
                                          )
                                          .toList(),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),
                              ],
                            ),
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
