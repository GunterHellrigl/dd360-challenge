import 'package:dd3challenge/presentation/constants/text_styles.dart';
import 'package:dd3challenge/presentation/flows/home/home_controller.dart';
import 'package:dd3challenge/presentation/states.dart';
import 'package:dd3challenge/presentation/widgets/image_list/image_item.dart';
import 'package:dd3challenge/presentation/widgets/image_list/image_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Characters",
                  style: kPrimaryTextStyle,
                ),
                Obx(
                  () => ImageList(
                    width: 150,
                    height: 170,
                    isLoading: controller.stateCharacters.value == States.LOADING,
                    imageItems: controller.characters
                        .map((e) => ImageItem(id: e.id, imageURI: e.thumbnailURI))
                        .toList(),
                    onTapItem: (int id) {
                      controller.goToCharacterPage(id);
                    },
                    showSeeMoreButton: true,
                    onTapSeeMore: () {
                      controller.goToCharacterListPage();
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Comics",
                  style: kPrimaryTextStyle,
                ),
                Obx(
                  () => ImageList(
                    width: 150,
                    height: 170,
                    isLoading: controller.stateComics.value == States.LOADING,
                    imageItems: controller.comics
                        .map((e) => ImageItem(id: e.id, imageURI: e.thumbnailURI))
                        .toList(),
                    onTapItem: (int id) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Out of scope"),
                        ),
                      );
                    },
                    showSeeMoreButton: true,
                    onTapSeeMore: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Out of scope"),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Series",
                  style: kPrimaryTextStyle,
                ),
                Obx(
                  () => ImageList(
                    width: 150,
                    height: 170,
                    isLoading: controller.stateSeries.value == States.LOADING,
                    imageItems: controller.series
                        .map((e) => ImageItem(id: e.id, imageURI: e.thumbnailURI))
                        .toList(),
                    onTapItem: (int id) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Out of scope"),
                        ),
                      );
                    },
                    showSeeMoreButton: true,
                    onTapSeeMore: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Out of scope"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
