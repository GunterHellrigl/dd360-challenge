import 'package:dd3challenge/presentation/widgets/image_list/image_item.dart';
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget {
  const ImageList({
    Key? key,
    required this.width,
    required this.height,
    required this.isLoading,
    required this.imageItems,
    required this.onTapItem,
    required this.showSeeMoreButton,
    this.onTapSeeMore,
  }) : super(key: key);

  final double width;
  final double height;
  final bool isLoading;
  final List<ImageItem> imageItems;
  final Function(int id) onTapItem;
  final bool showSeeMoreButton;
  final Function()? onTapSeeMore;

  @override
  Widget build(BuildContext context) {
    if (showSeeMoreButton && !imageItems.contains(ImageItem.buttonSeeMore)) {
      imageItems.add(ImageItem.buttonSeeMore);
    }

    return SizedBox(
      height: height,
      child: (isLoading)
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageItems.length,
              itemBuilder: (context, index) {
                if (imageItems[index] == ImageItem.buttonSeeMore) {
                  return Container(
                    constraints: BoxConstraints.tightFor(width: width),
                    child: TextButton(
                      onPressed: () {
                        if (onTapSeeMore != null) onTapSeeMore!();
                      },
                      child: const Text("See more"),
                    ),
                  );
                }

                return InkWell(
                  onTap: () {
                    onTapItem(imageItems[index].id);
                  },
                  child: Container(
                    constraints: BoxConstraints.tightFor(width: width),
                    margin: const EdgeInsets.only(right: 4),
                    child: Image.network(
                      imageItems[index].imageURI,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
