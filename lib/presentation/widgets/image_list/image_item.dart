class ImageItem {
  ImageItem({
    required this.id,
    required this.imageURI,
  });

  final int id;
  final String imageURI;

  static ImageItem buttonSeeMore = ImageItem(id: -1, imageURI: "{see-more}");
}
